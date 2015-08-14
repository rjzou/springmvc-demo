package com.tiaotiao.web.service;

import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tiaotiao.web.entity.Custom;
import com.tiaotiao.web.entity.WaterElect;
import com.tiaotiao.web.utils.Dao;


/**
 * 
 * 客户 Custom 信息表
 * @author zouruijin
 */
@Service
public class CustomService {
	@Resource
	private Dao dao;
	
	private Logger logger = Logger.getLogger(CustomService.class.getName());
	
	
	/**
	 * 插入客户表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int insertCustom(Custom c) throws Exception{
		Object[] params = { c.getId(), c.getCustomname(), c.getIphone(),c.getCardid(),c.getYear(), c.getMonth(),c.getDay(), c.getCreated()};
		String sql = "insert into t_custom(id,customname,iphone,cardid,year,month,day,created) values(?,?,?,?,?,?,?,?) ";
		int n = dao.update(sql, params);
		return n;
	}
	/**
	 * 修改客户表数据
	 * @param we
	 * @return
	 * @throws Exception
	 */
	public int updateCustom(Custom c) throws Exception{
		Object[] params = { c.getCustomname(),c.getIphone(),c.getCardid(),c.getUpdated(), c.getId()};
		String sql = "update t_custom set customname = ?,iphone = ?,cardid = ?,updated =? where id=? ";
		int n = dao.update(sql, params);
		return n;
	}
	
	/**
	 * 取得客户表实体数据
	 * @param house_id
	 * @param room_no
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public Custom getCustomById(String id) throws Exception{
		Object[] params = { id};
		String sql = "select customname,iphone,cardid,year,month,day,created,updated from t_custom where id = ? ";
		return dao.findFirst(Custom.class,sql, params);
	}

	
}
