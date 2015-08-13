package com.tiaotiao.web.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.UserHouses;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 
 * @author 
 */
@Service
public class PermissionService {
	@Resource
	private Dao dao;
	
	/**
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public String getUserHouses(String username) throws Exception{
		Object[] params = { username };
		String sql = "select username,houseid from user_houses where username= ? ";
		List<UserHouses> usList = dao.find(UserHouses.class, sql, params);
		
		List<String> houses = new ArrayList<String>();
		StringBuffer sb = new StringBuffer();
		for (UserHouses userHouses : usList) {
			houses.add(userHouses.getHouseid());
		}
		String result = ""; 
		if (houses.size() > 0) {
			result = StringUtils.join(houses.toArray(),",");
		}		
				
		return result;
	}
	


}
