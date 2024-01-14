package com.injoit.mvc.repository;

import com.injoit.mvc.bean.EmployeeDTO;

public interface SecurityMapper {
	public EmployeeDTO read(String id);
}
