package com.injoit.mvc.data;

import java.net.InetAddress;

public class FileRoot {
	//본인 컴퓨터 폴더 경로
	private static final String filepath = "C:\\Users\\User\\Documents\\dvsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\InJoit\\resources\\chatRoom";
	//본인 아이피
	private static String ip = findIp();
	
	private static String findIp() {
		String ip = "";
		try{
			InetAddress localhost = InetAddress.getLocalHost();
			ip = localhost.getHostAddress();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
		return ip;
	}
	
	public static String getIp() {
		return ip;
	}
	
	public static String getFilepath() {
		return filepath;
	}
	
}
