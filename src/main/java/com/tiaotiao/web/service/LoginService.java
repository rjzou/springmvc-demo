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
public class LoginService {
	@Resource
	private Dao dao;
	
	private Logger logger = Logger.getLogger(LoginService.class.getName());
	
	public Boolean CheckUserLogin(User user) throws Exception{
//		List<String> list = new ArrayList<String>();
//		list.add(user.getEmail());
//		list.add(user.getPassword());
//		String sql = "select email,password from t_user where email=? and password =? ";
//		User u = dao.findFirst(User.class,sql, list.toArray());
//		if (u != null) {
//			return true;
//		}
		return false;
	}

	
}
