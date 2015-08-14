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
		Object[] params = { checkout.getHouseid(), checkout.getRoomno(),checkout.getUsername(),checkout.getIphone(),checkout.getUserid(), 
				checkout.getMonthmoney(),checkout.getPressmoney(),checkout.getWater(),checkout.getElect(),checkout.getInternet(),
				checkout.getIp(), checkout.getTrash(),checkout.getPaymoney(),checkout.getKeycount(),checkout.getKeyprice(),
				checkout.getYear(),checkout.getMonth(),checkout.getDay(), checkout.getCreated()};
		String sql = "insert into t_checkout(houseid,roomno,username,iphone,userid,monthmoney,pressmoney,water,elect,internet,ip,trash,paymoney,keycount,keyprice,year,month,day,created) "
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
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
				" 	c.customname, "+
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
				" 	t_room_money as rm, "+
				" 	v_room_money_last as rml "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND r.houseid = c.houseid "+
				" AND r.roomno = c.roomno "+
				" AND r.typecode = rt.typecode "+
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
		int pre_month = month - 1 ;
		Object[] sql_params = { year , pre_month,year , pre_month, year , month };
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	c.customname, "+
				" 	CONCAT_WS('-',c.year,c.month,c.day) as in_date, "+
				" 	rm.pre_s_date, "+
				" 	we.water, "+
				" 	we.elect, "+
				" 	r.created "+
				" FROM "+
				" 	t_room as r, "+
				" 	t_house as h, "+
				" 	t_checkin as c,"
				+ " (select houseid,roomno,water,elect from t_waterelect where year=? and month=?) as we, "
				+ " (select houseid,roomno,CONCAT_WS('-',year,month,day) as pre_s_date from t_room_money where year=? and month=?) as rm "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND c.houseid = r.houseid "+
				" AND c.roomno = r.roomno "+
				" AND c.houseid = we.houseid "+
				" AND c.roomno = we.roomno "+
				" AND c.houseid = rm.houseid "+
				" AND c.roomno = rm.roomno "+
				" and (r.houseid,r.roomno) not in "+
				" (select houseid,roomno from t_waterelect where 1=1"+
				" and year = ? " +
				" and month = ? ) ";
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
}
