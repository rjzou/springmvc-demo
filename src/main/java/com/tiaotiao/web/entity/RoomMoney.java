package com.tiaotiao.web.entity;

/**
 * 水电表
 * @author Administrator
 *
 */
public class RoomMoney {
	private int houseid;
	private int roomno;
	private int monthmoney;
	private int pressmoney;
	private double roommoney;
	private int year;
	private int month;
	private int day;
	private long created;
	private long updated;
	public int getHouseid() {
		return houseid;
	}
	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
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
	public double getRoommoney() {
		return roommoney;
	}
	public void setRoommoney(double roommoney) {
		this.roommoney = roommoney;
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
