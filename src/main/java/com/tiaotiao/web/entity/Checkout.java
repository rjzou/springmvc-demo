package com.tiaotiao.web.entity;

public class Checkout {
	private String houseid;
	private int roomno;
	private String customid;
	private int monthmoney;
	private int pressmoney;
	private int water;
	private int elect;
	private int internet;
	private String ip;
	private int trash;
	private double paymoney;//退回钱
	private int keycount;
	private int keyprice;
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
	
	
	public String getCustomid() {
		return customid;
	}
	public void setCustomid(String customid) {
		this.customid = customid;
	}
	public int getMonthmoney() {
		return monthmoney;
	}
	public void setMonthmoney(int monthmoney) {
		this.monthmoney = monthmoney;
	}
	public int getPressmoney() {
		return pressmoney;
	}
	public void setPressmoney(int pressmoney) {
		this.pressmoney = pressmoney;
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
	public int getInternet() {
		return internet;
	}
	public void setInternet(int internet) {
		this.internet = internet;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getTrash() {
		return trash;
	}
	public void setTrash(int trash) {
		this.trash = trash;
	}
	public double getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(double paymoney) {
		this.paymoney = paymoney;
	}
	public int getKeycount() {
		return keycount;
	}
	public void setKeycount(int keycount) {
		this.keycount = keycount;
	}
	public int getKeyprice() {
		return keyprice;
	}
	public void setKeyprice(int keyprice) {
		this.keyprice = keyprice;
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
