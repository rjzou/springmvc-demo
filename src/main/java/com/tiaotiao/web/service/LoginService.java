package com.tiaotiao.web.service;

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
	
	
	public Boolean CheckUserLogin(User user) throws Exception{
		
		
		return true;
	}
	
}
