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

import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.service.RoomService;
 
@Controller
public class RoomController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomService.selectAllRoom(null, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		return "room";
	}
	
	@RequestMapping(value = "/room_toadd", method = RequestMethod.GET)
	public String toRoomAdd(ModelMap model) throws Exception {
		return "room_add";
	}
 
	@RequestMapping(value = "/room_add", method = RequestMethod.POST)
	public String roomAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int house_id = Integer.valueOf(params.get("selectHouse"));
		int room_no = Integer.valueOf(params.get("inputRoom"));
		int month_money = Integer.valueOf(params.get("inputMonthMoney"));
		Room room = new Room();
		room.setHouse_id(house_id);
		room.setRoom_no(room_no);
		room.setMonth_money(month_money);
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
		return "room_add";
	}
	
	@RequestMapping(value = "/room_toedit", method = RequestMethod.GET)
	public String toRoomEdit(String house_id,String room_no,ModelMap model) throws Exception {
		System.out.println(house_id);
		model.put("house_id", house_id);
		model.put("room_no", room_no);
		Map<String,Object> map = roomService.selectRoomById(house_id, room_no);
		model.put("month_money", String.valueOf(map.get("month_money")));
		model.put("description", String.valueOf(map.get("description")));
		return "room_edit";
	}
}
