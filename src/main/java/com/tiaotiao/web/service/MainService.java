package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.utils.Dao;
import com.tiaotiao.web.utils.DateUtil;


/**
 * 
 * 待办service
 * @author zouruijin
 */
@Service
public class MainService {
	@Resource
	private Dao dao;

	@Resource
	private PermissionService permissionService;
	
	private Logger logger = Logger.getLogger(MainService.class.getName());
	
	/**
	 * 待办待抄水电数据
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getMainRoomWaterElectMapByParams(Map<String, String> params,  final PageRequest pageRequest,String username) throws Exception{
		int year = DateUtil.getThisYear();
		int month  = DateUtil.getThisMonth() ; 
		Object[] sql_params = { year,month};
		String sql = " SELECT "+
				" 	h.housename, "+
				" 	r.houseid, "+
				" 	r.roomno, "+
				" 	cus.customname, "+
				" 	rt.typename, "+
				" 	CONCAT_WS('-', c.year, c.month, c.day) as in_date, "+
				"   CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_date, "+
				" 	rm.day as cin_day , "+
				" 	we.water, "+
				" 	we.elect "+
				" FROM "+
				" 	t_room AS r, "+
				" 	t_room_type AS rt, "+
				" 	t_house AS h, "+
				" 	t_checkin AS c, "+
				" 	t_custom AS cus, "+
				" 	t_waterelect AS we, "+
				" 	v_waterelect_last AS wel, "+
				"   t_room_money AS rm, "+
				" 	v_room_money_last AS rml "+
				" WHERE "+
				" 	r.houseid = h.id "+
				" AND c.houseid = r.houseid "+
				" AND c.roomno = r.roomno "+
				" AND r.typecode = rt.typecode "+
				" AND c.houseid = we.houseid "+
				" AND c.roomno = we.roomno "+
				" AND c.houseid = rm.houseid "+
				" AND c.roomno = rm.roomno "+
				" AND c.customid = cus.id "+
				" AND rm.year = rml.last_year "+
				" AND rm.month = rml.last_month "+
				" AND c.houseid = rml.houseid "+
				" AND c.roomno = rml.roomno "+
				" AND c.houseid = wel.houseid "+
				" AND c.roomno = wel.roomno "+
				" AND we.year = wel.last_year "+
				" AND we.month = wel.last_month "+
				" AND (r.houseid, r.roomno) NOT IN ( "+
				" 	SELECT "+
				" 		houseid, "+
				" 		roomno "+
				" 	FROM "+
				" 		t_waterelect "+
				" 	WHERE "+
				" 		1 = 1 "+
				" 	AND YEAR = ? "+
				" 	AND MONTH = ? "+
				" ) ";
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+") ";
				sql = sql + " order by rm.day   ";
				logger.log(Level.INFO, sql);
				
		return dao.find(sql, sql_params, pageRequest);
	}
	/**
	 * 得到待办待收月租数据
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getMainRoomMoneyMapByParams(Map<String, String> params,  final PageRequest pageRequest,String username) throws Exception{
		int year = DateUtil.getThisYear();
		int month  = DateUtil.getThisMonth() ; 
		int pre_month = month - 1 ;
		Object[] sql_params = { year,month,year,pre_month};
		
		// pre_s_date 上月收租日期 , cin_day 应收日 
		String sql = " 		SELECT "+
				" 			h.housename, "+
				" 			r.houseid, "+
				" 			r.roomno, "+
				" 			cus.id as customid, "+
				" 			cus.customname, "+
				" 			rm.monthmoney, "+
				" 			rm.pressmoney, "+
				" 			rt.typename, "+
				" 			CONCAT_WS('-',c.year,c.month,c.day) as in_date, "+
				" 			CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_date, "+
				" 			rm.roommoney, "+
				" 			c.day AS cin_day "+
				" 		FROM "+
				" 			t_room AS r, "+
				" 			t_room_type AS rt, "+
				" 			t_house AS h, "+
				" 			t_checkin AS c, "+
				" 			t_custom AS cus, "+
				" 			v_room_money_last AS rml, "+
				" 			t_room_money AS rm "+
				" 		WHERE "+
				" 			r.houseid = h.id "+
				" 		AND r.houseid = c.houseid "+
				" 		AND r.roomno = c.roomno "+
				" 		AND c.customid = cus.id "+
				" 		AND r.houseid = c.houseid "+
				" 		AND c.houseid = rml.houseid "+
				" 		AND c.roomno = rml.roomno "+
				" 		AND rm.houseid = rml.houseid "+
				" 		AND rm.roomno = rml.roomno "+
				" 		AND rm.year = rml.last_year "+
				" 		AND rm.month = rml.last_month "+
				" 		AND rt.typecode = r.typecode " ;
//				" 		AND r.houseid IN ( "+
//				" 		'89635a0e-418a-11e5-9172-fdf195657018', "+
//				" 		'97c2b41f-418a-11e5-9172-ade6bde32708' "+
//				" 		) "+
//				" 		AND rm.month <> 9 "; 
				sql = sql + " and rm.month <>  " + month;
				sql = sql + " and rm.month <  " + month;
				sql = sql + " and r.houseid in ("+permissionService.getUserHouses(username)+")";
				sql = sql + " order by rm.day   ";
		logger.log(Level.INFO, sql);
		return dao.find(sql, null, pageRequest);
	}
}
