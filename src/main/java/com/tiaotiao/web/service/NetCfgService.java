package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 网络开通表service
 * 
 * @author zouruijin
 */
@Service
public class NetCfgService {
	@Resource
	private Dao dao;
	
	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(NetCfgService.class.getName());
	
	/**
	 * 插入网络配置表数据
	 * @param nc
	 * @return
	 * @throws Exception
	 */
	public int insertNetCfg(NetCfg nc) throws Exception{
		Object[] params = {nc.getHouseid(),nc.getRoomno(),nc.getIp(),nc.getUsr(),nc.getPwd(),nc.getNetprice(), nc.getYear(), nc.getMonth(),nc.getDay(), nc.getCreated()};
		String sql = "insert into t_net_cfg(houseid,roomno,ip,usr,pwd,netprice,year,month,day,created) values(?,?,?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 修改网络配置表数据
	 * @param nc
	 * @return
	 * @throws Exception
	 */
	public int updateNetCfg(NetCfg nc) throws Exception{
		Object[] params = { nc.getIp(),nc.getUsr(),nc.getPwd(), nc.getNetprice(), nc.getUpdated(),nc.getHouseid(),nc.getRoomno()};
		String sql = "update t_net_cfg set ip = ?,usr = ?,pwd = ?,netprice = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param nc
	 * @return
	 * @throws Exception
	 */
	public int updateNetCfgPrice(NetCfg nc) throws Exception{
		Object[] params = { nc.getNetprice(), nc.getUpdated(),nc.getHouseid(),nc.getRoomno()};
		String sql = "update t_net_cfg set netprice = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public int deleteNetCfg(String houseid,int roomno) throws Exception{
		Object[] params = { houseid, roomno};
		String sql = "delete from  t_net_cfg where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 取得在用网络表实体数据
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public NetCfg getNetCfgById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,ip,usr,pwd,year,netprice,month,day,created,updated from t_net_cfg where houseid = ? and roomno = ? ";
		return dao.findFirst(NetCfg.class,sql, params);
	}
	
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getNetCfgMapById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "  select r.houseid,h.housename,r.roomno,ci.customname,40 as netprice from t_house as h ,t_room as r,t_checkin as ci "+
				"  where h.id = r.houseid "+
				"  and r.houseid = ci.houseid "+
				"  and r.roomno = ci.roomno "+
				"  and r.houseid = ? "+
				"  and r.roomno = ? ";
		return dao.findFirst(sql, params);
	}
	
	/**
	 * 查询没有开通网络的房间数据
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getEmptyNetListByParams(Map<String, String> params, final PageRequest pageRequest ,String username ) throws Exception{
		String houseid = params.get("houseid");
		String roomno = params.get("roomno");
		String sql = "  select r.houseid,h.housename,r.roomno,ci.customname,40 as netprice from t_house as h ,t_room as r,t_checkin as ci  "+
						"  where h.id = r.houseid "+
						"  and r.houseid = ci.houseid "+
						"  and r.roomno = ci.roomno "+
						"  and (ci.houseid,ci.roomno) not in "+
						"  (select houseid,roomno from t_net_cfg) ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and ci.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " and ci.roomno in ('"+roomno+"')";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				sql = sql + " order by ci.houseid,ci.roomno ";
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 查询有开通网络的房间数据
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getHasNetListByParams(Map<String, String> params, final PageRequest pageRequest , String username) throws Exception{
		String houseid = params.get("houseid");
		String roomno = params.get("roomno");
		String sql = "  select r.houseid,h.housename,r.roomno,ci.customname,40 as netprice from t_house as h ,t_room as r,t_checkin as ci ,t_net_cfg as nc "+
						"  where h.id = r.houseid "+
						"  and r.houseid = ci.houseid "+
						"  and r.roomno = ci.roomno "+
						"  and ci.houseid = nc.houseid"+
						"  and ci.roomno = nc.roomno ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and ci.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " and ci.roomno in ('"+roomno+"')";
				}
				
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				
				sql = sql + " order by ci.year,ci.month,ci.day ";
		return dao.find(sql, null, pageRequest);
	}
}
