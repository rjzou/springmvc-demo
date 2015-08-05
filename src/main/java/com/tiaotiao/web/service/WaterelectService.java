package com.tiaotiao.web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Room;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 抄水电表service
 * @author zouruijin
 */
@Service
public class WaterelectService {
	@Resource
	private Dao dao;
	/**
	 * 插入水电表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int insertWaterElect(WaterElect we) throws Exception{
		Object[] params = { we.getHouseid(), we.getRoomno(), we.getWater(),we.getWaterprice(),we.getElect(),we.getElectprice(),we.getYear(), we.getMonth(),we.getDay(), we.getCreated()};
		String sql = "insert into t_waterelect(houseid,roomno,water,waterprice,elect,electprice,year,month,day,created) values(?,?,?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 修改水电表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int updateWaterElect(WaterElect we) throws Exception{
		Object[] params = { we.getWater(),we.getElect(), we.getYear(), we.getMonth(),we.getDay(),we.getHouseid(),we.getHouseid(), we.getRoomno()};
		String sql = "update t_waterelect set water = ?,elect = ?,year = ?,month = ?,day = ?,updated =? where houseid=? and roomno =? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 取得水电表实体数据
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public WaterElect selectWaterelectById(int houseid,int roomno) throws Exception{
		Object[] params = { houseid,roomno};
		String sql = "select houseid,roomno,water,waterprice,elect,electprice,year,month,day,created,updated from t_waterelect where houseid = ? and roomno = ? ";
		return dao.findFirst(WaterElect.class,sql, params);
	}
	
	
}
