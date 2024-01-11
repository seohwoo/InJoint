package com.injoit.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injoit.mvc.service.AdminService;

@RequestMapping("/admin/")
@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("showEm")
	public String showEmployee(Model model, String pageNum) {
		if(pageNum==null) {
			pageNum = "1";
		}
		service.findAllEmployee(model, Integer.parseInt(pageNum));
		return "admin/showEmployee";
	}
	
}
