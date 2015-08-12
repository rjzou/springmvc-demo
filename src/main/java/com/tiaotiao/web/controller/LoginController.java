package com.tiaotiao.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.tiaotiao.web.service.LoginService;


@Controller
public class LoginController {
 
//	@Resource
//	private LoginService loginService;
	

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String printLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request,ModelMap model) throws Exception {
		
//		User u = new User();
//		u.setEmail(inputEmail);
//		u.setPassword(inputPassword);
//		boolean b = loginService.CheckUserLogin(u);
//		if (b) {
//			User user = loginService.getUser(inputEmail, inputPassword);
//			session.setAttribute("LoginUser", user);
//			return "main";
//		}
//		model.addAttribute("message", "用户名和密码错误");
		
		if (error != null) {
		model.addAttribute("error", "Invalid username and password!");
		
		//login form for update, if login error, get the targetUrl from session again.
		String targetUrl = getRememberMeTargetUrlFromSession(request);
		System.out.println(targetUrl);
		if(StringUtils.hasText(targetUrl)){
			model.addAttribute("targetUrl", targetUrl);
			model.addAttribute("loginUpdate", true);
		}
		
	}

	if (logout != null) {
		model.addAttribute("message", "You've been logged out successfully.");
	}
		return "login";
	}
	

	
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(ModelMap model, HttpSession session) {
		session.removeAttribute("LoginUser");
		return "login";
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
	 */
	private void setRememberMeTargetUrlToSession(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", "/admin/update");
		}
	}

	/**
	 * get targetURL from session
	 */
	private String getRememberMeTargetUrlFromSession(HttpServletRequest request){
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		if(session!=null){
			targetUrl = session.getAttribute("targetUrl")==null?"":session.getAttribute("targetUrl").toString();
		}
		return targetUrl;
	}
	
}
