package com.tiaotiao.web.controller;

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

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomtypeService;
 
@Controller
public class CheckinController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private RoomtypeService roomtypeService;
	
	@Resource
	private CheckinService checkinService;
	
	@RequestMapping(value = "/room_checkin", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomService.selectAllEmptyRoom(null, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		return "room_checkin";
	}
	
	@RequestMapping(value = "/room_checkin_search", method = RequestMethod.POST)
	public String roomCheckinSearch(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String house = params.get("selectHouse");
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		return "room_add";
	}	
 
	@RequestMapping(value = "/room_checkin_add", method = RequestMethod.POST)
	public String roomCheckinAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String username = params.get("inputUsername");
		String iphone = params.get("inputIphone");
		String userid = params.get("inputUserid");
		int houseid = Integer.valueOf(params.get("hiddenHouseid"));
		int roomno = Integer.valueOf(params.get("hiddenRoomno"));
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		int water = Integer.valueOf(params.get("inputWater"));
		int elect = Integer.valueOf(params.get("inputElect"));
		String ip = params.get("inputIp");
		int internet = Integer.valueOf(params.get("inputInternet"));
		int trash = Integer.valueOf(params.get("inputTrash"));
		Checkin checkin = new Checkin();
		checkin.setHouseid(houseid);
		checkin.setRoomno(roomno);
		checkin.setUsername(username);
		checkin.setIphone(iphone);
		checkin.setUserid(userid);
		checkin.setMonthmoney(monthmoney);
		checkin.setPressmoney(pressmoney);
		checkin.setWater(water);
		checkin.setElect(elect);
		checkin.setIp(ip);
		checkin.setInternet(internet);
		checkin.setTrash(trash);
		checkin.setCreated(System.currentTimeMillis());
		try {
			int n = checkinService.insertCheckin(checkin);
			if (n > 0) {
				model.addAttribute("message", "入住成功");
			}else{
				model.addAttribute("message", "保存失败");
			}
		} catch (Exception e) {
			if (e.getMessage().toLowerCase().indexOf("primary") > 0) {
				model.addAttribute("message", "保存失败,已经存在的房间号,请重新输入");
			}else{
				model.addAttribute("message", "保存失败,错误信息:"+e.getMessage());
			}
		}
		model.put("params", params);
		return "room_tocheckin";
	}
	
	@RequestMapping(value = "/room_tocheckin", method = RequestMethod.GET)
	public String toCheckin(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		params.put("hiddenHouseid", params.get("houseid"));
		params.put("hiddenRoomno", params.get("roomno"));
//		Room room = roomService.selectRoomById(houseid, roomno);
//		model.put("monthmoney", room.getMonthmoney());
//		model.put("pressmoney", room.getPressmoney());
//		model.put("description", room.getDescription());
//		List<House> houses = houseService.selectAllHouse();
//		model.put("houses", houses);
		model.put("params", params);
		return "room_tocheckin";
	}
	@RequestMapping(value = "/room_edita", method = RequestMethod.POST)
	public String roomEdit(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int hiddenHouseid = Integer.valueOf(params.get("hiddenHouseid"));
		int hiddenRoomno = Integer.valueOf(params.get("hiddenRoomno"));
		int houseid = Integer.valueOf(params.get("selectHouse"));
		int roomno = Integer.valueOf(params.get("inputRoom"));
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		String description = params.get("inputDescription");
		Room room = new Room();
		room.setHouseid(houseid);
		room.setRoomno(roomno);
		room.setMonthmoney(monthmoney);
		room.setPressmoney(pressmoney);
		room.setDescription(description);
		room.setUpdated(System.currentTimeMillis());
		try {
			int n = roomService.updateRoom(room,hiddenHouseid,hiddenRoomno);
			if (n > 0) {
				model.addAttribute("message", "保存成功");
			}else{
				model.addAttribute("message", "保存失败");
			}
		} catch (Exception e) {
			if (e.getMessage().toLowerCase().indexOf("primary") > 0) {
				model.addAttribute("message", "保存失败,已经存在的房间号,请重新输入");
			}else{
				model.addAttribute("message", "保存失败,错误信息:"+e.getMessage());
			}
		}
		model.put("params", params);
		return "room_add";
	}
}
