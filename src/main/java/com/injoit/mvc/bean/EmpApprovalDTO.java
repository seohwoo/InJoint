package com.injoit.mvc.bean;

import java.util.Date;

import lombok.Data;
@Data
public class EmpApprovalDTO {
	private int no;
	private String title;
	private String writer;
	private String content;
	private String process;
	private Date reg;
	private String reject_id;
	private String reject_content;
	private Date reject_reg;
}
