package com.injoit.mvc.controller;

import java.util.List;

import com.injoit.mvc.bean.EmployeeDTO;

import lombok.Data;

@Data
public class ListDTO {
	private String typevalue;
    private String img;
    private int num;
    private int count;
    private List<EmployeeDTO> name;

    public ListDTO(String typevalue, String img, int num, int count, List<EmployeeDTO> name) {
	        this.typevalue = typevalue;
	        this.img = img;
	        this.num = num;
	        this.count = count;
	        this.name = name;
    }
}
