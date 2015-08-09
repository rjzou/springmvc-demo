package com.tiaotiao.web.service;

import java.util.Map;

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
	
	/**
	 * 插入 RoomMoney 表数据
	 * @param rm
	 * @return
	 * @throws Exception
	 */
	public int insertRoomMoney(RoomMoney rm) throws Exception{
		Object[] params = { rm.getHouseid(), rm.getRoomno(),rm.getRoommoney(),rm.getYear(),rm.getMonth(),rm.getDay(), rm.getCreated()};
		String sql = "insert into t_room_money(houseid,roomno,roommoney,year,month,day,created) "
				+ " values(?,?,?,?,?,?,?) ";
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
		Object[] params = { rm.getRoommoney(),rm.getYear(), rm.getMonth(), rm.getUpdated() ,rm.getHouseid(), rm.getRoomno()};
		String sql = "update t_room_money set roommoney = ?,year = ?,month = ?,updated =? where houseid=? and roomno =? ";
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
	public RoomMoney getRoomMoneyById(int houseid,int roomno,int year,int month) throws Exception{
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
	public Page<Map<String, Object>> getAllRoomfulMapByMonth(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid"); 
		String roomtypeid = params.get("roomtypeid");
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();
		String sql = " SELECT "+
				"     tmp.housename, "+
				"     tmp.houseid, "+
				"     tmp.roomno, "+
				"     tmp.monthmoney, "+
				"     tmp.pressmoney, "+
				"     CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_day, "+
				"     rm.roommoney, " +
				"     tmp.typecode, "+
				"     tmp.cin_day "+
				" FROM "+
				"     ( "+
				"         SELECT "+
				"             h.housename, "+
				"             r.houseid, "+
				"             r.roomno, "+
				"             c.monthmoney, "+
				"             c.pressmoney, " +
				"             r.typecode," +
				"             c.day as cin_day "+
				"         FROM "+
				"             t_room as r, "+
				"             t_house as h, "+
				"             t_checkin as c "+
				"         WHERE "+
				"             r.houseid = h.id "+
				"         AND r.houseid = c.houseid "+
				"         AND r.roomno = c.roomno "+
				"         AND r.houseid = c.houseid "+
				"     ) AS tmp "+
				" LEFT JOIN t_room_money as rm ON tmp.houseid = rm.houseid "+
				" AND tmp.roomno = rm.roomno "+
				" WHERE "+
				"     (tmp.houseid, tmp.roomno) NOT IN ( "+
				"         SELECT "+
				"             houseid, "+
				"             roomno "+
				"         FROM "+
				"             t_room_money "+
				"         WHERE "+
				"             1 = 1 ";
				sql = sql + " and year =  "+year;
				sql = sql + " and month =  "+month;
//				"     ) " ;
//				sql = sql + " and year =  "+year;
//				sql = sql + " and month =  "+month;
				sql = sql + " ) ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND tmp.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND tmp.typecode in ('"+roomtypeid+"')";
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
//	public Page<Map<String, Object>> selectAllNotWaterElectRooma(Map<String, String> params, final PageRequest pageRequest) throws Exception{
//		String houseid = params.get("houseid");
//		String roomtypeid = params.get("roomtypeid");
//		String sql = " SELECT "+
//				" 	h.housename, "+
//				" 	r.houseid, "+
//				" 	r.roomno, "+
//				" 	c.customname, "+
//				" 	c.year, "+
//				" 	c.month, "+
//				" 	c.day, "+
//				" 	c.water, "+
//				" 	c.elect, "+
//				" 	r.created "+
//				" FROM "+
//				" 	t_room AS r, "+
//				" 	t_house AS h, "+
//				" 	t_checkin AS c "+
//				" WHERE "+
//				" 	r.houseid = h.id "+
//				" AND c.houseid = r.houseid "+
//				" AND c.roomno = r.roomno "+
//				" and (r.houseid,r.roomno) not in "+
//				" (select houseid,roomno from t_waterelect) ";
//				
//				if (houseid != null && houseid.trim().length() > 0 ) {
//					sql = sql + " and r.houseid in ("+houseid+")";
//				}
//				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
//					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
//				}
//		return dao.find(sql, null, pageRequest);
//	}
}
