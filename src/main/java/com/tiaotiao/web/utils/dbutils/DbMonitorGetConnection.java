package com.tiaotiao.web.utils.dbutils;

import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.dbcp.BasicDataSource;

public class DbMonitorGetConnection extends BasicDataSource {
	public static Map<Connection, String> connections=new ConcurrentHashMap<Connection, String>();
	@Override
	public Connection getConnection() throws SQLException {
		StackTraceElement[] ste=Thread.currentThread().getStackTrace();
		StringBuilder sb=new StringBuilder();
		for (StackTraceElement stackTraceElement : ste) {
			String str=stackTraceElement.getClassName()+":"+stackTraceElement.getMethodName();
			sb.append(str+"\n");
		}
		Connection con=super.getConnection();
		ConnectionInceptor ci=new ConnectionInceptor(con);
		Connection proxy=(Connection) Proxy.newProxyInstance(DbMonitorGetConnection.class.getClassLoader(), new Class[]{Connection.class}, ci);  
		connections.put(con, sb.toString());
		return proxy;
	}
}