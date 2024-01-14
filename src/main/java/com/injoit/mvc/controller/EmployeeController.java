package com.injoit.mvc.controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.service.EmployeeService;


@Controller
@RequestMapping("/emp/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@RequestMapping("all")
	public String all() {
		return "employee/all";
	}
	
	@RequestMapping("worker")
	public String worker() {
		return "employee/worker";
	}
	@RequestMapping("admin")
	public String admin() {
		return "employee/admin";
	}
	
	//접근 제한 에러 
	@RequestMapping("accessError")
	public String accessError(Authentication auth) {
		System.out.println("access Denied===>>"+auth);
		return "employee/accessError";
	}
	//로그인
	@RequestMapping("customLogin")
	public String doLogin(HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		if(referer != null) {
			req.getSession().setAttribute("url_prior", referer);
		}
		System.out.println("aa" + referer);
		return "employee/login";
	}
	//로그아웃
	@RequestMapping("customLogout")
	public String doLogout() {
		return "redirect:/emp/all";
	}
	//회원가입 폼
	@RequestMapping("registerForm")
	public String register() {
		return "employee/registerForm";
	}
	// 아이디 중복확인
	@RequestMapping(value ="idCheck", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String idCheck(String id) {
		int result = service.confirmid(id);
		String com = "사용 불가능한 아이디입니다";
		if(result == 0) {
			com = "사용 가능한 아이디입니다";
		}
		return com;
	}
	//회원가입 
	@RequestMapping("registerPro")
	public String registerPro(EmployeeDTO dto) {
		service.insertEmp(dto);
		return "redirect:/emp/customLogin";
	}
	@RequestMapping("aa")
	public String registe() {
		return "employee/auth";
	}
	@RequestMapping("/member/calendar")
	public String calendar() {
		return "employee/member/calendar";
	}
	@RequestMapping("mypage")
	public String mypage(Principal pri, Model model) {
		EmployeeDTO dto = service.mypage(pri.getName());
		String departname = service.departname(dto.getDepartnum());
		dto.setDepartname(departname);
		model.addAttribute("my", dto);
		return "employee/mypage";
	}
	@RequestMapping("profile")
	public String profile(HttpServletRequest request, MultipartFile profile, String id) {
		String path = request.getServletContext().getRealPath("/resources/profile/");
		
		String contentType = profile.getContentType();
		if(contentType.split("/")[0].equals("image")){
			String orgName = profile.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			File copy = new File(path + id + ext);
			service.up_pro(id, id+ext);
			try {
				profile.transferTo(copy);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:/emp/mypage";
	}
	
	@RequestMapping("room")
	public String chatRoom() {
		return "employee/room";
	}

	@RequestMapping("header")
	public String header(Principal pri, Model model) {
		String profile = service.profile(pri.getName());
		model.addAttribute("profile", profile);
		return "employee/header";
	}
	@RequestMapping("memoutPro")
	public String memoutPro(Principal pri) {
		service.memout(pri.getName());
		return "redirect:/emp/customLogin";
	}
	@RequestMapping("memout")
	public String memout() {
		return "employee/memout";
	}
	@RequestMapping("/member/vote")
	public String vote() {
		return "employee/member/vote";
	}
	
}
