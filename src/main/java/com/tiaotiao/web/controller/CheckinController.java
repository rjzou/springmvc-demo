package com.tiaotiao.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.Custom;
import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.RoomMoney;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.CustomService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.NetCfgService;
import com.tiaotiao.web.service.RoomMoneyService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectCfgService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;
import com.tiaotiao.web.utils.GuidUtil;
import com.tiaotiao.web.utils.MyStringUtil;
 
@Controller
public class CheckinController extends BaseController {
 
	@Resource
	private RoomService roomService;
	
	@Resource
	private HouseService houseService;
	
	@Resource
	private RoomTypeService roomtypeService;
	
	@Resource
	private CheckinService checkinService;
	
	@Resource
	private CheckoutService checkoutService;
	
	@Resource
	private WaterElectService waterElectService;
	
	@Resource
	private WaterElectCfgService waterElectCfgService;
	
	@Resource
	private RoomMoneyService roomMoneyService;
	
	@Resource
	private CustomService customService;
	
	@Resource
	private NetCfgService netCfgService;
	
	/**
	 * 开始入住 功能
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/room_checkin", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		
		
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkinService.selectAllEmptyRoom(houseid,roomtypeid,roomno, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		Object[] room_tongji = checkinService.getRoomTongJi(username);
		params.put("empty_room_count", room_tongji[0].toString());
		params.put("today_checkin_room_count", room_tongji[1].toString());
		params.put("today_checkout_room_count", room_tongji[2].toString());
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_checkin";
	}
	
	@RequestMapping(value = "/room_checkin", method = RequestMethod.POST)
	public String roomCheckinSearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.printIndex(model, params, cpage,hsr);
	}	
 
	@RequestMapping(value = "/room_checkin_add", method = RequestMethod.POST)
	public String roomCheckinAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String customname = params.get("inputCustomname");
		String iphone = params.get("inputIphone");
		String cardid = params.get("inputCardid");
		String houseid = params.get("houseid");
		String customid = params.get("customid");
		if (customid == null || customid.trim().equals("")) {
			customid = GuidUtil.guid();
		}
		int roomno = Integer.valueOf(params.get("roomno"));
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		int water = Integer.valueOf(params.get("inputWater"));
		int elect = Integer.valueOf(params.get("inputElect"));
		String ip = params.get("inputIp");
		int internet = Integer.valueOf(params.get("inputInternet"));
		if (internet > 0 ) {
			params.put("needinternet", "1");
		}
		int trash = Integer.valueOf(params.get("inputTrash"));
		int keycount = Integer.valueOf(params.get("inputKeycount"));
		int keyprice = Integer.valueOf(params.get("inputKeyprice"));
		String method = String.valueOf(params.get("method"));
		Room room = roomService.selectRoomById(houseid, roomno);
		params.put("monthmoney", String.valueOf(room.getMonthmoney()));
		params.put("pressmoney", String.valueOf(room.getPressmoney()));
//		params.put("inputMonthMoney", String.valueOf(room.getMonthmoney()));
//		params.put("inputPressMoney", String.valueOf(room.getPressmoney()));
//		params.put("inputInternet", "40");//参考网费
		params.put("internet", "40");//参考网费
//		params.put("inputTrash", "10");
		params.put("trash", "10");//参考卫生费
//		params.put("inputKeycount", "2");
		params.put("keycount", "2");//参考钥匙串数量 默认
//		params.put("inputKeyprice", "10");
		params.put("keyprice", "10");//参考钥匙串价格
		params.put("customid", customid);
		if (method != null && "calc".equals(method)) {
			return roomCheckinCalc(params,model);
		}
		else if (method != null && "save".equals(method)){
			Checkin checkin = new Checkin();
			checkin.setHouseid(houseid);
			checkin.setRoomno(roomno);
			checkin.setCustomid(GuidUtil.guid());
			checkin.setTrash(trash);
			checkin.setKeycount(keycount);
			checkin.setKeyprice(keyprice);
			
			WaterElect we = new WaterElect();
			we.setHouseid(houseid);
			we.setRoomno(roomno);
			we.setWater(water);
			we.setElect(elect);
			
			int	sumprice = monthmoney + pressmoney + internet +trash +(keycount * keyprice);
				
			RoomMoney rm = new RoomMoney();
			rm.setHouseid(houseid);
			rm.setRoomno(roomno);
			rm.setMonthmoney(monthmoney);
			rm.setPressmoney(pressmoney);
			rm.setRoommoney(sumprice);
			
			Custom custom = new Custom();
			custom.setCustomname(customname);
			custom.setId(customid);
			custom.setIphone(iphone);
			custom.setCardid(cardid);
			
			NetCfg nc = new NetCfg();
			nc.setHouseid(houseid);
			nc.setRoomno(roomno);
			nc.setIp(ip);
			return roomCheckinSave(checkin,custom,we,rm,nc,params,model);
		}
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_tocheckin";
	}
	/**
	 * 
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String roomCheckinCalc(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int monthmoney = Integer.valueOf(params.get("inputMonthMoney"));
		int pressmoney = Integer.valueOf(params.get("inputPressMoney"));
		int internet = Integer.valueOf(params.get("inputInternet"));
		int trash = Integer.valueOf(params.get("inputTrash"));
		int keycount = Integer.valueOf(params.get("inputKeycount"));
		int keyprice = Integer.valueOf(params.get("inputKeyprice"));
		int sumprice = 0;
		try {
			sumprice = monthmoney + pressmoney + internet +trash +(keycount * keyprice);
			model.addAttribute("info", "应收  "+sumprice+"元");
		} catch (Exception e) {
			model.addAttribute("message", "计算失败,错误信息:"+e.getMessage());
		}
		params.put("sumprice", String.valueOf(sumprice));
		params.put("calctxt", "重新计算应收");
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_tocheckin";
	}
	/**
	 * 
	 * @param checkin
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String roomCheckinSave(Checkin checkin,Custom custom,WaterElect waterElect,RoomMoney roomMoney,NetCfg netCfg,@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		
		Checkin checkin_entity = checkinService.getCheckinById(checkin.getHouseid(), checkin.getRoomno());
		
		try {
			int n = 0 ;
			if (checkin_entity != null) {
				n = checkinService.updateCheckIn(checkin, custom, roomMoney, waterElect, netCfg);
			}
			else{
				n = checkinService.insertCheckIn(checkin, custom, roomMoney, waterElect, netCfg);
			}
			if (n > 0) {
				model.addAttribute("message", "入住成功,应收 "+ roomMoney.getRoommoney() +"元,10秒钟自动返回");
			}else{
				model.addAttribute("message", "入住失败,10秒钟自动返回");
			}
		} catch (Exception e) {
			if (e.getMessage().toLowerCase().indexOf("primary") > 0) {
				model.addAttribute("message", "入住失败,已经存在的房间号,请重新输入");
			}else{
				model.addAttribute("message", "入住失败,错误信息:"+e.getMessage());
			}
		}
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_tocheckin";
	}
	
	@RequestMapping(value = "/room_tocheckin", method = RequestMethod.GET)
	public String toCheckin(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		params.put("houseid", params.get("houseid"));
		params.put("roomno", params.get("roomno"));
		params.put("method", "calc");
		Room room = roomService.selectRoomById(houseid, roomno);
		params.put("monthmoney", String.valueOf(room.getMonthmoney()));
		params.put("pressmoney", String.valueOf(room.getPressmoney()));
		params.put("inputMonthMoney", String.valueOf(room.getMonthmoney()));
		params.put("inputPressMoney", String.valueOf(room.getPressmoney()));
		params.put("needinternet", "1");
		params.put("inputInternet", "40");//参考网费
		params.put("internet", "40");//参考网费
		params.put("inputTrash", "10");
		params.put("trash", "10");//参考卫生费
		params.put("inputKeycount", "2");
		params.put("keycount", "2");//参考钥匙串数量 默认
		params.put("inputKeyprice", "10");
		params.put("keyprice", "10");//参考钥匙串价格
		//params.put("calctxt", "计算应收");
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_tocheckin";
	}
	/*
	 * 入住查询
	 */
	@RequestMapping(value = "/room_checkin_query", method = RequestMethod.GET)
	public String roomCheckinQuery(ModelMap model ,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkinService.queryAllRoomfulByParams(houseid,roomtypeid,roomno, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		params.put("page_id", "room_checkin_query");
		model.put("params", params);
		return "room_checkin_query";
	}
	@RequestMapping(value = "/room_checkin_query", method = RequestMethod.POST)
	public String roomCheckinQuerySearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.roomCheckinQuery(model, params, cpage,hsr);
	}	
	
