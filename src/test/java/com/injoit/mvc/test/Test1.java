package com.injoit.mvc.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test1 {

	public String[] todayInfo() {
		String[] result = new String[3];
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd/HH/mm");
		String formatDate = simpleDateFormat.format(date);
		String[] today = formatDate.split("/");
		String day = today[0] + "/" + today[1] + "/" + today[2]; 
		String time = today[3] + "/" + today[4];
		result[0] = formatDate;
		result[1] = day;
		result[2] = time;
		return result;
	}
	
	public static void main(String[] args) {
		
		Test1 test1 = new Test1();
		System.out.println(test1.todayInfo()[0]);
		System.out.println(test1.todayInfo()[1]);
		System.out.println(test1.todayInfo()[2]);
	}
}
