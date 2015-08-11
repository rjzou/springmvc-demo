package com.tiaotiao.web.interceptor;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tiaotiao.web.entity.User;
 
/**
 *
 * @author zouruijin
 */
public class SessionInterceptor implements HandlerInterceptor {
 
    private Logger logger = Logger.getLogger(SessionInterceptor.class.getName());
 
    @Override
    public boolean preHandle(HttpServletRequest hsr, HttpServletResponse hsr1, Object o) throws Exception {
        User user=(User) hsr.getSession().getAttribute("LoginUser");
        if(user==null){
            logger.log(Level.INFO, "user not login");
            hsr1.sendRedirect(hsr.getContextPath() + "/login");
            return false;
        }
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, ModelAndView mav) throws Exception {
    }
 
    @Override
    public void afterCompletion(HttpServletRequest hsr, HttpServletResponse hsr1, Object o, Exception excptn) throws Exception {
    }
}