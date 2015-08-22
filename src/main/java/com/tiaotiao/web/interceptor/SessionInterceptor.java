package com.tiaotiao.web.interceptor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tiaotiao.web.service.UserService;
 
/**
 *
 * @author zouruijin
 */
public class SessionInterceptor implements HandlerInterceptor {
 
    private Logger logger = Logger.getLogger(SessionInterceptor.class.getName());
 
	@Resource
	private UserService userService;
    
    @Override
    public boolean preHandle(HttpServletRequest hsr, HttpServletResponse hsr1, Object o) throws Exception {
        if(hsr.getUserPrincipal() == null){
            logger.log(Level.INFO, "user not login");
            setRememberMeTargetUrlToSession(hsr);
            hsr1.sendRedirect(hsr.getContextPath() + "/login");
            return false;
        }
        String username  = hsr.getUserPrincipal().getName();
        logger.log(Level.INFO, username);
        return true;
    }
	/**
	 * save targetURL in session
	 * @throws UnsupportedEncodingException 
	 */
	private void setRememberMeTargetUrlToSession(HttpServletRequest request) throws UnsupportedEncodingException{
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", URLEncoder.encode(request.getServletPath() + "?" + request.getQueryString(), "UTF-8"));
		}
	}
	
    @Override
    public void postHandle(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, ModelAndView mav) throws Exception {
    }
 
    @Override
    public void afterCompletion(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, Exception excptn) throws Exception {
    }
}