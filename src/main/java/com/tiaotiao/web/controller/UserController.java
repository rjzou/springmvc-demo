package com.tiaotiao.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.service.UserService;

//import com.tiaotiao.web.service.LoginService;


@Controller
public class UserController {
 
	@Resource
	private UserService userService;
	

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
	

	
	
	@RequestMapping(value = "/user_password", method = RequestMethod.GET)
	public String userToPassword(ModelMap model, @RequestParam Map<String, String> params, HttpServletRequest request) throws Exception {
		
		if (isRememberMeAuthenticated()) {
			//send login for update
			setRememberMeTargetUrlToSession(request);
			model.put("loginUpdate", true);
			return "login";
		} 
		
		String username  = request.getUserPrincipal().getName();
		params.put("username", username);
		model.put("params", params);
		return "user_password";
	}
	
	@RequestMapping(value = "/user_password", method = RequestMethod.POST)
	public String userPassword(ModelMap model, @RequestParam Map<String, String> params, HttpServletRequest request) throws Exception {
		String username  = request.getUserPrincipal().getName();
		String password =  params.get("password");
		String password2 =  params.get("password2");
		
		if (password == null || password2 == null) {
			model.addAttribute("error", "密码不能为空");
		}
		else if (!password.equals(password2)) {
			model.addAttribute("error", "两次输入的密码不相同");
		}
		else {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			int n = userService.updateUser(user);
			if (n > 0) {
				model.addAttribute("message", "密码修改成功");
			}
			else{
				model.addAttribute("error", "密码修改失败");
			}
		}
		params.put("username", username);
		model.put("params", params);
		return "user_password";
	}
	
	/**
	 * If the login in from remember me cookie, refer
	 * org.springframework.security.authentication.AuthenticationTrustResolverImpl
	 */
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
	/**
	 * save targetURL in session
	 * @throws UnsupportedEncodingException 
	 */
	private void setRememberMeTargetUrlToSession(HttpServletRequest request) throws UnsupportedEncodingException{
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", URLEncoder.encode("/user_password", "UTF-8"));
		}
	}
}
