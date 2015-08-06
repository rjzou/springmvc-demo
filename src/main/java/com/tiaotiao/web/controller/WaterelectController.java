package com.tiaotiao.web.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.WaterelectService;
 
@Controller
public class WaterelectController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private WaterelectService waterelectService;
	
	@RequestMapping(value = "/room_waterelect", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkoutService.selectAllNotWaterElectRoom(params, page); 
		List<House> houses = houseService.selectAllHouse();
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		model.put("houses", houses);
		return "room_waterelect";
	}
	
	@RequestMapping(value = "/room_towaterelect", method = RequestMethod.GET)
	public String toRoomAdd(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
		params.put("houseid", String.valueOf(checkin.get("houseid")));
		params.put("roomno", String.valueOf(checkin.get("roomno")));
		params.put("housename", String.valueOf(checkin.get("housename")));
		params.put("customname", String.valueOf(checkin.get("customname")));
		params.put("iphone", String.valueOf(checkin.get("iphone")));
		params.put("cardid", String.valueOf(checkin.get("cardid")));
		params.put("year", String.valueOf(checkin.get("year")));
		params.put("month", String.valueOf(checkin.get("month")));
		params.put("day", String.valueOf(checkin.get("day")));
		params.put("water", String.valueOf(checkin.get("water")));
		params.put("elect", String.valueOf(checkin.get("elect")));
		
		model.put("params", params);
		return "room_towaterelect";
	}	
 
	@RequestMapping(value = "/room_waterelect_save", method = RequestMethod.POST)
	public String roomAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		int inputWater = Integer.valueOf(params.get("inputWater"));
		int inputElect = Integer.valueOf(params.get("inputElect"));
		WaterElect we = new WaterElect();
		we.setHouseid(houseid);
		we.setRoomno(roomno);
		we.setWater(inputWater);
		we.setWaterprice(4.5);
		we.setElect(inputElect);
		we.setElectprice(1.5);
		Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH);//获取月份
        int day=cal.get(Calendar.DATE);//获取日
		we.setYear(year);
		we.setMonth(month);
		we.setDay(day);
		we.setCreated(System.currentTimeMillis());
		try {
			Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
			params.put("houseid", String.valueOf(checkin.get("houseid")));
			params.put("roomno", String.valueOf(checkin.get("roomno")));
			params.put("housename", String.valueOf(checkin.get("housename")));
			params.put("username", String.valueOf(checkin.get("username")));
			params.put("iphone", String.valueOf(checkin.get("iphone")));
			params.put("userid", String.valueOf(checkin.get("userid")));
			params.put("year", String.valueOf(checkin.get("year")));
			params.put("month", String.valueOf(checkin.get("month")));
			params.put("day", String.valueOf(checkin.get("day")));
			params.put("water", String.valueOf(checkin.get("water")));
			params.put("elect", String.valueOf(checkin.get("elect")));
			
			WaterElect entity = waterelectService.selectWaterelectById(houseid, roomno);
			int n = 0;
			if (entity != null) {
				n = waterelectService.updateWaterElect(we);
			}
			else{
				n = waterelectService.insertWaterElect(we);
			}
			if (n > 0) {
				model.addAttribute("message", "抄表保存成功,10秒钟自动返回");
			}else{
				model.addAttribute("message", "抄表保存失败,10秒钟自动返回");
			}
		} catch (Exception e) {
			model.addAttribute("message", "保存失败,10秒钟自动返回,错误信息:"+e.getMessage());
		}
		model.put("params", params);
		return "room_towaterelect";
	}
	
}
