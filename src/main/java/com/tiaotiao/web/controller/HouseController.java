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

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.service.HouseService;
 
@Controller
public class HouseController extends BaseController {
 
	
	@Resource
	private HouseService houseService;
	
	@RequestMapping(value = "/house", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = houseService.selectAllHouse(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		params.put("page_id", "house");
		model.put("params", params);
		return "house";
	}
	
	@RequestMapping(value = "/house", method = RequestMethod.POST)
	public String houseSearch(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		return this.printIndex(model, params, cpage);
	}
	@RequestMapping(value = "/house_toadd", method = RequestMethod.GET)
	public String toHouseAdd(ModelMap model , @RequestParam Map<String, String> params) throws Exception {
		params.put("page_id", "house");
		model.put("params", params);
		return "house_add";
	}
 
	@RequestMapping(value = "/house_add", method = RequestMethod.POST)
	public String houseAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String housename = params.get("inputHousename");
		String description = params.get("inputDescription");
		House house = new House();
		house.setHousename(housename);
		house.setDescription(description);
		house.setCreated(System.currentTimeMillis());
		try {
			int n = houseService.insertHouse(house);
			if (n > 0) {
				model.addAttribute("message", "保存成功");
			}else{
				model.addAttribute("message", "保存失败");
			}
		} catch (Exception e) {
			model.addAttribute("message", "保存失败,错误信息:"+e.getMessage());
		}
		params.put("page_id", "house");
		model.put("params", params);
		return "house_add";
	}
	
	@RequestMapping(value = "/house_toedit", method = RequestMethod.GET)
	public String toHouseEdit(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		model.put("id", id);
		House house = houseService.selectHouseById(id);
		model.put("housename", house.getHousename());
		model.put("description", house.getDescription());
		params.put("page_id", "house");
		model.put("params", params);
		return "house_edit";
	}
	
	@RequestMapping(value = "/house_todel", method = RequestMethod.GET)
	public String houseToDel(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		params.put("id", id);
		House house = houseService.selectHouseById(id);
		params.put("housename", house.getHousename());
		params.put("description", house.getDescription());
		params.put("page_id", "house");
		model.put("params", params);
		return "house_del";
	}
	@RequestMapping(value = "/house_del", method = RequestMethod.POST)
	public String houseDel(String id,ModelMap model, @RequestParam Map<String, String> params) throws Exception {
		params.put("id", id);
		
//		House house = houseService.selectHouseById(id);
//		params.put("housename", house.getHousename());
//		params.put("description", house.getDescription());
//		params.put("page_id", "house");
		model.put("params", params);
		return "house";
	}
	@RequestMapping(value = "/house_edit", method = RequestMethod.POST)
	public String houseEdit(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int hiddenid = Integer.valueOf(params.get("hiddenid"));
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
