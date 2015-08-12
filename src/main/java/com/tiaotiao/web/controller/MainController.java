package com.tiaotiao.web.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.service.MainService;

@Controller
public class MainController {

	@Resource
	private MainService mainService;
	
	@RequestMapping(value = {"/", "/main", "/welcome**"}, method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		//request.userPrincipal.name
		PageRequest page = new PageRequest(cpage - 1, 5);
		Page<Map<String, Object>> room_we_list = mainService.getMainRoomWaterElectMapByParams(params, page); 
		model.put("room_we_list", room_we_list);
		
		Page<Map<String, Object>> room_money_list = mainService.getMainRoomMoneyMapByParams(params, page); 
		model.put("room_money_list", room_money_list);
		
		model.put("params", params);
		return "main";
	}
	
}