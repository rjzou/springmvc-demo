package com.tiaotiao.web.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.ObjectUtils.Null;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.Custom;
import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.RoomMoney;
import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.entity.UserHouses;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.utils.Dao;
import com.tiaotiao.web.utils.DateUtil;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class CheckinService {
	@Resource
	private Dao dao;
	
	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(CheckinService.class.getName());
	
	/**
	 * 
	 * @param checkin
	 * @return
	 * @throws Exception
	 */
//	public int insertCheckin(Checkin checkin) throws Exception{
//		Object[] params = { checkin.getHouseid(), checkin.getRoomno(),checkin.getCustomname(),checkin.getIphone(),checkin.getCardid(), 
//				checkin.getMonthmoney(),checkin.getPressmoney(),checkin.getInternet(),checkin.getIp(), 
//				checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice(),checkin.getYear(),checkin.getMonth(),checkin.getDay(), checkin.getCreated()};
//		String sql = "insert into t_checkin(houseid,roomno,customname,iphone,cardid,monthmoney,pressmoney,internet,ip,trash,"
//				+ "keycount,keyprice,year,month,day,created) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
//		int n = dao.update(sql, params);
//		return n;
//	}
//	/**
//	 * 
//	 * @param checkin
//	 * @return
//	 * @throws Exception
//	 */
//	public int updateCheckin(Checkin checkin) throws Exception{
//		Object[] params = { checkin.getCustomname(), checkin.getIphone(),checkin.getCardid(), checkin.getMonthmoney(),checkin.getPressmoney(), 
//				checkin.getInternet(),checkin.getIp(),checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice(),
//				checkin.getYear(),checkin.getMonth(),checkin.getDay(),checkin.getUpdated(),checkin.getHouseid(),checkin.getRoomno()};
//		String sql = "update t_checkin set customname = ?,iphone = ?,cardid = ?,monthmoney = ?,pressmoney = ?,internet = ?,ip = ?,"
//				+ "trash = ?,keycount = ?,keyprice = ?,year = ?,month = ?,day = ?,updated =? where houseid=? and roomno =? ";
//		int n = dao.update(sql, params);
//		return n;
//	}
	
	public int deleteCheckin(String houseid,int roomno) throws Exception{
		Object[] params = { houseid, roomno};
		String sql = "delete from  t_checkin where houseid = ? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Checkin getCheckinById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,customid,trash,keycount,keyprice,year,month,day,created from t_checkin where houseid = ? and roomno = ? ";
		return dao.findFirst(Checkin.class,sql, params);
	}
	/**
	 * 
	 * @param customid
	 * @return
	 * @throws Exception
	 */
	public Checkin getCheckinByCustomId(String customid) throws Exception{
		Object[] params = { customid };
		String sql = "select houseid,roomno,customid,trash,keycount,keyprice,year,month,day,created from t_checkin where customid = ? ";
		return dao.findFirst(Checkin.class,sql, params);
	}
	
//	/**
//	 * 
//	 * @param params
//	 * @param pageRequest
//	 * @return
//	 * @throws Exception
//	 */
//	public Page<Map<String, Object>> selectAllRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
//		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h where r.houseid = h.id ";
//		return dao.find(sql, null, pageRequest);
//	}
	
	/**
	 *  显示入住信息
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getCheckinMapById(String houseid,int roomno) throws Exception{
//		int year = DateUtil.getThisYear();
//		int pre_month = DateUtil.getThisMonth() -1 ;
		Object[] params = { houseid,roomno};
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	c.houseid, "+
				" 	c.roomno, "+
				" 	cus.customname, "+
				" 	cus.iphone, "+
				" 	cus.cardid, "+
				" 	rm.monthmoney, "+
				" 	rm.pressmoney, "+
				" 	rm.roommoney, "+
				" 	nc.netprice, "+
				" 	c.trash, "+
				" 	c.keycount, "+
				" 	c.keyprice, "+
				" 	CONCAT_WS( "+
				" 		'-', "+
				" 		rm.year, "+
				" 		rm.month, "+
				" 		rm.day "+
				" 	) AS pre_s_date, "+
				" 	we.water, "+
				" 	we.elect, "+
				" 	c.created "+
				" FROM "+
				" 	t_checkin AS c, "+
				" 	t_custom AS cus, "+
				"   t_net_cfg as nc, "+
				" 	t_house AS h, "+
				" 	t_waterelect AS we, "+
				"   t_room_money as rm, "+
				"   v_room_money_last as rml "+
				" WHERE "+
				" 	c.houseid = h.id "+
				" AND c.houseid = we.houseid "+
				" AND c.roomno = we.roomno "+
				" AND c.customid = cus.id "+
				" AND rm.year = we.year "+
				" AND rm.month = we.month "+
				" AND c.houseid = rm.houseid "+
				" AND c.roomno = rm.roomno "+
				" AND c.houseid = rml.houseid "+
				" AND c.roomno = rml.roomno "+
				" AND rm.year = rml.last_year "+
				" AND rm.month = rml.last_month "+
				" AND c.houseid = nc.houseid "+
				" AND c.roomno = nc.roomno "+
				" AND c.houseid = ? "+
				" AND c.roomno = ? ";
		logger.log(Level.INFO, sql);
		
		return dao.findFirst(sql, params);
	}
	
	/**
	 * 查找空房
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllEmptyRoom(String houseid,String roomtypeid,String roomno, final PageRequest pageRequest,String username) throws Exception{
		
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,rt.typename "
				+ " from t_room as r,t_room_type as rt,t_house as h "
				+ " where r.houseid = h.id "
				+ " and r.typecode = rt.typecode "
				+ " and (r.houseid,r.roomno) not in (select houseid,roomno from t_checkin)  ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ("+roomtypeid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " and r.roomno  like  '%"+roomno+"%'";
				}
				sql = sql +" and r.houseid in ("+permissionService.getUserHouses(username)+")";
				
				logger.log(Level.INFO, sql);
				
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 入住查询功能
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryAllRoomfulByParams(String houseid,String roomtypeid,String roomno, final PageRequest pageRequest,String username) throws Exception{
		String sql = " SELECT "+
				"     h.housename, " +
				"     r.houseid, " +
				"     r.roomno, " + 
				"	  rt.typename," +
				"     cus.customname," +
				"     rm.monthmoney, " +
				"     rm.pressmoney, " +
				"     CONCAT_WS('-',c.year,c.month,c.day) as in_date, " +
				"     CONCAT_WS('-',rm.year,rm.month,rm.day) as s_date, " +
				"     rm.roommoney, " + 
				"     rm.year as d_year, " + 
				"     rm.month as d_month" +
				" FROM "+
				"     t_room AS r, "+
				"     t_house AS h," + 
				"     t_room_type AS rt, " +
				"     t_checkin AS c, " +
				"     t_room_money AS rm, " +
				"     v_room_money_last AS rml, " +
				"     t_custom AS cus " +
				" WHERE " +
				"     r.houseid = h.id " +
				" AND r.houseid = c.houseid " +
				" AND r.roomno = c.roomno " + 
				" AND r.typecode = rt.typecode " + 
				" AND r.houseid = rm.houseid " +
				" AND r.roomno = rm.roomno " +
				" AND rm.houseid = rml.houseid " +
				" AND rm.roomno = rml.roomno " +
				" AND rm.year = rml.last_year " +
				" AND rm.month = rml.last_month " +
				" AND c.customid = cus.id " ;
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND c.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " AND c.roomno  like  '%"+roomno+"%'";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND rt.typecode in ("+roomtypeid+")";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+")";
				sql = sql + " order by c.year desc,c.month desc,c.day desc,c.created desc ";
				
				logger.log(Level.INFO, sql);
				
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getCheckinQueryPageMapById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	cus.customname, "+
				" 	CONCAT_WS('-', c.year, c.month, c.day) AS in_date, " + 
				"   datediff(now(), CONCAT_WS('-', c.year, c.month, c.day)) as in_days "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_house AS h, "+
				" 	t_checkin AS c, "+
				" 	t_custom AS cus "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND r.houseid = c.houseid "+
				" AND r.roomno = c.roomno "+
				" AND c.customid = cus.id "+
				" AND c.houseid = ? "+
				" AND c.roomno = ? " ;
		
		logger.log(Level.INFO, sql);
		
		return dao.findFirst(sql, params);
	}
	
	public Page<Map<String, Object>> queryAllRoomMoneyMapByParams(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomno = params.get("roomno");
//		int year = DateUtil.getThisYear();
//		int month = DateUtil.getThisMonth();
//		Object[] sql_params = {year,month};
		
		String sql = " SELECT "+
						"         ci.houseid, "+
						"         ci.roomno, "+
						"         rm.monthmoney, "+
						"         rm.pressmoney, "+
						"         CONCAT_WS('-',rm.year,rm.month,rm.day) as s_date, "+
						"         ci.trash, "+
						"         nc.netprice, "+
						"         (ci.keycount * ci.keyprice) as sum_keyprice, "+
						"         we.water, "+
						"         we.waterprice, "+
						"         we.elect, "+
						"         we.electprice, "+
						"         rm.roommoney "+
						" FROM "+
						"         t_checkin as ci, "+ 
						" 		  t_waterelect as we," + 
						"		  t_net_cfg as nc,"+
						"         t_room_money as rm "+
						" WHERE "+
						"         ci.houseid = rm.houseid "+
						" AND ci.roomno = rm.roomno " + 
						" AND ci.houseid = we.houseid " +
						" AND ci.roomno = we.roomno " +
						" AND ci.houseid = nc.houseid " +
						" AND ci.roomno = nc.roomno " +
						" AND we.year = rm.year " + 
						" AND we.month = rm.month ";
						if (houseid != null && houseid.trim().length() > 0 ) {
							sql = sql + " AND ci.houseid in ('"+houseid+"')";
						}
						if (roomno != null && roomno.trim().length() > 0 ) {
							sql = sql + " AND ci.roomno in ("+roomno+")";
						}
						sql = sql + " order by rm.created asc ";
						
						logger.log(Level.INFO, sql);
						
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @param year
	 * @param month
	 * @return
	 * @throws SQLException
	 */
	public Object getRoomMoneyTimes(String houseid,int roomno,int year,int month) throws SQLException{
		Object[] params = { houseid,roomno,year,month};
		String sql =" select count(1) as times from t_room_money as rm "+
					" where rm.houseid = ? " + 
					" and rm.roomno = ? " + 
					" and rm.year <= ? " + 
					" and rm.month <= ?"; 
		logger.log(Level.INFO, sql);
		Object o= dao.findBy(sql,"times",params);
		return o;
	}
	/**
	 * 取得一栋楼入住数量
	 * @param houseid
	 * @return
	 * @throws SQLException
	 */
	public Object getCheckinCountByHouseid(int houseid) throws SQLException{
		Object[] params = { houseid};
		String sql =" select count(1) as cnt from t_checkin as c "+
					" where c.houseid = ? "; 
		logger.log(Level.INFO, sql);
		Object o= dao.findBy(sql,"cnt",params);
		return o;
	}
	
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws SQLException
	 */
	public Object getCheckinCountByHouseidAndRoomno(int houseid,int roomno) throws SQLException{
		Object[] params = { houseid,roomno};
		String sql =" select count(1) as cnt from t_checkin as c "+
					" where c.houseid = ? " + 
					" and c.roomno = ?"; 
		logger.log(Level.INFO, sql);
		Object o= dao.findBy(sql,"cnt",params);
		return o;
	}
//	/**
//	 * 得到空房的数量
//	 * @param houseid
//	 * @param roomno
//	 * @return
//	 * @throws SQLException
//	 */
//	public Object getEmptyRoomCount() throws SQLException{
//		String sql =" select count(1) as cnt from t_room as r "+
//				" where (r.houseid,r.roomno) not in "+
//				" (select ci.houseid,ci.roomno from t_checkin as ci) "; 
//		
//		
//		logger.log(Level.INFO, sql);
//		Object o= dao.findBy(sql,"cnt");
//		return o;
//	}
	/**
	 * 统计  还有空房x间, 今天入住x间, 今天退房x间  
	 * @return
	 * @throws Exception
	 */
	public Object[] getRoomTongJi(String username) throws Exception{
		Connection conn = dao.getConn(false);
		Object[] params = { username };
		String pro_sql = " {CALL p_get_room_tongji(?)} ";
		Object[] result = dao.execProc(pro_sql, conn, params);
		return result;
	}
	
	/**
	 * 执行入住一系列操作
	 * @param checkin
	 * @param custom
	 * @param roomMoney
	 * @param waterElect
	 * @param netCfg
	 * @return
	 * @throws Exception
	 */
	public int insertCheckIn(Checkin checkin,Custom custom,RoomMoney roomMoney,WaterElect waterElect,NetCfg netCfg) throws Exception{
		Connection conn = dao.getConn(false);
		Object[] params = { checkin.getHouseid(),checkin.getRoomno(),custom.getId(),custom.getCustomname(),custom.getIphone(),
							custom.getCardid(),roomMoney.getMonthmoney(),roomMoney.getPressmoney(),roomMoney.getRoommoney(),
							waterElect.getWater(),waterElect.getElect(),netCfg.getIp(),checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice()};
		String pro_sql = " {CALL p_insert_checkin(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)} ";
		Object[] result = dao.execProc(pro_sql, conn, params);
		int n = Integer.valueOf(result[0].toString());
		return n;
	}
	/**
	 * 执行入住修改一系列操作
	 * @param checkin
	 * @param custom
	 * @param roomMoney
	 * @param waterElect
	 * @param netCfg
	 * @return
	 * @throws Exception
	 */
	public int updateCheckIn(Checkin checkin,Custom custom,RoomMoney roomMoney,WaterElect waterElect,NetCfg netCfg) throws Exception{
		Connection conn = dao.getConn(false);
		Object[] params = { checkin.getHouseid(),checkin.getRoomno(),custom.getId(),custom.getCustomname(),custom.getIphone(),
							custom.getCardid(),roomMoney.getMonthmoney(),roomMoney.getPressmoney(),roomMoney.getRoommoney(),
							waterElect.getWater(),waterElect.getElect(),netCfg.getIp(),checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice()};
		String pro_sql = " {CALL p_update_checkin(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)} ";
		Object[] result = dao.execProc(pro_sql, conn, params);
		int n = Integer.valueOf(result[0].toString());
		return n;
	}
}
