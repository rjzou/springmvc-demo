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
import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.NetCfgService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectCfgService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;
import com.tiaotiao.web.utils.MyStringUtil;
 
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
	private WaterElectService waterelectService;
	
	@Resource
	private WaterElectCfgService waterelectCfgService;
	
	@Resource
	private NetCfgService  netCfgService;
	
	@Resource
	private RoomTypeService roomtypeService;
	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = netCfgService.getEmptyNetListByParams(houseid,roomtypeid,roomno, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg";
	}
	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg", method = RequestMethod.POST)
	public String netCfgSearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.printIndex(model, params, cpage,hsr);
	}	
	
	/**
	 * 
	 * @param model
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg_close", method = RequestMethod.GET)
	public String netCfgClose(ModelMap model,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = netCfgService.getHasNetListByParams(houseid,roomtypeid,roomno, page , username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_close";
	}	
	/**
	 * 
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/netcfg_close", method = RequestMethod.POST)
	public String netCfgCloseSearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.netCfgClose(model, params, cpage,hsr);
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
	public String netCfgToClose(ModelMap model,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno,username);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("roomno", String.valueOf(netCfgMap.get("roomno")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		params.put("netprice", String.valueOf(netCfgMap.get("netprice")));
		
		int net_price = Integer.valueOf(netCfgMap.get("netprice").toString());
		int in_days = Integer.valueOf(netCfgMap.get("in_days").toString());
		int in_months = (int)Math.floor(in_days/30);
		params.put("in_days", String.valueOf(netCfgMap.get("in_days")));
		params.put("sumprice", String.valueOf(in_months * net_price ));
		params.put("page_id", "netcfg");
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
	public String netCfgToOpen(ModelMap model,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno , username);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("roomno", String.valueOf(netCfgMap.get("roomno")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		params.put("netprice", String.valueOf(netCfgMap.get("netprice")));
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_toopen";
	}	
 
	@RequestMapping(value = "/netcfg_open", method = RequestMethod.POST)
	public String netCfgOpen(@RequestParam Map<String, String> params, ModelMap model, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		String ip = params.get("inputIP");
		String usr = params.get("inputUsr");
		String pwd = params.get("inputPwd");
		double netprice = Double.valueOf(params.get("netprice"));
		String method = String.valueOf(params.get("method"));
		if (method != null && "calc".equals(method)) {
			return netCfgCalc(params,model,username);
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
			return netCfgSave(nc,params,model,username);
		}
//		params.put("year", params.get("selectYear"));
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_toopen";
	}

	public String netCfgCalc(@RequestParam Map<String, String> params, ModelMap model,String username) throws Exception {
		double netprice = Double.valueOf(params.get("netprice"));
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno,username);
		
		params.put("housename", String.valueOf(netCfgMap.get("housename")));
		params.put("customname", String.valueOf(netCfgMap.get("customname")));
		
		try {
			model.addAttribute("info", "应收  "+netprice+"元,10秒钟将自动入住");
		} catch (Exception e) {
			model.addAttribute("message", "计算失败,错误信息:"+e.getMessage());
		}
		params.put("sumprice", String.valueOf(netprice));
		params.put("calctxt", "重新计算应收");
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_toopen";
	}
	
	public String netCfgSave(NetCfg nc,@RequestParam Map<String, String> params, ModelMap model,String username) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		
		Map<String,Object> netCfgMap = netCfgService.getNetCfgMapById(houseid, roomno , username);
		
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
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_open";
	}
	@RequestMapping(value = "/netcfg_close_save", method = RequestMethod.POST)
	public String netCfgCloseSave(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
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
		params.put("page_id", "netcfg");
		model.put("params", params);
		return "netcfg_toopen";
	}
}
