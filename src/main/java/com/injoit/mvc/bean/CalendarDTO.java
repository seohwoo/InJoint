package com.injoit.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CalendarDTO {
	private String id;
	@DateTimeFormat(pattern="yyyy-DD-mm")
	private Date start_reg;
	@DateTimeFormat(pattern="yyyy-DD-mm")
	private Date end_reg;
	private String content;
	private int status;
}