package com.tiaotiao.web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 水电价格配置表service
 * @author zouruijin
 */
@Service
public class WaterelectCfgService {
	@Resource
	private Dao dao;
	/**
	 * 插入水电价格表数据
	 * @param wec
	 * @return
	 * @throws Exception
	 */
	public int insertWaterElectCfg(WaterElectCfg wec) throws Exception{
		Object[] params = { wec.getYear(), wec.getMonth(),wec.getWaterprice(),wec.getElectprice(), wec.getCreated()};
		String sql = "insert into t_waterelect_cfg(year,month,waterprice,electprice,created) values(?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 修改水电价格表数据
	 * @param wec
	 * @return
	 * @throws Exception
	 */
	public int updateWaterElectCfg(WaterElectCfg wec) throws Exception{
		Object[] params = { wec.getWaterprice(),wec.getElectprice(),wec.getUpdated(), wec.getYear(), wec.getMonth()};
		String sql = "update t_waterelect_cfg set waterprice = ?,electprice = ?,updated =? where year=? and month =? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 取得水电价格表实体数据
	 * @param house_id
	 * @param room_no
	 * @return
	 * @throws Exception
	 */
	public WaterElectCfg selectWaterelectCfgById(int year,int month) throws Exception{
		Object[] params = { year,month};
		String sql = "select waterprice,electprice,created,updated from t_waterelect_cfg where year = ? and month = ? ";
		return dao.findFirst(WaterElectCfg.class,sql, params);
	}
	
	
}
