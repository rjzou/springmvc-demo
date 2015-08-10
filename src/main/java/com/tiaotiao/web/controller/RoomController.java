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
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
 
@Controller
public class RoomController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private RoomTypeService roomtypeService;
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomService.selectAllRoom(params, page); 
		List<House> houses = houseService.selectAllHouse();
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		model.put("p", cpage);
		model.put("list", list);
		params.put("page_id", "room");
		model.put("houses", houses);
		model.put("params", params);
		return "room";
	}
	@RequestMapping(value = "/room", method = RequestMethod.POST)
	public String roomSearch(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		return this.printIndex(model, params, cpage);
	}
	@RequestMapping(value = "/room_toadd", method = RequestMethod.GET)
	public String toRoomAdd(ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		List<House> houses = houseService.selectAllHouse();
		params.put("page_id", "room");
		model.put("houses", houses);
		model.put("params", params);
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
		params.put("page_id", "room");
		model.put("params", params);
		return "room_add";
	}
	
	@RequestMapping(value = "/room_toedit", method = RequestMethod.GET)
	public String toRoomEdit(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		//System.out.println(houseid);
		Room room = roomService.selectRoomById(houseid, roomno);
		params.put("monthmoney", String.valueOf(room.getMonthmoney()));
		params.put("pressmoney", String.valueOf(room.getPressmoney()));
		params.put("typecode", room.getTypecode());
		params.put("description", room.getDescription());
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		params.put("page_id", "room");
		model.put("params", params);
		return "room_edit";
	}
	@RequestMapping(value = "/room_edit", method = RequestMethod.POST)
	public String roomEdit(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		int input_houseid = Integer.valueOf(params.get("selectHouse"));
		int input_roomno = Integer.valueOf(params.get("inputRoom"));
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		String typecode = params.get("optionsRoomtypes");
		String description = params.get("inputDescription");
		
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		
		Room room = new Room();
		room.setHouseid(input_houseid);
		room.setRoomno(input_roomno);
		room.setMonthmoney(monthmoney);
		room.setPressmoney(pressmoney);
		room.setTypecode(typecode);
		room.setDescription(description);
		room.setUpdated(System.currentTimeMillis());
		try {
			int n = roomService.updateRoom(room,houseid,roomno);
			if (n > 0) {
				model.addAttribute("message", "房间信息修改成功");
			}else{
				model.addAttribute("message", "房间信息修改失败");
			}
		} catch (Exception e) {
			model.addAttribute("message", "房间信息修改失败,错误信息:"+e.getMessage());
		}
		params.put("houseid", String.valueOf(input_houseid));
		params.put("roomno", String.valueOf(input_roomno));
		params.put("monthmoney", String.valueOf(monthmoney));
		params.put("pressmoney", String.valueOf(pressmoney));
		params.put("typecode", typecode);
		params.put("description", description);
		params.put("page_id", "room");
		model.put("params", params);
		return "room_edit";
	}
	
	@RequestMapping(value = "/room_todel", method = RequestMethod.GET)
	public String roomToDel(ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> map = roomService.getRoomMapById(houseid, roomno);
		params.put("housename", map.get("housename").toString());
		params.put("houseid", map.get("houseid").toString());
		params.put("monthmoney", map.get("monthmoney").toString());
		params.put("pressmoney", map.get("pressmoney").toString());
		params.put("typename", map.get("typename").toString());
		params.put("description", map.get("description").toString());
		params.put("page_id", "house");
		model.put("params", params);
		return "room_del";
	}
	@RequestMapping(value = "/room_del", method = RequestMethod.POST)
	public String roomDel(ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		Object checkin_count = checkinService.getCheckinCountByHouseidAndRoomno(houseid, roomno);
		Object checkout_count = checkoutService.getCheckoutCountByHouseidAndRoomno(houseid, roomno);
		Map<String,Object> map = roomService.getRoomMapById(houseid, roomno);
		params.put("housename", map.get("housename").toString());
		params.put("houseid", map.get("houseid").toString());
		params.put("monthmoney", map.get("monthmoney").toString());
		params.put("pressmoney", map.get("pressmoney").toString());
		params.put("typename", map.get("typename").toString());
		params.put("description", map.get("description").toString());
		model.put("params", params);
		if (Integer.valueOf(checkin_count.toString()) >0 || Integer.valueOf(checkout_count.toString()) > 0) {
			model.addAttribute("message", "还存在业务数据关系，不能删除");
			return "room_del";
		}
		int n = houseService.deleteHouse(houseid);
		if (n > 0) {
			model.addAttribute("message", "删除房间数据成功");
		}
		return "room";
	}
}
