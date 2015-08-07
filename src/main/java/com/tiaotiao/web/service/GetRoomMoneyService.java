package com.tiaotiao.web.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Checkout;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class GetRoomMoneyService {
	@Resource
	private Dao dao;
	
	/**
	 * 插入checkout 表数据
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
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllNotEmptyRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	c.monthmoney, "+
				" 	c.pressmoney, "+
				" 	r.description, "+
				" 	r.created "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_house AS h, "+
				" 	t_checkin AS c "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND r.houseid = c.houseid "+
				" AND r.roomno = c.roomno ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND r.typecode in ('"+roomtypeid+"')";
				}
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 查找在住没有抄水电表房
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllNotWaterElectRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	c.customname, "+
				" 	c.year, "+
				" 	c.month, "+
				" 	c.day, "+
				" 	c.water, "+
				" 	c.elect, "+
				" 	r.created "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_house AS h, "+
				" 	t_checkin AS c "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND c.houseid = r.houseid "+
				" AND c.roomno = r.roomno "+
				" and (r.houseid,r.roomno) not in "+
				" (select houseid,roomno from t_waterelect) ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
				}
		return dao.find(sql, null, pageRequest);
	}
}
