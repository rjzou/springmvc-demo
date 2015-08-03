package com.tiaotiao.web.entity;

public class Room {
	private int house_id;
	private int room_no;
	private int month_money;
	private String description;
	private long created;
	private long updated;
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public int getMonth_money() {
		return month_money;
	}
	public void setMonth_money(int month_money) {
		this.month_money = month_money;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
