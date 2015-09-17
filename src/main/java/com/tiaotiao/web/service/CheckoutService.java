package com.tiaotiao.web.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Checkout;
import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.utils.Dao;
import com.tiaotiao.web.utils.DateUtil;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class CheckoutService {
	@Resource
	private Dao dao;
	
	
	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(CheckoutService.class.getName());
	
	/**
	 * 插入checkout 表数据
	 * 
	 * @param checkout
	 * @return
	 * @throws Exception
	 */
	public int insertCheckout(Checkout checkout) throws Exception{
		Object[] params = { checkout.getHouseid(), checkout.getRoomno(),checkout.getCustomid(), 
				checkout.getMonthmoney(),checkout.getPressmoney(),checkout.getWater(),checkout.getElect(),checkout.getInternet(),
				checkout.getIp(), checkout.getTrash(),checkout.getPaymoney(),checkout.getKeycount(),checkout.getKeyprice(),
				checkout.getYear(),checkout.getMonth(),checkout.getDay(), checkout.getCreated()};
		String sql = "insert into t_checkout(houseid,roomno,customid,monthmoney,pressmoney,water,elect,internet,ip,trash,paymoney,keycount,keyprice,year,month,day,created) "
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 执行退房操作
	 * @param newId 退房编号
	 * @param houseid 需要退房的楼栋号
	 * @param roomno 需要退房的房间号
	 * @param coutmoney  退回的金额
	 * @return 0 退房失败，1 退房成功
	 * @throws Exception
	 */
	public int checkout(String newId,String houseid,int roomno,double coutmoney) throws Exception{
		Connection conn = dao.getConn(false);
		Object[] params = { newId , houseid , roomno , coutmoney};
		String pro_sql = " {CALL p_check_out(?,?,?,?)} ";
		Object[] result = dao.execProc(pro_sql, conn, params);
		int n = Integer.valueOf(result[0].toString());
		return n;
	}
	
	/**
	 * 
	 * @param room
	 * @return
	 * @throws Exception
	 */
	public int updateRoom(Room room,int sourceHouseid,int sourceRoomno) throws Exception{
		Object[] params = { room.getHouseid(), room.getRoomno(), room.getMonthmoney(),room.getPressmoney(), room.getDescription(), room.getUpdated(),sourceHouseid, sourceRoomno};
		String sql = "update t_room set houseid = ?,roomno = ?,monthmoney = ?,pressmoney = ?,description = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h where r.houseid = h.id ";
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Room selectRoomById(String houseid,String roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,monthmoney,pressmoney,description,created from t_room where houseid = ? and roomno = ? ";
		return dao.findFirst(Room.class,sql, params);
	}
	
	/**
	 * 查找在住房
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getAllRoomfulByParams(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	cus.customname, "+
				" 	rm.monthmoney, " +
				" 	rm.pressmoney, " +
				" 	r.description, " + 
				"   rt.typename, "+
				" 	CONCAT_WS('-', c.year, c.month, c.day) AS in_date, "+
				" 	CONCAT_WS('-', rm.year, rm.month, rm.day) AS pre_s_date "+
				" FROM "+
				" 	t_room as r, "+
				" 	t_room_type as rt, "+
				" 	t_house as h, "+
				" 	t_checkin as c, "+
				" 	t_custom as cus, "+
				" 	t_room_money as rm, "+
				" 	v_room_money_last as rml "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND r.houseid = c.houseid "+
				" AND r.roomno = c.roomno "+
				" AND r.typecode = rt.typecode "+
				" AND c.customid = cus.id "+
				" AND c.houseid = rm.houseid "+
				" AND c.roomno = rm.roomno "+
				" AND c.houseid = rml.houseid "+
				" AND c.roomno = rml.roomno "+
				" AND rm.year = rml.last_year "+
				" AND rm.month = rml.last_month ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND r.typecode in ('"+roomtypeid+"')";
				}
				
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				sql = sql + " order by c.year desc,c.month desc,c.day desc,c.created desc ";
				
				logger.log(Level.INFO, sql);
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 查找在住没有抄水电表房
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllNotWaterElectRoom(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();
		Object[] sql_params = {year , month };
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	cus.customname, "+
				" 	rt.typename, "+
				" 	CONCAT_WS('-', c.year, c.month, c.day) as in_date, "+
				"   CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_date, "+
				" 	we.water, "+
				" 	rm.day as cin_day, "+
				" 	we.elect "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_room_type AS rt, "+
				" 	t_house AS h, "+
				" 	t_checkin AS c, "+
				" 	t_custom AS cus, "+
				" 	t_waterelect AS we, "+
				" 	v_waterelect_last AS wel, "+
				"   t_room_money AS rm, "+
				" 	v_room_money_last AS rml "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND c.houseid = r.houseid "+
				" AND c.roomno = r.roomno "+
				" AND r.typecode = rt.typecode "+
				" AND c.houseid = we.houseid "+
				" AND c.roomno = we.roomno "+
				" AND c.houseid = rm.houseid "+
				" AND c.roomno = rm.roomno "+
				" AND c.customid = cus.id "+
				" AND rm.year = rml.last_year "+
				" AND rm.month = rml.last_month "+
				" AND c.houseid = rml.houseid "+
				" AND c.roomno = rml.roomno "+
				" AND c.houseid = wel.houseid "+
				" AND c.roomno = wel.roomno "+
				" AND we.year = wel.last_year "+
				" AND we.month = wel.last_month "+
				" AND (r.houseid, r.roomno) NOT IN ( "+
				" 	SELECT "+
				" 		houseid, "+
				" 		roomno "+
				" 	FROM "+
				" 		t_waterelect "+
				" 	WHERE "+
				" 		1 = 1 "+
				" 	AND YEAR = ? "+
				" 	AND MONTH = ? "+
				" ) ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				
				logger.log(Level.INFO, sql);
		return dao.find(sql, sql_params, pageRequest);
	}
	/**
	 * 取得一栋楼退房数量
	 * @param houseid
	 * @return
	 * @throws SQLException
	 */
	public Object getCheckoutCountByHouseid(int houseid) throws SQLException{
		Object[] params = { houseid};
		String sql =" select count(1) as cnt from t_checkout as c "+
					" where c.houseid = ? "; 
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
	public Object getCheckoutCountByHouseidAndRoomno(int houseid,int roomno) throws SQLException{
		Object[] params = { houseid , roomno };
		String sql =" select count(1) as cnt from t_checkout as c "+
					" where c.houseid = ? "
					+ " and c.roomno = ?"; 
		Object o= dao.findBy(sql,"cnt",params);
		return o;
	}
	
	/**
	 * 退房查询
	 * @param params
	 * @param pageRequest
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryAllCheckOutRoomByParams(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String roomno = params.get("roomno");
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();
		Object[] sql_params = {year,month};
		
		String sql = " SELECT "+
				"     h.housename, " +
				"     r.houseid, " +
				"     r.roomno, " + 
				"	  rt.typename," +
				"     cus.customname," +
				"     rm.monthmoney, " +
				"     rm.pressmoney, " +
				"     CONCAT_WS('-',c.inyear,c.inmonth,c.inday) as in_date, " +
				"     CONCAT_WS('-',c.year,c.month,c.day) as out_date, " +
				"     rm.roommoney, " + 
				"     rm.year as d_year, " + 
				"     rm.month as d_month" +
				" FROM "+
				"     t_room AS r, "+
				"     t_house AS h," + 
				"     t_room_type AS rt, " +
				"     t_checkout AS c, " +
				"     t_custom AS cus, " +
				"     t_room_money_out AS rm " +
				" WHERE " +
				"     r.houseid = h.id " +
				" AND r.houseid = c.houseid " +
				" AND r.roomno = c.roomno " + 
				" AND r.typecode = rt.typecode " + 
				" AND c.customid = cus.id " + 
				" AND r.houseid = rm.houseid " +
				" AND r.roomno = rm.roomno ";
//				" AND rm.year = ? " + 
//			    " AND rm.month = ? ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND c.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " AND c.roomno in ("+roomno+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND rt.typecode in ('"+roomtypeid+"')";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+")";
				sql = sql + " order by c.year desc,c.month desc,c.day desc,c.created desc ";
				
				logger.log(Level.INFO, sql);
				
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 退房查询明细页面
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getCheckoutQueryPageMapById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	cus.customname, "+
				" 	CONCAT_WS('-', c.inyear, c.inmonth, c.inday) AS in_date, " + 
				" 	CONCAT_WS('-', c.year, c.month, c.day) AS out_date, " + 
				"   datediff(CONCAT_WS('-', c.year, c.month, c.day), CONCAT_WS('-', c.inyear, c.inmonth, c.inday)) as in_days "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_house AS h, "+
				" 	t_checkout AS c, "+
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
	
	/**
	 *  通过 楼栋编号和房间号得到退房后的入住收费记录
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryAllCheckoutRoomMoneyMapByParams(Map<String, String> params, final PageRequest pageRequest) throws Exception{
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
						"         t_checkout as ci, "+ 
						" 		  t_waterelect_out as we," + 
						"		  t_net_cfg_out as nc,"+
						"         t_room_money_out as rm "+
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
	
}
