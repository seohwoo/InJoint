package com.injoit.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeDTO {
	
	private int no;
	private String id;
	private String pw;
	private String name;
	private String profile;
	private String email;
	private String phone;
	private String addr1;
	private String addr2;
	private Date birth;
	private String department;
	private String position;
	private Date reg;
	private int status;

}
