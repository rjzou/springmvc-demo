package com.tiaotiao.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Checkin;
import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.User;
import com.tiaotiao.web.utils.Dao;
import com.tiaotiao.web.utils.DateUtil;


/**
 * 
 * 
 * @author zouruijin
 */
@Service
public class CheckinService {
	@Resource
	private Dao dao;
	
	/**
	 * 
	 * @param checkin
	 * @return
	 * @throws Exception
	 */
	public int insertCheckin(Checkin checkin) throws Exception{
		Object[] params = { checkin.getHouseid(), checkin.getRoomno(),checkin.getCustomname(),checkin.getIphone(),checkin.getCardid(), 
				checkin.getMonthmoney(),checkin.getPressmoney(),checkin.getInternet(),checkin.getIp(), 
				checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice(),checkin.getYear(),checkin.getMonth(),checkin.getDay(), checkin.getCreated()};
		String sql = "insert into t_checkin(houseid,roomno,customname,iphone,cardid,monthmoney,pressmoney,internet,ip,trash,"
				+ "keycount,keyprice,year,month,day,created) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 
	 * @param checkin
	 * @return
	 * @throws Exception
	 */
	public int updateCheckin(Checkin checkin) throws Exception{
		Object[] params = { checkin.getCustomname(), checkin.getIphone(),checkin.getCardid(), checkin.getMonthmoney(),checkin.getPressmoney(), 
				checkin.getInternet(),checkin.getIp(),checkin.getTrash(),checkin.getKeycount(),checkin.getKeyprice(),
				checkin.getYear(),checkin.getMonth(),checkin.getDay(),checkin.getUpdated(),checkin.getHouseid(),checkin.getRoomno()};
		String sql = "update t_checkin set customname = ?,iphone = ?,cardid = ?,monthmoney = ?,pressmoney = ?,internet = ?,ip = ?,"
				+ "trash = ?,keycount = ?,keyprice = ?,year = ?,month = ?,day = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	public int deleteCheckin(int houseid,int roomno) throws Exception{
		Object[] params = { houseid, roomno};
		String sql = "delete from  t_checkin where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Checkin getCheckinById(int houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,customname,iphone,cardid,monthmoney,pressmoney,water,elect,internet,ip,trash,keycount,keyprice,year,month,day,created from t_checkin where houseid = ? and roomno = ? ";
		return dao.findFirst(Checkin.class,sql, params);
	}
//	/**
//	 * 
//	 * @param params
//	 * @param pageRequest
//	 * @return
//	 * @throws Exception
//	 */
//	public Page<Map<String, Object>> selectAllRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
//		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h where r.houseid = h.id ";
//		return dao.find(sql, null, pageRequest);
//	}
	
	/**
	 *  显示入住信息
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getCheckinMapById(int houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		int year = DateUtil.getThisYear();
		int month = DateUtil.getThisMonth() -1 ;
		String sql = " SELECT "+
					"     h.housename, "+
					"     c.houseid, "+
					"     c.roomno, "+
					"     c.customname, "+
					"     c.iphone, "+
					"     c.cardid, "+
					"     c.monthmoney, "+
					"     c.pressmoney, "+
					"     c.internet, "+
					"     c.trash, "+
					"     c.keycount, "+
					"     c.keyprice, "+
					"     CONCAT_WS('-',c.year,c.month,c.day) as pre_s_day, " + 
					"     we.water, "+ 
					"     we.elect, "+
					"     c.created "+
					" FROM "+
					"     t_checkin as c, "+
					"     t_house as h, "+
					"     t_waterelect as we "+
					" WHERE "+
					"     c.houseid = h.id "+
					" AND c.houseid = we.houseid "+
					" AND c.roomno = we.roomno " + 
					" AND we.year = " + year
					+ " AND we.month = "+ month
					+ " AND c.houseid = ? "+
					" AND c.roomno = ? ";
		return dao.findFirst(sql, params);
	}
	
	/**
	 * 查找空房
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> selectAllEmptyRoom(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = "select h.housename,r.houseid,r.roomno,r.monthmoney,r.pressmoney,r.description,r.created from t_room as r,t_house h "
				+ " where r.houseid = h.id and (r.houseid,r.roomno) not in (select houseid,roomno from t_checkin)  ";
				
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " and r.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " and r.typecode in ('"+roomtypeid+"')";
				}
		return dao.find(sql, null, pageRequest);
	}
	
	/**
	 * 入住查询功能
	 * 
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> queryAllRoomfulByParams(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String houseid = params.get("houseid");
		String roomtypeid = params.get("roomtypeid");
		String sql = " SELECT "+
				"     h.housename, "+
				"     r.houseid, "+
				"     r.roomno, "+
				"     c.customname,"+
				"     c.monthmoney, "+
				"     c.pressmoney, "+
				"     CONCAT_WS('-',c.year,c.month,c.day) as in_day, "+
				"     CONCAT_WS('-',rm.year,rm.month,rm.day) as s_day, "+
				"     rm.roommoney, "+ 
				"     rm.year as d_year, "+ 
				"     rm.month as d_month"+
				" FROM "+
				"     t_room AS r, "+
				"     t_house AS h, "+
				"     t_checkin AS c, " +
				"     t_room_money AS rm "+
				" WHERE "+
				"     r.houseid = h.id "+
				" AND r.houseid = c.houseid "+
				" AND r.roomno = c.roomno "+ 
				" AND r.houseid = rm.houseid "+
				" AND r.roomno = rm.roomno ";
				if (houseid != null && houseid.trim().length() > 0 ) {
					sql = sql + " AND c.houseid in ("+houseid+")";
				}
				if (roomtypeid != null && roomtypeid.trim().length() > 0 ) {
					sql = sql + " AND c.typecode in ('"+roomtypeid+"')";
				}
				sql = sql + " order by rm.created desc ";
		return dao.find(sql, null, pageRequest);
	}
	
	public Map<String,Object> getCheckinQueryPageMapById(int houseid,int roomno,int year,int month) throws Exception{
		Object[] params = { houseid,roomno};
//		int year = DateUtil.getThisYear();
//		int month = DateUtil.getThisMonth() -1 ;
		String sql = " SELECT "+
                "     h.housename, "+
                "     r.houseid, "+
                "     r.roomno, "+
                "     c.customname,"+
                "     c.monthmoney, "+
                "     c.pressmoney, "+
                "     CONCAT_WS('-',c.year,c.month,c.day) as in_day, "+
                "     CONCAT_WS('-',rm.year,rm.month,rm.day) as s_day, "+
                "     rm.roommoney, "+ 
                "     rm.year as d_year, "+ 
                "     rm.month as d_month, " + 
                "     c.internet,"+ 
                "     c.ip,"+ 
                "     c.trash, " + 
                "     c.keycount, "+ 
                "     c.keyprice,"+ 
                "     we.water, "+ 
                "     we.waterprice, "+ 
                "     we.elect, "+ 
                "     we.electprice"+
                " FROM "+
                "     t_room AS r, "+
                "     t_house AS h, "+
                "     t_checkin AS c, "
                + "   t_waterelect AS we,"+
                "     t_room_money AS rm "+
                " WHERE "+
                "     r.houseid = h.id "+
                " AND r.houseid = c.houseid "+
                " AND r.roomno = c.roomno "+ 
                " AND c.houseid = we.houseid "+ 
                " AND c.roomno = we.roomno " + 
                " AND we.year = rm.year "+ 
                " AND we.month = rm.month "+
                " AND r.houseid = rm.houseid "+
                " AND r.roomno = rm.roomno " + 
					" AND we.year = " + year
					+ " AND we.month = "+ month
					+ " AND c.houseid = ? "+
					" AND c.roomno = ? ";
		return dao.findFirst(sql, params);
	}
	
}
