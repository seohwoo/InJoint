package com.injoit.mvc.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test1 {
	
	public static void main(String[] args) {
		
		int maxPageNum = (int) (0 / 10) + (0 % 10 == 0 ? 0 : 1);
		String str = String.valueOf(maxPageNum);
		System.out.println(Integer.parseInt(str));
	}
}
