package com.injoit.mvc.bean;

import lombok.Data;

@Data
public class Vote_countDTO {
	private int num;
	private int no;
	private String typevalue;
	private String img;
	private int vocount;
	private Vote_queDTO vq;
}
