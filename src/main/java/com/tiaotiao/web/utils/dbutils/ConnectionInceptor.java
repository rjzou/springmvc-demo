package com.tiaotiao.web.utils.dbutils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.sql.Connection;



public class ConnectionInceptor implements InvocationHandler   {

	private Connection connection;
	public ConnectionInceptor(Connection connection){
		this.connection=connection;
	}
	@Override
	public Object invoke(Object proxy, Method method, Object[] args)
			throws Throwable {
		//System.out.println("connection方法被调用:"+method.getName());
		if(method.getName().equals("close")){
			DbMonitorGetConnection.connections.remove(connection);
		}
		Object obj=method.invoke(connection, args);
		return obj;
	}
}
