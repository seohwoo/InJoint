package com.injoit.mvc.service;

import java.util.List;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.EmployeeDTO;

public interface EmployeeService {
	public int insertEmp(EmployeeDTO dto);
	public int confirmid(String id);
	public void insertCal(CalendarDTO dto);
	public void up_Cal(CalendarDTO dto);
	public void up_pro(String id, String profile);
	public int up_emp(EmployeeDTO dto);
	public void withdraw(String id);
	public EmployeeDTO mypage(String id);
	public List<CalendarDTO> calendar(String id);
	public String profile(String id);
	public void memout(String id);
	public String departname(String departnum);

}
