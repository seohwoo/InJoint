package com.injoit.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.service.AdminService;
import com.injoit.mvc.service.EmployeeService;

@RequestMapping("/admin/")
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private EmployeeService empService;
	
	@RequestMapping("showEmp")
	public String showEmployee(Model model, String pageNum, Principal pri) {
		if(pageNum==null) {
			pageNum = "1";
		}
		service.findAllEmployee(model, Integer.parseInt(pageNum));
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		model.addAttribute("pageUrl", "/admin/showEmp");
		return "admin/showEmployee";
	}
	
	@RequestMapping("attendance")
	public String showAttendance(Model model, String pageNum, Principal pri) {
		if(pageNum==null) {
			pageNum = "1";
		}
		service.findAllEmpAttendance(model, Integer.parseInt(pageNum));
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		model.addAttribute("pageUrl", "/admin/attendance");
		return "admin/showAttendance";
	}
	
	@RequestMapping("onWork")
	public String onWork(Model model, Principal pri) {
		service.onWorkEmp(model, pri.getName());
		return "admin/onwork";
	}
	@RequestMapping("offWork")
	public String offWork(Model model, Principal pri) {
		service.offWorkEmp(model, pri.getName());
		return "admin/offwork";
	}
	
}
