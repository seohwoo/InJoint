package com.injoit.mvc.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.injoit.mvc.controller.ListDTO;

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
	private List<ListDTO> img;
	private int allcount;
	private int check;
	private Vote_countDTO vc;
}
