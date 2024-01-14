package com.injoit.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class Vote_queDTO {
	private int no;
	private String title;
	private Date startdate;
	private Date enddate;
	private int typevalue;
	private String employeenum;
	private String anonymous;
}
