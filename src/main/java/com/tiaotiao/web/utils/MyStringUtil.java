package com.tiaotiao.web.utils;

import org.apache.commons.lang.StringUtils;

public class MyStringUtil {
	public static String convertToInSql(String s) {
		String[] s_array = null;
		if (s != null && s.trim().length() >0 ) {
			s_array = s.split(",");
		}
		String result = null;
		if (s_array != null && s_array.length > 0 ) {
			StringBuffer sb = new StringBuffer();
			for (String o : s_array) {
				sb.append("'");
				sb.append(o);
				sb.append("',");
			}
			result = StringUtils.substringBeforeLast(sb.toString(), ",");
		}
		return result;
	}
}
