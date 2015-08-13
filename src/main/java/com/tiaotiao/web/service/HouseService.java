package com.tiaotiao.web.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.UserHouses;
import com.tiaotiao.web.interceptor.SessionInterceptor;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class HouseService {
	@Resource
	private Dao dao;
	
	
	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(HouseService.class.getName());
	
	public int insertHouse(House h,String username) throws Exception{
		Connection conn = dao.getConn(false);
		Object[] params = { h.getId(),username,h.getHousename(),h.getDescription()};
		String pro_sql = " {CALL p_insert_houses(?,?,?,?)} ";
		Object[] result = dao.execProc(pro_sql, conn, params);
		int n = Integer.valueOf(result[0].toString());
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
	 * 通过id 删除house数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public int deleteHouse(int id) throws Exception{
		Object[] params = { id };
		String sql = "delete from t_house where id=? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public List<House> selectAllHouse(String username) throws Exception{
		Object[] params = { username };
		String sql = "select id,housename,description,created,updated from t_house as h,user_houses as uh where h.id = uh.houseid and username = ? ";
		return dao.find(House.class,sql,params);
	}
	
	/**
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllHouse(Map<String, String> params, final PageRequest pageRequest,String username) throws Exception{
		String housename = params.get("housename");
		String sql = " SELECT "+
				" 	h.id, "+
				" 	h.housename, "+
				" 	h.description, "+
				" 	h.created, "+
				" 	h.updated "+
				" FROM "+
				" 	t_house as h  where 1=1 ";
		if (housename != null && housename.trim().length() > 0 ) {
			sql = sql + " and h.housename  like '%"+housename+"%'";
		}
		sql = sql + " and h.id in ("+permissionService.getUserHouses(username)+") ";
		logger.log(Level.INFO, sql);
		return dao.find(sql, null, pageRequest);
	}
	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public House getHouseById(String id) throws Exception{
		String sql = "select housename,description,created,updated from t_house where id = ? ";
		return dao.findFirst(House.class,sql, id);
	}
	
}
