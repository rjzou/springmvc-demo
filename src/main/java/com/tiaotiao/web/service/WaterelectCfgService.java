package com.tiaotiao.web.service;

import java.util.Map;

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
	public WaterElectCfg getWaterelectCfgById(int year,int month) throws Exception{
		Object[] params = { year,month};
		String sql = "select waterprice,electprice,created,updated from t_waterelect_cfg where year = ? and month = ? ";
		return dao.findFirst(WaterElectCfg.class,sql, params);
	}
	
	public Page<Map<String, Object>> getAllWaterelectCfgByParams(Map<String, String> params, final PageRequest pageRequest) throws Exception{
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
}
