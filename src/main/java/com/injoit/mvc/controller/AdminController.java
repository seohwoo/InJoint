package com.injoit.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.NoticeBoardDTO;
import com.injoit.mvc.service.AdminService;
import com.injoit.mvc.service.EmployeeService;

@RequestMapping("/admin/*")
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
		boolean isAdmin = false;
		service.findAllEmployee(model, Integer.parseInt(pageNum));
		EmployeeDTO dto = empService.mypage(pri.getName());
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		model.addAttribute("my", dto);
		model.addAttribute("pageUrl", "/admin/showEmp");
		return "admin/showEmployee";
	}
	
	@RequestMapping("attendance")
	public String showAttendance(Model model, String pageNum, Principal pri) {
		if(pageNum==null) {
			pageNum = "1";
		}
		boolean isAdmin = false;
		service.findAllEmpAttendance(model, Integer.parseInt(pageNum));
		EmployeeDTO dto = empService.mypage(pri.getName());
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
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
	
	@RequestMapping("notice/list")
	public String noticeList(Model model, Principal pri, String pageNum) {
		if(pageNum==null) {
			pageNum = "1";
		}
		service.showAllNotice(model, Integer.parseInt(pageNum));
		EmployeeDTO dto = empService.mypage(pri.getName());
		boolean isAdmin = false;
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		model.addAttribute("my", dto);
		model.addAttribute("pageUrl", "/admin/attendance");
		return "admin/notice/noticeList";
	}
	
	@RequestMapping("notice/content")
	public String noticeContent(Model model, Principal pri, String no) {
		service.showNoticeContent(model, no);
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		boolean isAdmin = false;
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		return "admin/notice/noticeContent";
	}
	
	@RequestMapping("notice/input")
	public String insertNotice(Model model, Principal pri) {
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		boolean isAdmin = false;
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		return "admin/notice/insertNotice";
	}
	
	@RequestMapping("notice/inputPro")
	public String insertNoticePro(NoticeBoardDTO dto) {
		service.insertNotice(dto);
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping("notice/update")
	public String updateNotice(Model model, Principal pri, String no) {
		service.updateToForm(model, no);
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		boolean isAdmin = false;
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		return "admin/notice/updateNotice";
	}
	
	@RequestMapping("notice/updatePro")
	public String updateNoticePro(NoticeBoardDTO dto) {
		service.updateNotice(dto);
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping("notice/delete")
	public String deleteNotice(Model model, Principal pri, String no) {
		service.updateToForm(model, no);
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		boolean isAdmin = false;
		if(dto.getDepartnum().equals("6666")) {
			isAdmin = true;
		}
		model.addAttribute("isAdmin", isAdmin);
		return "admin/notice/deleteNotice";
	}
	
	@RequestMapping("notice/deletePro")
	public String deleteNoticePro(NoticeBoardDTO dto) {
		service.deleteNotice(dto);
		return "redirect:/admin/notice/list";
	}
	
	
	
	
	
}
