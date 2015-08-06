package com.tiaotiao.web.entity;

/**
 * 水电价格配置表
 * @author Administrator
 *
 */
public class WaterElectCfg {
	private int year;
	private int month;
	private double waterprice;
	private double electprice;
	private long created;
	private long updated;
	
	public double getWaterprice() {
		return waterprice;
	}
	public void setWaterprice(double waterprice) {
		this.waterprice = waterprice;
	}
	public double getElectprice() {
		return electprice;
	}
	public void setElectprice(double electprice) {
		this.electprice = electprice;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public long getCreated() {
		return created;
	}
	public void setCreated(long created) {
		this.created = created;
	}
	public long getUpdated() {
		return updated;
	}
	public void setUpdated(long updated) {
		this.updated = updated;
	}
	
	
}
