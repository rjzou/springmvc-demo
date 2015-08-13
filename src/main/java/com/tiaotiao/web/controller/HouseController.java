package com.tiaotiao.web.controller;

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
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomMoneyService;
import com.tiaotiao.web.utils.GuidUtil;
 
@Controller
public class HouseController extends BaseController {
 
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private RoomMoneyService roomMoneyService;
	
	@RequestMapping(value = "/house", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = houseService.selectAllHouse(params, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		params.put("page_id", "house");
		model.put("params", params);
		return "house";
	}
	
	@RequestMapping(value = "/house", method = RequestMethod.POST)
	public String houseSearch(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.printIndex(model, params, cpage,hsr);
	}
	@RequestMapping(value = "/house_toadd", method = RequestMethod.GET)
	public String toHouseAdd(ModelMap model , @RequestParam Map<String, String> params) throws Exception {
		params.put("page_id", "house");
		model.put("params", params);
		return "house_add";
	}
 
	@RequestMapping(value = "/house_add", method = RequestMethod.POST)
	public String houseAdd(@RequestParam Map<String, String> params, ModelMap model ,HttpServletRequest hsr) throws Exception {
		String id = params.get("id");
		String housename = params.get("housename");
		String description = params.get("description");
		House house = new House();
		
		if (id == null || id.trim() == "") {
			id = GuidUtil.guid();
		}
		
		house.setId(id);
		house.setHousename(housename);
		house.setDescription(description);
		house.setCreated(System.currentTimeMillis());
		String username  = hsr.getUserPrincipal().getName();
		try {
			House h = houseService.getHouseById(id);
			int n = 0;
			if (h != null) {
				n = houseService.updateHouse(house);
			}
			else{
				n = houseService.insertHouse(house,username);
			}
			if (n > 0) {
				model.addAttribute("message", "保存成功");
			}else{
				model.addAttribute("message", "保存失败");
			}
		} catch (Exception e) {
			model.addAttribute("message", "保存失败,错误信息:"+e.getMessage());
		}
		params.put("id", id);
		params.put("page_id", "house");
		model.put("params", params);
		return "house_add";
	}
	
	@RequestMapping(value = "/house_toedit", method = RequestMethod.GET)
	public String toHouseEdit(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		model.put("id", id);
		House house = houseService.getHouseById(id);
		model.put("housename", house.getHousename());
		model.put("description", house.getDescription());
		params.put("page_id", "house");
		model.put("params", params);
		return "house_edit";
	}
	
	@RequestMapping(value = "/house_todel", method = RequestMethod.GET)
	public String houseToDel(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		params.put("id", id);
		House house = houseService.getHouseById(id);
		params.put("housename", house.getHousename());
		params.put("description", house.getDescription());
		params.put("page_id", "house");
		model.put("params", params);
		return "house_del";
	}
	@RequestMapping(value = "/house_del", method = RequestMethod.POST)
	public String houseDel(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		params.put("id", id);
		int houseid = Integer.valueOf(id);
		Object checkin_count = checkinService.getCheckinCountByHouseid(houseid);
		Object checkout_count = checkoutService.getCheckoutCountByHouseid(houseid);
		House house = houseService.getHouseById(id);
		params.put("housename", house.getHousename());
		params.put("description", house.getDescription());
		model.put("params", params);
		if (Integer.valueOf(checkin_count.toString()) >0 || Integer.valueOf(checkout_count.toString()) > 0) {
			model.addAttribute("message", "还存在业务数据关系，不能删除");
			return "house_del";
		}
		int n = houseService.deleteHouse(houseid);
		if (n > 0) {
			model.addAttribute("message", "删除楼栋数据成功");
		}
		
		return "house";
	}
	@RequestMapping(value = "/house_edit", method = RequestMethod.POST)
	public String houseEdit(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String hiddenid = params.get("hiddenid");
		String housename = params.get("inputHousename");
		String description = params.get("inputDescription");
		House house = new House();
		house.setId(hiddenid);
		house.setHousename(housename);
		house.setDescription(description);
		house.setUpdated(System.currentTimeMillis());
		try {
			int n = houseService.updateHouse(house);
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
		params.put("page_id", "house");
		model.put("params", params);
		return "house_add";
	}
}
