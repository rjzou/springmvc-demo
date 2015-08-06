package com.tiaotiao.web.controller;

import java.util.Calendar;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.WaterelectCfgService;
import com.tiaotiao.web.service.WaterelectService;
 
@Controller
public class WaterelectCfgController extends BaseController {
 
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
	
	@Resource
	private WaterelectCfgService waterelectCfgService;
	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/waterelectcfg", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
//		Calendar cal = Calendar.getInstance();
//        int year = cal.get(Calendar.YEAR);
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
//		params.put("year", String.valueOf(year));
		Page<Map<String, Object>> list = waterelectCfgService.getWaterelectCfgListByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		return "waterelectcfg";
	}
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/waterelectcfg", method = RequestMethod.POST)
	public String search(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = waterelectCfgService.getWaterelectCfgListByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		return "waterelectcfg";
	}
	/**
	 * 
	 * @param model
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/waterelectcfg_toadd", method = RequestMethod.GET)
	public String waterelectCfgToAdd(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
		
		Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int pre_year = year - 1;
        WaterElectCfg wec = waterelectCfgService.getWaterelectCfgById(pre_year, 12);
		params.put("waterprice", String.valueOf(wec.getWaterprice()));
		params.put("electprice", String.valueOf(wec.getElectprice())); 
		params.put("inputWaterPrice", String.valueOf(wec.getWaterprice()));
		params.put("inputElectPrice", String.valueOf(wec.getElectprice()));
		model.put("params", params);
		return "waterelectcfg_add";
	}	
	/**
	 * 
	 * @param model
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/waterelectcfg_toedit", method = RequestMethod.GET)
	public String waterelectCfgToEdit(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
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
		return "waterelect_tocfg";
	}	
 
	@RequestMapping(value = "/waterelectcfg_add", method = RequestMethod.POST)
	public String waterelectCfgSave(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int year = Integer.valueOf(params.get("selectYear"));
		double waterprice = Double.valueOf(params.get("inputWaterPrice"));
		double electprice = Double.valueOf(params.get("inputElectPrice"));
		try {
			WaterElectCfg wec = new WaterElectCfg();
			wec.setYear(year);
			wec.setWaterprice(waterprice);
			wec.setElectprice(electprice);
			wec.setCreated(System.currentTimeMillis());
			for (int i = 1; i < 13; i++) {
				wec.setMonth(i);
				WaterElectCfg entity = waterelectCfgService.getWaterelectCfgById(year, i);
				int n = 0;
				if (entity != null) {
					n = waterelectCfgService.updateWaterElectCfg(wec);
				}else{
					n = waterelectCfgService.insertWaterElectCfg(wec);
				}
				if (n > 0) {
					model.addAttribute("message", "生成并保存水电表数据成功,10秒钟自动返回");
				}else{
					model.addAttribute("message", "生成并保存水电表数据失败,10秒钟自动返回");
				}
			}
		
		
		} catch (Exception e) {
			model.addAttribute("message", "保存失败,10秒钟自动返回,错误信息:"+e.getMessage());
		}
		model.put("params", params);
		return "waterelectcfg_add";
	}
	
}
