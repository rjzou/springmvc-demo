package com.tiaotiao.web.service;

import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.WaterElectCfg;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 水电价格配置表service
 * @author zouruijin
 */
@Service
public class WaterElectCfgService {
	@Resource
	private Dao dao;
	
	private Logger logger = Logger.getLogger(WaterElectCfgService.class.getName());
	
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
	public WaterElectCfg getWaterelectCfgById(int year,int month) throws Exception{
		Object[] params = { year,month};
		String sql = "select year,month,waterprice,electprice,created,updated from t_waterelect_cfg where year = ? and month = ? ";
		return dao.findFirst(WaterElectCfg.class,sql, params);
	}
	
	/**
	 *  查询水电表价格数据
	 * @param params
	 * @param pageRequest
	 * @return
	 * @throws Exception
	 */
	public Page<Map<String, Object>> getWaterelectCfgListByParams(Map<String, String> params, final PageRequest pageRequest) throws Exception{
		String year = params.get("year");
		String month = params.get("month");
		String sql = "select wec.year,wec.month,wec.waterprice,wec.electprice,wec.created,wec.updated from t_waterelect_cfg as wec where 1=1 ";
				
				if (year != null && year.trim().length() > 0 ) {
					sql = sql + " and wec.year in ("+year+")";
				}
				if (month != null && month.trim().length() > 0 ) {
					sql = sql + " and wec.month in ('"+month+"')";
				}
				sql = sql + " order by wec.year,wec.month ";
		return dao.find(sql, null, pageRequest);
	}
}