	@RequestMapping(value = "/room_checkin_query_page", method = RequestMethod.GET)
	public String roomCheckinQueryPage(@RequestParam Map<String, String> params,ModelMap model, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		String return_url = params.get("return_url");
//		int year = Integer.valueOf(params.get("year"));
//		int month = Integer.valueOf(params.get("month"));
		Map<String,Object> query = checkinService.getCheckinQueryPageMapById(houseid, roomno);
		
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkinService.queryAllRoomMoneyMapByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		
//		Object times = checkinService.getRoomMoneyTimes(houseid, roomno, year, month);
		
		params.put("houseid", query.get("houseid").toString());
		params.put("housename", query.get("housename").toString());
		params.put("roomno", query.get("roomno").toString());
		params.put("customname", query.get("customname").toString());
//		params.put("monthmoney", query.get("monthmoney").toString());
//		params.put("pressmoney", query.get("pressmoney").toString());
		params.put("in_date", query.get("in_date").toString());
		params.put("in_days", query.get("in_days").toString());
//		params.put("s_date", query.get("s_date").toString());
//		params.put("s_date", query.get("s_date").toString());
//		params.put("s_date", query.get("s_date").toString());
//		params.put("roommoney", query.get("roommoney").toString());
//		params.put("d_year", query.get("d_year").toString());
//		params.put("d_month", query.get("d_month").toString());
//		params.put("water", query.get("water").toString());
//		params.put("waterprice", query.get("waterprice").toString());
//		params.put("elect", query.get("elect").toString());
//		if (Integer.valueOf(times.toString()) > 1) {
//			WaterElect prewe = waterElectService.selectWaterelectByIdAndYearMonth(houseid, roomno,year,month -1);
//			params.put("pre_water", String.valueOf(prewe.getWater()));
//			params.put("pre_elect", String.valueOf(prewe.getElect()));
//			int usedWater = Integer.valueOf(query.get("water").toString()) - prewe.getWater();
//			int usedElect = Integer.valueOf(query.get("elect").toString()) - prewe.getElect() ;
//			double usedWaterPrice = usedWater * Double.valueOf(query.get("waterprice").toString());
//			double usedElectPrice = usedElect * Double.valueOf(query.get("electprice").toString());
//			params.put("usedwaterprice", String.valueOf(usedWaterPrice));
//			params.put("usedelectprice", String.valueOf(usedElectPrice));
//		}
		
//		params.put("electprice", query.get("electprice").toString());
//		params.put("internet", query.get("internet").toString());
//		params.put("ip", query.get("ip").toString());
//		params.put("trash", query.get("trash").toString());
//		params.put("keycount", query.get("keycount").toString());
//		params.put("keyprice", query.get("keyprice").toString());
////		params.put("times", times.toString());
//		int sumkeyprice = Integer.valueOf(query.get("keycount").toString())*Integer.valueOf(query.get("keyprice").toString());
//		params.put("sumkeyprice", String.valueOf(sumkeyprice));
		params.put("page_id", "room_checkin_query");
		params.put("return_url", return_url);
		model.put("params", params);
		return "room_checkin_query_page";
	}
}
