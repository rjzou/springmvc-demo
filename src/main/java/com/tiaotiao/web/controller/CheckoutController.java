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
import com.tiaotiao.web.entity.Checkout;
import com.tiaotiao.web.entity.House;
import com.tiaotiao.web.entity.RoomType;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.service.CheckinService;
import com.tiaotiao.web.service.CheckoutService;
import com.tiaotiao.web.service.HouseService;
import com.tiaotiao.web.service.RoomService;
import com.tiaotiao.web.service.RoomTypeService;
import com.tiaotiao.web.service.WaterElectService;
import com.tiaotiao.web.utils.DateUtil;

import sun.applet.resources.MsgAppletViewer;
 
@Controller
public class CheckoutController extends BaseController {
 
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
	private WaterElectService waterelectService;
	
	@RequestMapping(value = "/room_checkout", method = RequestMethod.GET)
	public String printIndex(ModelMap model, @RequestParam Map<String, String> params, @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		PageRequest page = new PageRequest(cpage - 1, PAGE_NUMERIC);
		Page<Map<String, Object>> list = checkoutService.getAllRoomfulByParams(params, page); 
		model.put("p", cpage);
		model.put("list", list);
		List<RoomType> types = roomtypeService.selectAllRoomType();
		model.put("types", types);
		List<House> houses = houseService.selectAllHouse();
		model.put("houses", houses);
		model.put("params", params);
		return "room_checkout";
	}
	
	@RequestMapping(value = "/room_checkout", method = RequestMethod.POST)
	public String search(ModelMap model , @RequestParam Map<String, String> params,  @RequestParam(value = "p", defaultValue = "1") int cpage) throws Exception {
		return this.printIndex(model, params, cpage);
	}	
 
	@RequestMapping(value = "/room_checkout_add", method = RequestMethod.POST)
	public String roomCheckoutAdd(@RequestParam Map<String, String> params, ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		double paymoney = Double.valueOf(params.get("paymoney"));
		Map<String,Object> checkin_map = checkinService.getCheckinMapById(houseid, roomno);
		Checkout checkout = new Checkout();
		checkout.setHouseid(houseid);
		checkout.setRoomno(roomno);
		checkout.setUsername(String.valueOf(checkin_map.get("username")));
		checkout.setIphone(String.valueOf(checkin_map.get("iphone")));
		checkout.setUserid(String.valueOf(checkin_map.get("userid")));
		checkout.setMonthmoney(Integer.valueOf(checkin_map.get("monthmoney").toString()));
		checkout.setPressmoney(Integer.valueOf(checkin_map.get("pressmoney").toString()));
		checkout.setWater(Integer.valueOf(checkin_map.get("water").toString()));
		checkout.setElect(Integer.valueOf(checkin_map.get("elect").toString()));
		checkout.setIp(String.valueOf(checkin_map.get("ip")));
		checkout.setInternet(Integer.valueOf(checkin_map.get("internet").toString()));
		checkout.setTrash(Integer.valueOf(checkin_map.get("trash").toString()));
		checkout.setPaymoney(paymoney);
		checkout.setKeycount(Integer.valueOf(checkin_map.get("keycount").toString()));
		checkout.setKeyprice(Integer.valueOf(checkin_map.get("keyprice").toString()));
		Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month=cal.get(Calendar.MONTH);//获取月份
        int day=cal.get(Calendar.DATE);//获取日
        checkout.setYear(year);
        checkout.setMonth(month);
        checkout.setDay(day);
		checkout.setCreated(System.currentTimeMillis());
		try {
			int n = checkoutService.insertCheckout(checkout);
			if (n > 0) {
				int m = checkinService.deleteCheckin(houseid, roomno);
				if (m>0) {
					model.addAttribute("message", "退房成功,10秒钟自动返回");
				}
				else{
					model.addAttribute("message", "删除入住数据失败,10秒钟自动返回");
				}
			}else{
				model.addAttribute("message", "插入退房数据失败,10秒钟自动返回");
			}
		} catch (Exception e) {
				model.addAttribute("message", "保存失败,10秒钟自动返回,错误信息:"+e.getMessage());
		}
		model.put("params", params);
		return "room_tocheckout";
	}
	
	@RequestMapping(value = "/room_tocheckout", method = RequestMethod.GET)
	public String toCheckout(@RequestParam Map<String, String> params,ModelMap model) throws Exception {
		int houseid = Integer.valueOf(params.get("houseid"));
		int roomno = Integer.valueOf(params.get("roomno"));
		Map<String,Object> checkin = checkinService.getCheckinMapById(houseid,roomno);
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
		params.put("internet", String.valueOf(checkin.get("internet")));//网费
		params.put("trash", String.valueOf(checkin.get("trash")));//卫生费
		params.put("keycount", String.valueOf(checkin.get("keycount")));
		params.put("keyprice", String.valueOf(checkin.get("keyprice")));
		int sumkeyprice = Integer.valueOf(checkin.get("keycount").toString())*Integer.valueOf(checkin.get("keyprice").toString());
		params.put("sumkeyprice", String.valueOf(sumkeyprice));
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth();// 获取月份
		WaterElect we = waterelectService.getWaterElectById(houseid, roomno,year,month);
		if (we == null) {
			model.addAttribute("danger", "还没有抄水电表，不可以退房,10秒钟自动返回");
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
			double paymoney = Integer.valueOf(checkin.get("pressmoney").toString()) - 
					usedWaterPrice -usedElectPrice - Integer.valueOf(checkin.get("internet").toString()) - 
					Integer.valueOf(checkin.get("trash").toString())-sumkeyprice;
			String msg ="需要收取 ";
			if (paymoney > 0) {
				msg = "需要退还 ";
			}
			params.put("msg", msg);
			params.put("paymoney", String.valueOf(paymoney));
		}
		model.put("params", params);
		return "room_tocheckout";
	}
}
