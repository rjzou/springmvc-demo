package com.tiaotiao.web.entity;

public class Custom {
	private String id;
	private String customname;
	private String iphone;
	private String cardid;
	private int year;
	private int month;
	private int day;
	private long created;
	private long updated;

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	
	public String getCustomname() {
		return customname;
	}
	public void setCustomname(String customname) {
		this.customname = customname;
	}
	public String getCardid() {
		return cardid;
	}
	public void setCardid(String cardid) {
		this.cardid = cardid;
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
