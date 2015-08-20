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

import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.NetCfg;
import com.tiaotiao.web.entity.RoomMoney;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.NetCfgService;
import com.tiaotiao.web.service.RoomMoneyService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;
import com.tiaotiao.web.utils.MyStringUtil;
 
@Controller
public class RoomMoneyController extends BaseController {
 
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
	private RoomMoneyService roomMoneyService;
	
	@Resource
	private NetCfgService netCfgService;
	
	/**
	 * 收房租
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/room_money", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomMoneyService.getAllRoomfulMapByMonth(houseid,roomtypeid,roomno, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		params.put("page_id", "room_money");
		model.put("params", params);
		return "room_money";
	}
	@RequestMapping(value = "/room_money", method = RequestMethod.POST)
	public String roomMoneySearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.printIndex(model, params, cpage,hsr);
	}
	
	@RequestMapping(value = "/room_tomoney", method = RequestMethod.GET)
	public String roomToMoney(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> checkin = roomMoneyService.getRoomMoneyCheckinMapById(houseid,roomno);
		
		params.put("houseid", String.valueOf(checkin.get("houseid")));
		params.put("roomno", String.valueOf(checkin.get("roomno")));
		params.put("housename", String.valueOf(checkin.get("housename")));
		params.put("customname", String.valueOf(checkin.get("customname")));
		params.put("iphone", String.valueOf(checkin.get("iphone")));
		params.put("cardid", String.valueOf(checkin.get("cardid")));
		params.put("monthmoney", String.valueOf(checkin.get("monthmoney")));
		params.put("pressmoney", String.valueOf(checkin.get("pressmoney")));
		params.put("year", String.valueOf(checkin.get("year")));
		params.put("month", String.valueOf(checkin.get("month")));
		params.put("day", String.valueOf(checkin.get("day")));
		params.put("water", String.valueOf(checkin.get("water")));
		params.put("elect", String.valueOf(checkin.get("elect")));
		params.put("trash", String.valueOf(checkin.get("trash")));//卫生费
		
		NetCfg netCfg = netCfgService.getNetCfgById(houseid, roomno);
		if (netCfg != null) {
			params.put("needinternet", "1");
			params.put("netprice", String.valueOf(netCfg.getNetprice()));//网费
		}else{
			params.put("needinternet", "0"); //default
			params.put("netprice", "0"); //default
		}
		
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();// 获取月份
		WaterElect we = waterElectService.getWaterElectById(houseid, roomno,year,month);
		if (we == null) {
			model.addAttribute("danger", "本月该房间还没有抄水电表，请先抄水电表,10秒钟自动跳转抄水表!");
		}else{
			int usedWater = we.getWater() - Integer.valueOf(checkin.get("water").toString());
			int usedElect = we.getElect() - Integer.valueOf(checkin.get("elect").toString());
			double usedWaterPrice = usedWater * we.getWaterprice();
			double usedElectPrice = usedElect * we.getElectprice();
			params.put("curwater", String.valueOf(we.getWater()));
			params.put("waterprice", String.valueOf(we.getWaterprice()));
			params.put("curelect", String.valueOf(we.getElect()));
			params.put("electprice", String.valueOf(we.getElectprice()));
			params.put("usedwaterprice", String.valueOf(usedWaterPrice));
			params.put("usedelectprice", String.valueOf(usedElectPrice));
			double roommoney = Integer.valueOf(checkin.get("monthmoney").toString()) + 
					usedWaterPrice + usedElectPrice  + 
					Integer.valueOf(checkin.get("trash").toString());
			
			if (netCfg != null) {
				roommoney = roommoney + netCfg.getNetprice();
			}
			params.put("roommoney", String.valueOf(roommoney));
		}
		params.put("page_id", "room_money");
		model.put("params", params);
		return "room_tomoney";
	}
	
	@RequestMapping(value = "/room_money_add", method = RequestMethod.POST)
	public String roomToMoneyAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();
		int monthmoney = Integer.valueOf(params.get("monthmoney"));
		int pressmoney = Integer.valueOf(params.get("pressmoney"));
		double roommoney = Double.valueOf(params.get("roommoney"));
		double netprice = Double.valueOf(params.get("netprice"));
		
		RoomMoney rm =new RoomMoney();
		rm.setHouseid(houseid);
		rm.setRoomno(roomno);
		rm.setMonthmoney(monthmoney);
		rm.setPressmoney(pressmoney);
		rm.setRoommoney(roommoney);
		rm.setYear(year);
		rm.setMonth(month);
		rm.setDay(DateUtil.getThisDay());
		rm.setCreated(System.currentTimeMillis());
		rm.setUpdated(System.currentTimeMillis());
		
		NetCfg nc = new NetCfg();
		nc.setHouseid(houseid);
		nc.setRoomno(roomno);
		nc.setNetprice(netprice);
		rm.setYear(year);
		rm.setMonth(month);
		rm.setDay(DateUtil.getThisDay());
		nc.setCreated(System.currentTimeMillis());
		nc.setUpdated(System.currentTimeMillis());
		try {
			RoomMoney entity = roomMoneyService.getRoomMoneyById(houseid,roomno,year, month);
			int n = 0;
			if (entity != null) {
				n = roomMoneyService.updateRoomMoney(rm);
			}
			else{
				n = roomMoneyService.insertRoomMoney(rm);
			}
			
			int m = 0;
			if (netprice > 0) {
				NetCfg netCfg_entity = netCfgService.getNetCfgById(houseid, roomno);
				if (netCfg_entity != null) {
					m = netCfgService.updateNetCfgPrice(nc);
				}
				else{
					m = netCfgService.insertNetCfg(nc);
				}
			}
			else{
				m = netCfgService.deleteNetCfg(houseid, roomno);
			}
			
			if (n > 0 && m > 0) {
				model.addAttribute("message", "收房租保存成功,10秒钟自动返回");
			}else{
				model.addAttribute("error", "收房租保存失败,10秒钟自动返回");
			}
		} catch (Exception e) {
			model.addAttribute("error", "收房租保存失败,10秒钟自动返回,错误信息:"+e.getMessage());
		}
//		Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
//		params.put("houseid", String.valueOf(checkin.get("houseid")));
//		params.put("roomno", String.valueOf(checkin.get("roomno")));
//		params.put("housename", String.valueOf(checkin.get("housename")));
//		params.put("customname", String.valueOf(checkin.get("customname")));
//		params.put("iphone", String.valueOf(checkin.get("iphone")));
//		params.put("cardid", String.valueOf(checkin.get("cardid")));
//		params.put("monthmoney", String.valueOf(checkin.get("monthmoney")));
//		params.put("pressmoney", String.valueOf(checkin.get("pressmoney")));
//		params.put("year", String.valueOf(checkin.get("year")));
//		params.put("month", String.valueOf(checkin.get("month")));
//		params.put("day", String.valueOf(checkin.get("day")));
//		params.put("water", String.valueOf(checkin.get("water")));
//		params.put("elect", String.valueOf(checkin.get("elect")));
//		params.put("internet", String.valueOf(checkin.get("internet")));//网费
//		params.put("trash", String.valueOf(checkin.get("trash")));//卫生费
//		params.put("roommoney", String.valueOf(roommoney));
//		int cur_year = DateUtil.getThisYear();
//		int cur_month = DateUtil.getThisMonth();
//		WaterElect we = waterelectService.getWaterElectById(houseid, roomno,year,month);
//		int usedWater = curwe.getWater() - prewe.getWater();
//		int usedElect = curwe.getElect() - prewe.getElect();
//		double usedWaterPrice = usedWater * curwe.getWaterprice();
//		double usedElectPrice = usedElect * curwe.getElectprice();
//		params.put("curwater", String.valueOf(curwe.getWater()));
//		params.put("waterprice", String.valueOf(curwe.getWaterprice()));
//		params.put("curelect", String.valueOf(curwe.getElect()));
//		params.put("electprice", String.valueOf(curwe.getElectprice()));
//		params.put("usedwaterprice", String.valueOf(usedWaterPrice));
//		params.put("usedelectprice", String.valueOf(usedElectPrice));
		params.put("page_id", "room_money");
		model.put("params", params);
		return "room_tomoney_page";
	}
	/**
	 * 收租查询	
	 * @param model
	 * @param params
	 * @param cpage
	 * @param hsr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/room_money_query", method = RequestMethod.GET)
	public String roomMoneyQuery(ModelMap model ,@RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		String username  = hsr.getUserPrincipal().getName();
		String houseid = MyStringUtil.convertToInSql(params.get("houseid"));
		String roomtypeid = MyStringUtil.convertToInSql(params.get("roomtypeid"));
		String roomno = params.get("roomno");
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = roomMoneyService.queryAllRoomMoneyByParams(houseid,roomtypeid,roomno, page,username); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse(username);
		model.put("houses", houses);
		model.put("params", params);
		params.put("page_id", "room_money_query");
		return "room_money_query";
	}
	@RequestMapping(value = "/room_money_query", method = RequestMethod.POST)
	public String roomMoneyQuerySearch(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage,HttpServletRequest hsr) throws Exception {
		return this.roomMoneyQuery(model, params, cpage,hsr);
	}	
	
	@RequestMapping(value = "/room_money_query_page", method = RequestMethod.GET)
	public String roomMoneyQueryPage(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		String houseid = params.get("houseid");
		int roomno = Integer.valueOf(params.get("roomno"));
		int year = Integer.valueOf(params.get("year"));
		int month = Integer.valueOf(params.get("month"));
		Map<String,Object> query = roomMoneyService.getRoomMoneyQueryPageMapById(houseid, roomno, year, month);
		
		Object times = checkinService.getRoomMoneyTimes(houseid, roomno, year, month);
		
		params.put("houseid", query.get("houseid").toString());
		params.put("housename", query.get("housename").toString());
		params.put("roomno", query.get("roomno").toString());
		params.put("customname", query.get("customname").toString());
		params.put("monthmoney", query.get("monthmoney").toString());
		params.put("pressmoney", query.get("pressmoney").toString());
		params.put("in_day", query.get("in_day").toString());
		params.put("s_date", query.get("s_date").toString());
		params.put("s_date", query.get("s_date").toString());
		params.put("s_date", query.get("s_date").toString());
		params.put("roommoney", query.get("roommoney").toString());
		params.put("d_year", query.get("d_year").toString());
		params.put("d_month", query.get("d_month").toString());
		params.put("water", query.get("water").toString());
		params.put("waterprice", query.get("waterprice").toString());
		params.put("elect", query.get("elect").toString());
		if (Integer.valueOf(times.toString()) > 1) {
			WaterElect prewe = waterElectService.selectWaterelectByIdAndYearMonth(houseid, roomno,year,month -1);
			params.put("pre_water", String.valueOf(prewe.getWater()));
			params.put("pre_elect", String.valueOf(prewe.getElect()));
			int usedWater = Integer.valueOf(query.get("water").toString()) - prewe.getWater();
			int usedElect = Integer.valueOf(query.get("elect").toString()) - prewe.getElect() ;
			double usedWaterPrice = usedWater * Double.valueOf(query.get("waterprice").toString());
			double usedElectPrice = usedElect * Double.valueOf(query.get("electprice").toString());
			params.put("usedwaterprice", String.valueOf(usedWaterPrice));
			params.put("usedelectprice", String.valueOf(usedElectPrice));
		}
		
		params.put("electprice", query.get("electprice").toString());
		params.put("netprice", query.get("netprice").toString());
		params.put("ip", query.get("ip") == null?"":query.get("ip").toString());
		params.put("trash", query.get("trash").toString());
		params.put("keycount", query.get("keycount").toString());
		params.put("keyprice", query.get("keyprice").toString());
		params.put("times", times.toString());
		int sumkeyprice = Integer.valueOf(query.get("keycount").toString())*Integer.valueOf(query.get("keyprice").toString());
		params.put("sumkeyprice", String.valueOf(sumkeyprice));
		params.put("page_id", "room_money_query");
		model.put("params", params);
		return "room_money_query_page";
	}
}
