package com.tiaotiao.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class LoginController {
 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printLogin(ModelMap model) {
		return "login";
	}
 
}
