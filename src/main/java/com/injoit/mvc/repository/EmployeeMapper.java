package com.injoit.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.EmployeeDTO;

public interface EmployeeMapper {
	public int insertEmp(EmployeeDTO dto);
	public void insertauth(@Param("userid") String id, @Param("auth") String auth);
	public void createCal(String id);
	public int confirmid(String id);
	public void insertCal(CalendarDTO dto);
	public void up_Cal(CalendarDTO dto);
	public void up_pro(@Param("id") String id, @Param("profile") String profile);
	public int up_emp(EmployeeDTO dto);
	public void withdraw(String id);
	public EmployeeDTO mypage(String id);
	public List<CalendarDTO> calendar(String id);
	public String profile(String id);
	public void memout(String id);
	public String departname(String departnum);
}
