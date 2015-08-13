package com.tiaotiao.web.entity;

/**
 * 水电表
 * @author Administrator
 *
 */
public class WaterElect {
	private String houseid;
	private int roomno;
	private int water;
	private double waterprice;
	private int elect;
	private double electprice;
	private int year;
	private int month;
	private int day;
	private long created;
	private long updated;


	public String getHouseid() {
		return houseid;
	}
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public int getWater() {
		return water;
	}
	public void setWater(int water) {
		this.water = water;
	}
	public int getElect() {
		return elect;
	}
	public void setElect(int elect) {
		this.elect = elect;
	}
	
	
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
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
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
