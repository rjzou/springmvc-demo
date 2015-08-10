package com.tiaotiao.web.controller;

import java.util.Calendar;
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
import com.tiaotiao.web.entity.RoomMoney;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomMoneyService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectCfgService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;
 
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
	
	@RequestMapping(value = "/room_checkin", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkinService.selectAllEmptyRoom(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		params.put("page_id", "room_checkin");
		model.put("params", params);
		return "room_checkin";
	}
	
	@RequestMapping(value = "/room_checkin", method = RequestMethod.POST)
	public String roomCheckinSearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		return this.printIndex(model, params, cpage);
	}	
 
	@RequestMapping(value = "/room_checkin_add", method = RequestMethod.POST)
	public String roomCheckinAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String customname = params.get("inputCustomname");
		String iphone = params.get("inputIphone");
		String cardid = params.get("inputCardid");
		int houseid = Integer.valueOf(params.get("houseid"));
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
		
		if (method != null && "calc".equals(method)) {
			return roomCheckinCalc(params,model);
		}
		else if (method != null && "save".equals(method)){
			Checkin checkin = new Checkin();
			checkin.setHouseid(houseid);
			checkin.setRoomno(roomno);
			checkin.setCustomname(customname);
			checkin.setIphone(iphone);
			checkin.setCardid(cardid);
			checkin.setMonthmoney(monthmoney);
			checkin.setPressmoney(pressmoney);
			checkin.setWater(water);
			checkin.setElect(elect);
			checkin.setIp(ip);
			checkin.setInternet(internet);
			checkin.setTrash(trash);
			checkin.setKeycount(keycount);
			checkin.setKeyprice(keyprice);
	        int year = DateUtil.getThisYear();
	        int month = DateUtil.getThisMonth();//获取月份
	        int day = DateUtil.getThisDay(); //获取日
	        checkin.setYear(year);
	        checkin.setMonth(month);
	        checkin.setDay(day);
			checkin.setCreated(System.currentTimeMillis());
			checkin.setUpdated(System.currentTimeMillis());
			
			WaterElectCfg wec = waterElectCfgService.getWaterelectCfgById(year, month);
			double waterprice = wec.getWaterprice();
			double electprice = wec.getElectprice();
			
			WaterElect we = new WaterElect();
			we.setHouseid(houseid);
			we.setRoomno(roomno);
			we.setWater(water);
			we.setWaterprice(waterprice);
			we.setElect(elect);
			we.setElectprice(electprice);
			we.setYear(year);
			we.setMonth(month);
			we.setDay(day);
			we.setCreated(System.currentTimeMillis());
			we.setUpdated(System.currentTimeMillis());
			
			int	sumprice = monthmoney + pressmoney + internet +trash +(keycount * keyprice);
				
			RoomMoney rm = new RoomMoney();
			rm.setHouseid(houseid);
			rm.setRoomno(roomno);
			rm.setRoommoney(sumprice);
			rm.setYear(year);
			rm.setMonth(month);
			rm.setDay(day);
			rm.setCreated(System.currentTimeMillis());
			rm.setUpdated(System.currentTimeMillis());
			return roomCheckinSave(checkin,we,rm,params,model);
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
			model.addAttribute("info", "应收  "+sumprice+"元,10秒钟将自动入住");
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
	public String roomCheckinSave(Checkin checkin,WaterElect we,RoomMoney rm,@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		
		try {
			Checkin entity = checkinService.getCheckinById(houseid, roomno);
			int n = 0, m = 0 , o = 0;
			if (entity != null) {
				n = checkinService.updateCheckin(checkin);
				m = waterElectService.updateWaterElect(we);
				o = roomMoneyService.updateRoomMoney(rm);
				
			}else{
				n = checkinService.insertCheckin(checkin);
				m = waterElectService.insertWaterElect(we);
				o = roomMoneyService.insertRoomMoney(rm);
			}
			
			if (n > 0 && m > 0 && o > 0) {
				model.addAttribute("message", "入住成功,应收 "+ rm.getRoommoney() +"元,10秒钟自动返回");
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
		int houseid = Integer.valueOf(params.get("houseid"));
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
	@RequestMapping(value = "/room_checkin_query", method = RequestMethod.GET)
	public String roomCheckinQuery(ModelMap model ,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkinService.queryAllRoomfulByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		params.put("page_id", "room_checkin_query");
		model.put("params", params);
		return "room_checkin_query";
	}
	@RequestMapping(value = "/room_checkin_query", method = RequestMethod.POST)
	public String roomCheckinQuerySearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		return this.roomCheckinQuery(model, params, cpage);
	}	
	
	@RequestMapping(value = "/room_checkin_query_page", method = RequestMethod.GET)
	public String roomCheckinQueryPage(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		int year = Integer.valueOf(params.get("year"));
		int month = Integer.valueOf(params.get("month"));
		Map<String,Object> query = checkinService.getCheckinQueryPageMapById(houseid, roomno, year, month);
		
//		Object times = checkinService.getRoomMoneyTimes(houseid, roomno, year, month);
		
		params.put("houseid", query.get("houseid").toString());
		params.put("housename", query.get("housename").toString());
		params.put("roomno", query.get("roomno").toString());
		params.put("customname", query.get("customname").toString());
//		params.put("monthmoney", query.get("monthmoney").toString());
//		params.put("pressmoney", query.get("pressmoney").toString());
		params.put("in_date", query.get("in_date").toString());
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
		model.put("params", params);
		return "room_checkin_query_page";
	}
}
