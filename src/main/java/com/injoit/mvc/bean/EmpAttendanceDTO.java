package com.injoit.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class EmpAttendanceDTO {
	
	private String employeenum;
	private String name;
	private Date onwork;
	private Date offwork;
	
}
