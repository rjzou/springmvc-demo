package com.tiaotiao.web.service;

import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author 
 */
@Service
public class UserService {
	@Resource
	private Dao dao;
	
	private Logger logger = Logger.getLogger(UserService.class.getName());
	
	
	/**
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public User getUser(String username) throws Exception{
		Object[] params = { username };
		String sql = "select username,password,enabled from users where username=? ";
		User u = dao.findFirst(User.class,sql, params);
		return u;
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int insertUser(User user) throws Exception{
		return 0;
	}
	/**
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int updateUser(User user) throws Exception{
		Object[] params = { user.getPassword() , user.getUsername()};
		String sql = "update users set password = ? where username=? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public int deleteUser(String username) throws Exception{
		Object[] params = { username };
		String sql = "delete from users where username = ? ";
		int n = dao.update(sql, params);
		return n;
	}
//	/**
//	 * 取得用户和角色的数据
//	 * @param username
//	 * @return
//	 * @throws Exception
//	 */
//	public Map<String,Object> getUserAndRoles(String username) throws Exception{
//		Object[] params = { username };
//		String sql = "select u.username,u.password,u.enabled,u.user_role_id,u.role from users as u,user_roles as r where u.username = r.username and username=? ";
//		return dao.findFirst(sql, params);
//	}
}
