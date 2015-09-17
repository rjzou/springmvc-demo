package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.RoomMoney;
import com.tiaotiao.web.utils.Dao;
import com.tiaotiao.web.utils.DateUtil;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class RoomMoneyService {
	@Resource
	private Dao dao;
	
	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(RoomMoneyService.class.getName());
	
	/**
	 * 插入 RoomMoney 表数据
	 * @param rm
	 * @return
	 * @throws Exception
	 */
	public int insertRoomMoney(RoomMoney rm) throws Exception{
		Object[] params = { rm.getHouseid(), rm.getRoomno(),rm.getMonthmoney(),rm.getPressmoney(),rm.getRoommoney(),rm.getYear(),rm.getMonth(),rm.getDay(), rm.getCreated()};
		String sql = "insert into t_room_money(houseid,roomno,monthmoney,pressmoney,roommoney,year,month,day,created) "
				+ " values(?,?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param rm
	 * @return
	 * @throws Exception
	 */
	public int updateRoomMoney(RoomMoney rm) throws Exception{
		Object[] params = { rm.getMonthmoney(),rm.getPressmoney() , rm.getRoommoney(),rm.getYear(), rm.getMonth(), rm.getUpdated() ,rm.getHouseid(), rm.getRoomno()};
		String sql = "update t_room_money set monthmoney = ?,pressmoney= ? , roommoney = ?,year = ?,month = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
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
	 * 
	 * @param houseid
	 * @param roomno
	 * @param year
	 * @param day
	 * @return
	 * @throws Exception
	 */
	public RoomMoney getRoomMoneyById(String houseid,int roomno,int year,int month) throws Exception{
		Object[] params = { houseid,roomno,year,month};
		String sql = "select houseid,roomno,roommoney,year,month,day,created from t_room_money where houseid = ? and roomno = ? and year = ? and month = ? ";
		return dao.findFirst(RoomMoney.class,sql, params);
	}
	
	/**
	 * 查找本月还没有收房租的在住房
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getAllRoomfulMapByMonth(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String houseid = params.get("houseid"); 
		String roomtypeid = params.get("roomtypeid");
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();
		int pre_month = month - 1;
		String sql = " 		SELECT "+
					" 			h.housename, "+
					" 			r.houseid, "+
					" 			r.roomno, "+
					" 			cus.id as customid, "+
					" 			cus.customname, "+
					" 			rm.monthmoney, "+
					" 			rm.pressmoney, "+
					" 			rt.typename, "+
					" 			CONCAT_WS('-',c.year,c.month,c.day) as in_date, "+
					" 			CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_date, "+
					" 			rm.roommoney, "+
					" 			c.day AS cin_day "+
					" 		FROM "+
					" 			t_room AS r, "+
					" 			t_room_type AS rt, "+
					" 			t_house AS h, "+
					" 			t_checkin AS c, "+
					" 			t_custom AS cus, "+
					" 			v_room_money_last AS rml, "+
					" 			t_room_money AS rm "+
					" 		WHERE "+
					" 			r.houseid = h.id "+
					" 		AND r.houseid = c.houseid "+
					" 		AND r.roomno = c.roomno "+
					" 		AND c.customid = cus.id "+
					" 		AND r.houseid = c.houseid "+
					" 		AND c.houseid = rml.houseid "+
					" 		AND c.roomno = rml.roomno "+
					" 		AND rm.houseid = rml.houseid "+
					" 		AND rm.roomno = rml.roomno "+
					" 		AND rm.year = rml.last_year "+
					" 		AND rm.month = rml.last_month "+
					" 		AND rt.typecode = r.typecode ";
//					" 		AND r.houseid IN ( "+
//					" 		'89635a0e-418a-11e5-9172-fdf195657018', "+
//					" 		'97c2b41f-418a-11e5-9172-ade6bde32708' "+
//					" 		) "+
//					" 		AND rm.month <> 9 ";
				sql = sql + " and rm.month <>  " + month;
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND r.typecode in ('"+roomtypeid+"')";
				}
				sql = sql +" and r.houseid in ("+permissionService.getUserHouses(username)+")";
				
		return dao.find(sql, null, pageRequest);
	}
	
	public Page<Map<String, Object>> queryAllRoomMoneyByParams(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String roomno = params.get("roomno");
		String sql = " SELECT "+
				"     h.housename, " +
				"     r.houseid, " +
				"     r.roomno, " + 
				"	  rt.typename," +
				"     cus.customname," +
				"     rm.monthmoney, " +
				"     rm.pressmoney, " +
				"     CONCAT_WS('-',c.year,c.month,c.day) as in_day, " +
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
				"     t_custom AS cus " +
				" WHERE " +
				"     r.houseid = h.id " +
				" AND r.houseid = c.houseid " +
				" AND r.roomno = c.roomno " + 
				" AND r.typecode = rt.typecode " + 
				" AND c.customid = cus.id " + 
				" AND r.houseid = rm.houseid " +
				" AND r.roomno = rm.roomno ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND c.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " AND c.roomno in ("+roomno+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND rt.typecode in ('"+roomtypeid+"')";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				sql = sql + " order by rm.year desc,rm.month desc,rm.day desc,rm.created desc ";
		return dao.find(sql, null, pageRequest);
	}
	
	public Map<String,Object> getRoomMoneyQueryPageMapById(String houseid,int roomno,int year,int month) throws Exception{
		Object[] params = { houseid,roomno,year,month};
//		int year = DateUtil.getThisYear();
//		int month = DateUtil.getThisMonth() -1 ;
		String sql = " SELECT "+
                "     h.housename, "+
                "     r.houseid, "+
                "     r.roomno, "+
                "     c.customname,"+
                "     rm.monthmoney, "+
                "     rm.pressmoney, "+
                "     CONCAT_WS('-',c.year,c.month,c.day) as in_day, " + 
                "     rm.year as s_year,"+ 
                "     rm.month as s_month,"  + 
                "     rm.day as s_day ,"+
                "     CONCAT_WS('-',rm.year,rm.month,rm.day) as s_date, "+
                "     rm.roommoney, "+ 
                "     rm.year as d_year, "+ 
                "     rm.month as d_month, " + 
                "     nc.netprice, "+ 
                "     nc.ip, "+ 
                "     c.trash, " + 
                "     c.keycount, "+ 
                "     c.keyprice,"+ 
                "     we.water, "+ 
                "     we.waterprice, "+ 
                "     we.elect, "+ 
                "     we.electprice"+
                " FROM "+
                "     t_room AS r, "+
                "     t_house AS h, "+
                "     t_checkin AS c, "+ 
                "     t_waterelect AS we,"+
                "     t_room_money AS rm,"+ 
                "     t_net_cfg as nc "+
                " WHERE "+
                "     r.houseid = h.id "+
                " AND r.houseid = c.houseid "+
                " AND r.roomno = c.roomno "+ 
                " AND c.houseid = we.houseid "+ 
                " AND c.roomno = we.roomno " + 
                " AND c.roomno = nc.roomno " + 
                " AND c.houseid = nc.houseid " + 
                " AND we.year = rm.year "+ 
                " AND we.month = rm.month "+
                " AND r.houseid = rm.houseid "+
                " AND r.roomno = rm.roomno " + 
				" AND c.houseid = ? "+
				" AND c.roomno = ? "+
				" AND we.year = ? "+ 
				" AND we.month = ? " ;
		
		logger.log(Level.INFO, sql);
		return dao.findFirst(sql, params);
	}
	
	/**
	 *  显示入住信息
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getRoomMoneyCheckinMapById(String houseid,int roomno) throws Exception{
		int year = DateUtil.getThisYear();
		int pre_month = DateUtil.getThisMonth() -1 ;
		Object[] params = { houseid,roomno,year,pre_month};
		String sql = " SELECT "+
					"     h.housename, "+
					"     c.houseid, "+
					"     c.roomno, "+
					"     cus.customname, "+
					"     cus.iphone, "+
					"     cus.cardid, "+
					"     rm.monthmoney, "+
					"     rm.pressmoney, "+
//					"     c.internet, "+
					"     c.trash, "+
					"     c.keycount, "+
					"     c.keyprice, "+
					"     CONCAT_WS('-',we.year,we.month,we.day) as pre_s_date, " + 
					"     we.water, "+ 
					"     we.elect, "+
					"     c.created "+
					" FROM "+
					"     t_checkin as c, "+
					"     t_custom as cus, "+
					"     t_house as h, "+
					"     t_waterelect as we , "+ 
					"  	  t_room_money as rm"+
					" WHERE "+
					"     c.houseid = h.id "+
					" AND c.houseid = we.houseid "+
					" AND c.roomno = we.roomno " + 
					" AND c.houseid = rm.houseid " + 
					" AND c.roomno = rm.roomno " + 
					" AND c.customid = cus.id " + 
					" AND we.year = rm.year " + 
					" AND we.month = rm.month " + 
					" AND c.houseid = ? "+
					" AND c.roomno = ? "+
					" AND we.year = ? "+ 
					" AND we.month = ? ";
				
		return dao.findFirst(sql, params);
	}
}
