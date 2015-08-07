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

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.NetCfgService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.WaterelectCfgService;
import com.tiaotiao.web.service.WaterelectService;
import com.tiaotiao.web.utils.DateUtil;
 
@Controller
public class NetCfgController extends BaseController {
 
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
	
	@Resource
	private NetCfgService  netCfgService;
	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = netCfgService.getEmptyNetListByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		return "netcfg";
	}
	/**
	 * 
	 * @param model
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg_close", method = RequestMethod.GET)
	public String netCfgToClose(ModelMap model,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = netCfgService.getHasNetListByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		model.put("params", params);
		return "netcfg_close";
	}	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg_toclose", method = RequestMethod.GET)
	public String netCfgToClose(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("roomno", String.valueOf(netCfgMap.get("roomno")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		params.put("netprice", String.valueOf(netCfgMap.get("netprice")));
		
		NetCfg nc = netCfgService.getNetCfgById(houseid, roomno);
		int year = nc.getYear();
		int month = nc.getMonth();
		int day = nc.getDay();
		int now_year = DateUtil.getThisYear();
		int now_month = DateUtil.getThisMonth();
		int now_day = DateUtil.getThisDay();
		int p_year = now_year - year;
		int p_month = now_month - month;
		int p_day = now_day - day;
		int sum_day = p_year * 365 +p_month * 30 + p_day;
		int sum_price = (p_year * 12 +p_month )*40;
		params.put("sumday", String.valueOf(sum_day));
		params.put("sumprice", String.valueOf(sum_price));
		
		model.put("params", params);
		return "netcfg_toclose";
	}	

	/**
	 * 
	 * @param model
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg_toopen", method = RequestMethod.GET)
	public String netCfgToOpen(ModelMap model,@RequestParam Map<String, String> params) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("roomno", String.valueOf(netCfgMap.get("roomno")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		params.put("netprice", String.valueOf(netCfgMap.get("netprice")));
		model.put("params", params);
		return "netcfg_toopen";
	}	
 
	@RequestMapping(value = "/netcfg_open", method = RequestMethod.POST)
	public String netCfgOpen(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		String ip = params.get("inputIP");
		String usr = params.get("inputUsr");
		String pwd = params.get("inputPwd");
		double netprice = Double.valueOf(params.get("netprice"));
		String method = String.valueOf(params.get("method"));
		if (method != null && "calc".equals(method)) {
			return netCfgCalc(params,model);
		}
		else if (method != null && "save".equals(method)){
			NetCfg nc = new NetCfg();
			nc.setHouseid(houseid);
			nc.setRoomno(roomno);
			nc.setIp(ip);
			nc.setUsr(usr);
			nc.setPwd(pwd);
			nc.setNetprice(netprice);
			nc.setYear(DateUtil.getThisYear());
			nc.setMonth(DateUtil.getThisMonth());
			nc.setDay(DateUtil.getThisDay());
			nc.setCreated(System.currentTimeMillis());
			return netCfgSave(nc,params,model);
		}
//		params.put("year", params.get("selectYear"));
		model.put("params", params);
		return "netcfg_toopen";
	}

	public String netCfgCalc(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		double netprice = Double.valueOf(params.get("netprice"));
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		
		try {
			model.addAttribute("info", "应收  "+netprice+"元,10秒钟将自动入住");
		} catch (Exception e) {
			model.addAttribute("message", "计算失败,错误信息:"+e.getMessage());
		}
		params.put("sumprice", String.valueOf(netprice));
		params.put("calctxt", "重新计算应收");
		model.put("params", params);
		return "netcfg_toopen";
	}
	
	public String netCfgSave(NetCfg nc,@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		
		try {
			NetCfg entity = netCfgService.getNetCfgById(houseid, roomno);
			int n = 0;
			if (entity != null) {
				n = netCfgService.updateNetCfg(nc);
			}else{
				n = netCfgService.insertNetCfg(nc);
			}
			if (n > 0) {
				model.addAttribute("message", "开通网络成功,10秒钟自动返回");
			}else{
				model.addAttribute("message", "开通网络失败,10秒钟自动返回");
			}
		} catch (Exception e) {
			model.addAttribute("message", "开通网络失败,错误信息:"+e.getMessage());
		}
		model.put("params", params);
		return "netcfg_open";
	}
	@RequestMapping(value = "/netcfg_close", method = RequestMethod.POST)
	public String netCfgClose(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
//		String ip = params.get("inputIP");
//		String usr = params.get("inputUsr");
//		String pwd = params.get("inputPwd");
//		double netprice = Double.valueOf(params.get("netprice"));
//		String method = String.valueOf(params.get("method"));
//		if (method != null && "calc".equals(method)) {
//			return netCfgCalc(params,model);
//		}
//		else if (method != null && "save".equals(method)){
//			NetCfg nc = new NetCfg();
//			nc.setHouseid(houseid);
//			nc.setRoomno(roomno);
//			nc.setIp(ip);
//			nc.setUsr(usr);
//			nc.setPwd(pwd);
//			nc.setNetprice(netprice);
//			nc.setYear(DateUtil.getThisYear());
//			nc.setMonth(DateUtil.getThisMonth());
//			nc.setDay(DateUtil.getThisDay());
//			nc.setCreated(System.currentTimeMillis());
//			return netCfgSave(nc,params,model);
//		}
//		params.put("year", params.get("selectYear"));
		model.put("params", params);
		return "netcfg_toopen";
	}
}
