package com.injoit.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.injoit.mvc.service.TestService;


@Controller
@RequestMapping("/test/*")
public class TestController {

	@Autowired
	private TestService service;
	
	@RequestMapping("main")
	public String test(Model model) {
		int count = service.count();
		model.addAttribute("count", count);
		return "/test/main";
	}
	
	@RequestMapping("chat")
	public String chat() {
		return "/test/sample";
	}
	
}
