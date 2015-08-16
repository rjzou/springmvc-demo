package com.tiaotiao.web.entity;

public class Checkin {
	private String houseid;
	private int roomno;
	private String customid;
	private int trash;
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
	
	public int getTrash() {
		return trash;
	}
	public String getCustomid() {
		return customid;
	}
	public void setCustomid(String customid) {
		this.customid = customid;
	}
	public void setTrash(int trash) {
		this.trash = trash;
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
