package com.tiaotiao.web.utils;

import java.util.UUID;

import com.fasterxml.uuid.Generators;

public class GuidUtil {

	public static String guid() {
		UUID uuid = Generators.timeBasedGenerator().generate();
		return String.valueOf(uuid);
	}
	
	public static void main(String args[]) {
		System.out.println("guid=" + GuidUtil.guid());
	}
}
