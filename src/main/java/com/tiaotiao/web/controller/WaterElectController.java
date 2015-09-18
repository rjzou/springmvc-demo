package com.tiaotiao.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectCfgService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;
import com.tiaotiao.web.utils.MyStringUtil;
 
@Controller
public class WaterElectController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private WaterElectService waterelectService;
	
	@Resource
	private WaterElectCfgService waterelectCfgService;
	
	@Resource
	private RoomTypeService roomtypeService;

	/**
	 * 抄水表
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/room_waterelect", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkoutService.selectAllNotWaterElectRoom(houseid,roomtypeid,roomno, page,username); 
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		params.put("page_id", "room_waterelect");
		return "room_waterelect";
	}
	
	@RequestMapping(value = "/room_towaterelect", method = RequestMethod.GET)
	public String toRoomAdd(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
		params.put("houseid", String.valueOf(checkin.get("houseid")));
		params.put("roomno", String.valueOf(checkin.get("roomno")));
		params.put("housename", String.valueOf(checkin.get("housename")));
		params.put("customname", String.valueOf(checkin.get("customname")));
		params.put("iphone", String.valueOf(checkin.get("iphone")));
		params.put("cardid", String.valueOf(checkin.get("cardid")));
//		params.put("year", String.valueOf(checkin.get("year")));
//		params.put("month", String.valueOf(checkin.get("month")));
		params.put("pre_s_date", String.valueOf(checkin.get("pre_s_date")));
		params.put("water", String.valueOf(checkin.get("water")));
		params.put("elect", String.valueOf(checkin.get("elect")));
		params.put("page_id", "room_waterelect");
		model.put("params", params);
		return "room_towaterelect";
	}	
 
	@RequestMapping(value = "/room_waterelect_save", method = RequestMethod.POST)
	public String roomAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		int inputWater = Integer.valueOf(params.get("inputWater"));
		int inputElect = Integer.valueOf(params.get("inputElect"));
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();// 获取月份
		int day = DateUtil.getThisDay();// 获取日
		WaterElectCfg wec = waterelectCfgService.getWaterelectCfgById(year, month);
		double waterprice = wec.getWaterprice();
		double electprice = wec.getElectprice();
		WaterElect we = new WaterElect();
		we.setHouseid(houseid);
		we.setRoomno(roomno);
		we.setWater(inputWater);
		we.setWaterprice(waterprice);
		we.setElect(inputElect);
		we.setElectprice(electprice);
		we.setYear(year);
		we.setMonth(month);
		we.setDay(day);
		we.setCreated(System.currentTimeMillis());
		try {
			Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
			params.put("houseid", String.valueOf(checkin.get("houseid")));
			params.put("roomno", String.valueOf(checkin.get("roomno")));
			params.put("housename", String.valueOf(checkin.get("housename")));
			params.put("customname", String.valueOf(checkin.get("customname")));
			params.put("iphone", String.valueOf(checkin.get("iphone")));
			params.put("cardid", String.valueOf(checkin.get("cardid")));
//			params.put("year", String.valueOf(checkin.get("year")));
//			params.put("month", String.valueOf(checkin.get("month")));
			params.put("pre_s_day", String.valueOf(checkin.get("pre_s_day")));
			params.put("water", String.valueOf(checkin.get("water")));
			params.put("elect", String.valueOf(checkin.get("elect")));
			
			WaterElect entity = waterelectService.getWaterElectById(houseid, roomno,year,month);
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
		params.put("page_id", "room_waterelect");
		model.put("params", params);
		return "room_towaterelect";
	}
	
}
