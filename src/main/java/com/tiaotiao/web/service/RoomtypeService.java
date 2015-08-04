package com.tiaotiao.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class RoomtypeService {
	@Resource
	private Dao dao;
	
	/**
	 * 
	 * @param house
	 * @return
	 * @throws Exception
	 */
	public int insertHouse(House house) throws Exception{
		Object[] params = { house.getHousename(), house.getDescription(), house.getCreated()};
		String sql = "insert into t_house(housename,description,created) values(?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param house
	 * @return
	 * @throws Exception
	 */
	public int updateHouse(House house) throws Exception{
		Object[] params = { house.getHousename(), house.getDescription(), house.getUpdated(),house.getId()};
		String sql = "update t_house set housename = ?,description = ?,updated =? where id=? ";
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
	public List<RoomType> selectAllRoomType() throws Exception{
		String sql = "select typecode,typename,description,created,updated from t_room_type ";
		return dao.find(RoomType.class,sql);
	}
	
	/**
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllHouse(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String sql = "select id,housename,description,created,updated from t_house ";
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public House selectHouseById(String id) throws Exception{
		String sql = "select housename,description,created,updated from t_house where id = ? ";
		return dao.findFirst(House.class,sql, id);
	}
	
}
