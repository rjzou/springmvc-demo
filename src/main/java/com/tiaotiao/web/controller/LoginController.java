package com.tiaotiao.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.service.LoginService;
 
@Controller
public class LoginController {
 
	@Resource
	private LoginService loginService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printLogin() {
		return "login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String printLogin(String inputEmail,String inputPassword , ModelMap model) throws Exception {
		
		User u = new User();
		u.setEmail(inputEmail);
		u.setPwd(inputPassword);
		boolean b = loginService.CheckUserLogin(u);
		if (b) {
			return "main";
		}
		return "login";
	}
 
}
