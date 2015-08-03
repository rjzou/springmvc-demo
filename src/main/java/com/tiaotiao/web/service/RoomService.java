package com.tiaotiao.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.User;
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
	
	/**
	 * 
	 * @param room
	 * @return
	 * @throws Exception
	 */
	public int insertRoom(Room room) throws Exception{
		Object[] params = { room.getHouse_id(), room.getRoom_no(), room.getMonth_money(), room.getDescription(), room.getCreated()};
		String sql = "insert into t_room(house_id,room_no,month_money,description,created) values(?,?,?,?,?) ";
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
		String sql = "select house_id,room_no,month_money,description,created from t_room ";
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> selectRoomById(String house_id,String room_no) throws Exception{
		Object[] params = { house_id,room_no};
		String sql = "select house_id,room_no,month_money,description,created from t_room where house_id = ? and room_no = ? ";
		return dao.findFirst(sql, params);
	}
	
}
