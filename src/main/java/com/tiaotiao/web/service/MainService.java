package com.tiaotiao.web.service;

import java.util.Map;
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

	private Logger logger = Logger.getLogger(MainService.class.getName());
	
	/**
	 * 得到待办待抄手电数据
	 * @param houseid
	 * @param roomno
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getMainRoomWaterElectMapByParams(Map<String, String> params,  final PageRequest pageRequest) throws Exception{
		int year = DateUtil.getThisYear();
		int month  = DateUtil.getThisMonth() ; 
		int pre_month = month - 1 ;
		Object[] sql_params = { year,pre_month,year,month};
		String sql = " select  "+
				" ci.houseid, "+
				" h.housename, "+
				" rt.typename, "+
				" ci.roomno, "+
				" ci.customname, "+
				" CONCAT_WS('-',we.year,we.month,we.day) as pre_s_date, "+
				" we.water, "+
				" we.elect "+
				" from  "+
				" t_house as h, "+
				" t_room as r, "+
				" t_room_type as rt, "+
				" t_checkin as ci, "+
				" t_waterelect as we "+
				" where h.id = r.houseid "+
				" and r.houseid = ci.houseid "+
				" and r.roomno = ci.roomno  "+
				" and r.typecode = rt.typecode "+
				" and ci.houseid = we.houseid "+
				" and ci.roomno = we.roomno "+
				" and we.year = ? "+
				" and we.month = ? "+
				" and (ci.houseid,ci.roomno) not in "+
				" ( "+
				" 	select houseid,roomno from t_waterelect "+
				"   where 1=1 "+
				"   and year = ? "+
				"   and month = ? "+
				" ) ";
				
		return dao.find(sql, sql_params, pageRequest);
	}
	/**
	 * 得到待办待收月租数据
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getMainRoomMoneyMapByParams(Map<String, String> params,  final PageRequest pageRequest) throws Exception{
		int year = DateUtil.getThisYear();
		int month  = DateUtil.getThisMonth() ; 
		int pre_month = month - 1 ;
		Object[] sql_params = { year,month,year,pre_month};
		
		// pre_s_date 上月收租日期 , cin_day 应收日期 
		String sql = " SELECT "+
				"     tmp.housename, "+
				"     tmp.houseid, "+
				"     tmp.roomno, "+
				"     rm.monthmoney, "+
				"     rm.pressmoney, "+
				"     CONCAT_WS('-',rm.year,rm.month,rm.day) as pre_s_date, "+
				"     rm.roommoney, " +
				"     tmp.typename, "+
				"     tmp.cin_day "+
				" FROM "+
				"     ( "+
				"         SELECT "+
				"             h.housename, "+
				"             r.houseid, "+
				"             r.roomno, "+
				"             c.monthmoney, "+
				"             c.pressmoney, " +
				"             rt.typename," +
				"             c.day as cin_day "+
				"         FROM "+
				"             t_room as r, " + 
				"             t_room_type as rt, " +
				"             t_house as h, " +
				"             t_checkin as c " +
				"         WHERE " +
				"             r.houseid = h.id " +
				"         AND r.houseid = c.houseid " +
				"         AND r.roomno = c.roomno " +
				"         AND r.houseid = c.houseid " + 
				"	      AND r.typecode = rt.typecode " +
				"     ) AS tmp "+
				" LEFT JOIN t_room_money as rm ON tmp.houseid = rm.houseid "+
				" AND tmp.roomno = rm.roomno "+
				" WHERE "+
				"     (tmp.houseid, tmp.roomno) NOT IN ( "+
				"         SELECT "+
				"             houseid, "+
				"             roomno "+
				"         FROM "+
				"             t_room_money "+
				"         WHERE "+
				"             1 = 1 " +
				" and year =  ? " +
				" and month =  ? " +
				" ) "+
				" and rm.year =  ? " +
				" and rm.month =  ? "; 
				
		return dao.find(sql, sql_params, pageRequest);
	}
}
