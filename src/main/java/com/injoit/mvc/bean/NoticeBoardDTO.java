package com.injoit.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardDTO {
	
	private int no;
	private String title;
	private String writer;
	private String content;
	private Date reg;
	private int readcnt;

}
