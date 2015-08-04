package com.tiaotiao.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class CheckinService {
	@Resource
	private Dao dao;
	
	/**
	 * 
	 * @param checkin
	 * @return
	 * @throws Exception
	 */
	public int insertCheckin(Checkin checkin) throws Exception{
		Object[] params = { checkin.getHouseid(), checkin.getRoomno(),checkin.getUsername(),checkin.getIphone(),checkin.getUserid(), checkin.getMonthmoney(),checkin.getPressmoney(),checkin.getWater(),checkin.getElect(),checkin.getInternet(),checkin.getIp(), checkin.getTrash(), checkin.getCreated()};
		String sql = "insert into t_checkin(houseid,roomno,username,iphone,userid,monthmoney,pressmoney,water,elect,internet,ip,trash,created) values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
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
	
}