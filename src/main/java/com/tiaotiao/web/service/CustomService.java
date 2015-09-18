package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Custom;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 客户 Custom 信息表
 * @author zouruijin
 */
@Service
public class CustomService {
	@Resource
	private Dao dao;
	
	private Logger logger = Logger.getLogger(CustomService.class.getName());
	
	
	/**
	 * 插入客户表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int insertCustom(Custom c) throws Exception{
		Object[] params = { c.getId(), c.getCustomname(), c.getIphone(),c.getCardid(),c.getYear(), c.getMonth(),c.getDay(), c.getCreated()};
		String sql = "insert into t_custom(id,customname,iphone,cardid,year,month,day,created) values(?,?,?,?,?,?,?,?) ";
		logger.log(Level.INFO, sql);
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 修改客户表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int updateCustom(Custom c) throws Exception{
		Object[] params = { c.getCustomname(),c.getIphone(),c.getCardid(),c.getUpdated(), c.getId()};
		String sql = "update t_custom set customname = ?,iphone = ?,cardid = ?,updated =? where id=? ";
		logger.log(Level.INFO, sql);
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 取得客户表实体数据
	 * @param house_id
	 * @param room_no
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public Custom getCustomById(String id) throws Exception{
		Object[] params = { id};
		String sql = "select customname,iphone,cardid,year,month,day,created,updated from t_custom where id = ? ";
		logger.log(Level.INFO, sql);
		return dao.findFirst(Custom.class,sql, params);
	}

	/**
	 * 
	 * @param customname
	 * @param iphone
	 * @param pageRequest
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryAllCustomByParams(String customname,String iphone, final PageRequest pageRequest,String username) throws Exception{
		String sql = " select c.id, "+ 
				" c.customname, "+
				" c.iphone, "+
				" c.cardid, "+
				" CONCAT_WS('-',c.year,c.month,c.day) as in_date "+
				" from t_custom as c where 1=1 " ;
				if (customname != null && customname.trim().length() > 0 ) {
					sql = sql + " AND c.customname  like  '%"+customname+"%'";
				}
				if (iphone != null && iphone.trim().length() > 0 ) {
					sql = sql + " AND c.iphone  like  '%"+iphone+"%'";
				}
				sql = sql + " order by c.year desc,c.month desc,c.day desc,c.created desc ";
				
				logger.log(Level.INFO, sql);
				
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 
	 * @param customid
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryOnlineRoomMapByCustomId(String customid, final PageRequest pageRequest) throws Exception{
		Object[] params = { customid };
		String sql =  " select ci.houseid, "+
						" h.housename, "+
						" ci.roomno, "+
						" rt.typename, "+
						" CONCAT_WS('-',ci.year,ci.month,ci.day) as in_date, "+
						" sum(rm.roommoney) as sum_roommoney, "+
						" datediff(now(), CONCAT_WS('-', ci.year, ci.month, ci.day)) as in_days "+
						" from t_checkin as ci, "+
						" t_room as r, "+
						" t_house as h, "+
						" t_room_type as rt, "+
						" t_room_money as rm "+
						" where  "+
						" h.id = r.houseid "+
						" and r.houseid = ci.houseid "+
						" and r.roomno = ci.roomno "+
						" and r.houseid = rm.houseid "+
						" and r.roomno = rm.roomno "+
						" and r.typecode = rt.typecode "+
						" and ci.customid = ? ";
						
						logger.log(Level.INFO, sql);
						
		return dao.find(sql, params, pageRequest);
	}
	/**
	 * 
	 * @param customid
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryOfflineRoomMapByCustomId(String customid, final PageRequest pageRequest) throws Exception{
		Object[] params = { customid };
		String sql =  " select co.houseid, "+
						" h.housename, "+
						" co.roomno, "+
						" rt.typename, "+
						" CONCAT_WS('-',co.inyear,co.inmonth,co.inday) as in_date, "+
						" CONCAT_WS('-',co.year,co.month,co.day) as out_date, "+
						" sum(rm.roommoney) as sum_roommoney, "+
						" datediff(CONCAT_WS('-', co.year, co.month, co.day), CONCAT_WS('-', co.inyear, co.inmonth, co.inday)) as in_days "+
						" from t_checkout as co, "+
						" t_room as r, "+
						" t_house as h, "+
						" t_room_type as rt, "+
						" t_room_money as rm "+
						" where  "+
						" h.id = r.houseid "+
						" and r.houseid = co.houseid "+
						" and r.roomno = co.roomno "+
						" and r.houseid = rm.houseid "+
						" and r.roomno = rm.roomno "+
						" and r.typecode = rt.typecode "+
						" and co.customid = ? ";
						
						logger.log(Level.INFO, sql);
						
		return dao.find(sql, params, pageRequest);
	}
}
