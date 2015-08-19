package com.tiaotiao.web.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.Custom;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.CustomService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.NetCfgService;
import com.tiaotiao.web.service.RoomMoneyService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectCfgService;
import com.tiaotiao.web.service.WaterElectService;
 
@Controller
public class CustomController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private RoomTypeService roomtypeService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private WaterElectService waterElectService;
	
	@Resource
	private WaterElectCfgService waterElectCfgService;
	
	@Resource
	private RoomMoneyService roomMoneyService;
	
	@Resource
	private CustomService customService;
	
	@Resource
	private NetCfgService netCfgService;
	
	private Logger logger = Logger.getLogger(CheckinService.class.getName());
	/*
	 * 客户查询
	 */
	@RequestMapping(value = "/custom_query", method = RequestMethod.GET)
	public String printIndex(ModelMap model ,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String customname = params.get("customname");
		String iphone = params.get("iphone");
		
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = customService.queryAllCustomByParams(customname,iphone, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		params.put("page_id", "custom_query");
		model.put("params", params);
		return "custom_query";
	}
	@RequestMapping(value = "/custom_query", method = RequestMethod.POST)
	public String roomCheckinQuerySearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.printIndex(model, params, cpage,hsr);
	}	
	
	@RequestMapping(value = "/custom_query_page", method = RequestMethod.GET)
	public String roomCheckinQueryPage(@RequestParam Map<String, String> params,ModelMap model, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		String id = params.get("id");
		Custom custom = customService.getCustomById(id);
		params.put("customname", custom.getCustomname());
		params.put("iphone", custom.getIphone());
		params.put("cardid", custom.getCardid());
		params.put("year", String.valueOf(custom.getYear()));
		params.put("month", String.valueOf(custom.getMonth()));
		params.put("day", String.valueOf(custom.getDay()));
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Checkin ci = checkinService.getCheckinByCustomId(id);
		if (ci != null) {
			Page<Map<String, Object>> online_room_list = customService.queryOnlineRoomMapByCustomId(id, page); 
			params.put("custom_room", "online");
			model.put("online_room_list", online_room_list);
		}
		else{
			Page<Map<String, Object>> offline_room_list = customService.queryOfflineRoomMapByCustomId(id, page); 
			params.put("custom_room", "offline");
			model.put("offline_room_list", offline_room_list);
		}
		model.put("p", cpage);
		params.put("return_url", URLEncoder.encode("custom_query_page?id=" + id, "UTF-8"));
		params.put("page_id", "custom_query");
		model.put("params", params);
		return "custom_query_page";
	}
	@RequestMapping(value = "/json/getCustomJson", method = RequestMethod.GET)
	@ResponseBody
	public List<Custom> testJson( String customname) throws Exception {
		System.out.println("testJson");
		logger.log(Level.INFO, "customname :" + customname);
		
		List<Custom> list = customService.getCustomList();
//		Custom custom = new Custom();
//		custom.setCustomname("lfd");
//		custom.setIphone("12345678");
//		custom.setCardid("362203198611175786");
//		
//		Custom custom2 = new Custom();
//		custom2.setCustomname("zouruijin");
//		custom2.setIphone("12345678");
//		custom2.setCardid("362203198611175786");
//		
//		
//		Custom custom3 = new Custom();
//		custom3.setCustomname("zourinet");
//		custom3.setIphone("12345678");
//		custom3.setCardid("362203198611175786");
//		List<Custom> list = new ArrayList<Custom>();
//		list.add(custom2);
//		list.add(custom);
//		list.add(custom3);
		return list;
	}
}
