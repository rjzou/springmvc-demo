package com.tiaotiao.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String printIndex() {
//		return "main";
//	}
	@RequestMapping(value = "/login1", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value = "/login1", method = RequestMethod.POST)
	public String printLogin(String inputEmail,String inputPassword , ModelMap model, HttpSession session) throws Exception {
		
		User u = new User();
		u.setEmail(inputEmail);
		u.setPassword(inputPassword);
		boolean b = loginService.CheckUserLogin(u);
		if (b) {
			User user = loginService.getUser(inputEmail, inputPassword);
			session.setAttribute("LoginUser", user);
			return "main";
		}
		model.addAttribute("message", "用户名和密码错误");
		return "login";
	}
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(ModelMap model, HttpSession session) {
		session.removeAttribute("LoginUser");
		return "login";
	}
}
