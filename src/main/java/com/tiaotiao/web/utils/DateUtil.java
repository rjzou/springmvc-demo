package com.tiaotiao.web.utils;

import java.util.Calendar;

public class DateUtil {
	public static Calendar calendar = Calendar.getInstance();

	/**
	 * 取得今年年份
	 * 
	 * @return
	 */
	public static int getThisYear() {
		return calendar.get(Calendar.YEAR);
	}

	/**
	 * 取得當月月份
	 * 
	 * @return
	 */
	public static int getThisMonth() {
		return calendar.get(Calendar.MONTH) + 1;
	}

	/**
	 * 取得今天日期
	 * 
	 * @return
	 */
	public static int getThisDay() {
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	public static void main(String args[]) {
		System.out.println("Year=" + DateUtil.getThisYear());
		System.out.println("Month=" + DateUtil.getThisMonth());
		System.out.println("Day=" + DateUtil.getThisDay());
	}

}
