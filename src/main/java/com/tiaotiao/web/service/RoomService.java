package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class RoomService {
	@Resource
	private Dao dao;
	

	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(RoomService.class.getName());
	/**
	 * 
	 * @param room
	 * @return
	 * @throws Exception
	 */
	public int insertRoom(Room room) throws Exception{
		Object[] params = { room.getHouseid(), room.getRoomno(), room.getMonthmoney(),room.getPressmoney(),room.getTypecode(), room.getDescription(), room.getCreated()};
		String sql = "insert into t_room(houseid,roomno,monthmoney,pressmoney,typecode,description,created) values(?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param room
	 * @return
	 * @throws Exception
	 */
	public int updateRoom(Room room,String sourceHouseid,int sourceRoomno) throws Exception{
		Object[] params = { room.getHouseid(), room.getRoomno(), room.getMonthmoney(),room.getPressmoney(),room.getTypecode(), room.getDescription(), room.getUpdated(),sourceHouseid, sourceRoomno};
		String sql = "update t_room set houseid = ?,roomno = ?,monthmoney = ?,pressmoney = ?,typecode = ? ,description = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 得到所有房间数据
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllRoom(String houseid,String roomtypeid,String roomno, final PageRequest pageRequest,String username) throws Exception{
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	r.monthmoney, "+
				" 	r.pressmoney, "+
				" 	r.description, "+
				" 	r.created, "+ 
				"   rt.typename, "+ 
				"   r.typecode "+
				" FROM "+
				" 	t_room as r, "+
				" 	t_house as h, "+
				"   t_room_type as rt "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" and r.typecode = rt.typecode ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND r.houseid in ("+houseid+")";
				}
				if (roomno != null && roomno.trim().length() > 0 ) {
					sql = sql + " AND r.roomno  like  '%"+roomno+"%'";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND r.typecode in ("+roomtypeid+")";
				}
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 查找空房
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllEmptyRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h "
				+ " where r.houseid = h.id and (r.houseid,r.roomno) not in (select houseid,roomno from t_checkin)  ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
				}
		return dao.find(sql, null, pageRequest);
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
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h "
				+ " where r.houseid = h.id and (r.houseid,r.roomno) in (select houseid,roomno from t_checkin)  ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
				}
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Room selectRoomById(String houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,monthmoney,pressmoney,typecode,description,created from t_room where houseid = ? and roomno = ? ";
		return dao.findFirst(Room.class,sql, params);
	}
	/**
	 * 
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getRoomMapById(int houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.typecode,rt.typename,r.description,r.created from t_room as r,t_house as h,t_room_type as rt "
				+ " where r.houseid = h.id and r.typecode = rt.typecode and  houseid = ? and roomno = ? ";
		return dao.findFirst(sql, params);
	}
	
//	public House selectRoomById(String id) throws Exception{
//		String sql = "select housename,description,created,updated from t_house where id = ? ";
//		return dao.findFirst(House.class,sql, id);
//	}
	
}
