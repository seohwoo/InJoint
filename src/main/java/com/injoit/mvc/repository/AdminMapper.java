package com.injoit.mvc.repository;

import java.util.HashMap;
import java.util.List;

import com.injoit.mvc.bean.EmployeeDTO;

public interface AdminMapper {
	
	public int employeeCnt(); 
	public List<EmployeeDTO> showAllEmployee(HashMap<String, String> map);
	
}
