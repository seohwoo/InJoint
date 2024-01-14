package com.injoit.mvc.service;

import org.springframework.ui.Model;

public interface AdminService {

	public void findAllEmployee(Model model, int pageNum);
	public void onWorkEmp(Model model, String employeenum);
	public void offWorkEmp(Model model, String employeenum);
	public void findAllEmpAttendance(Model model, int pageNum);
	
}
