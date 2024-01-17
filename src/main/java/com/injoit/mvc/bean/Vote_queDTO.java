package com.injoit.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Vote_queDTO {
	private int no;
	private String title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date enddate;
	private int typenum;
	private String employeenum;
	private String anonymous;
	
//	private Vote_countDTO vc;
}
