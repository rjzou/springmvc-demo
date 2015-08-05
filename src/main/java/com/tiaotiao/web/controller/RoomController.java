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

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
 
@Controller
public class RoomController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomService.selectAllRoom(null, page); 
		List<House> houses = houseService.selectAllHouse();
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		model.put("houses", houses);
		return "room";
	}
	
	@RequestMapping(value = "/room_toadd", method = RequestMethod.GET)
	public String toRoomAdd(ModelMap model) throws Exception {
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		return "room_add";
	}	
 
	@RequestMapping(value = "/room_add", method = RequestMethod.POST)
	public String roomAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("selectHouse"));
		int roomno = Integer.valueOf(params.get("inputRoom"));
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		String typecode = params.get("optionsRoomtypes");
		String description = params.get("inputDescription");
		Room room = new Room();
		room.setHouseid(houseid);
		room.setRoomno(roomno);
		room.setMonthmoney(monthmoney);
		room.setPressmoney(pressmoney);
		room.setTypecode(typecode);
		room.setDescription(description);
		room.setCreated(System.currentTimeMillis());
		try {
			int n = roomService.insertRoom(room);
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
	
	@RequestMapping(value = "/room_toedit", method = RequestMethod.GET)
	public String toRoomEdit(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		String houseid = params.get("houseid");
		String roomno = params.get("roomno");
		//System.out.println(houseid);
		Room room = roomService.selectRoomById(houseid, roomno);
		params.put("monthmoney", String.valueOf(room.getMonthmoney()));
		params.put("pressmoney", String.valueOf(room.getPressmoney()));
		params.put("typecode", room.getTypecode());
		params.put("description", room.getDescription());
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		model.put("params", params);
		return "room_edit";
	}
	@RequestMapping(value = "/room_edit", method = RequestMethod.POST)
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
