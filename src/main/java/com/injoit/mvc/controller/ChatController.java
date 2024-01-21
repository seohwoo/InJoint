package com.injoit.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.service.AdminService;
import com.injoit.mvc.service.EmployeeService;

@RequestMapping("/chat/*")
@Controller
public class ChatController {
	
	@Autowired
	private AdminService service;
	@Autowired
	private EmployeeService empService;
	
	@RequestMapping("list")
	public String ChatRoom(Model model, Principal pri) {
		service.findMyChatRoom(model, pri.getName());
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		return "/chat/chatRoom";
	}
	
	@RequestMapping("room")
	public String room(Model model, Principal pri, String roomname, String chatno) {
		service.chatting(model, roomname, chatno, pri.getName());
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		model.addAttribute("roomname", roomname);
		return "/chat/room";
	}
	
	@PostMapping("/updateCount")
    @ResponseBody
    public String updateCount(@RequestParam("cnt") int cnt, 
    		@RequestParam("chatno") int chatno, @RequestParam("username") String username) {
        return String.valueOf(cnt); 
    }
	
	@PostMapping("/updateJoin")
	@ResponseBody
	public String updateJoin(@RequestParam("joincnt") int joincnt, 
			@RequestParam("chatno") int chatno, @RequestParam("updown") int updown) {
		joincnt = service.changeJoinCnt(joincnt, chatno, updown);
		return String.valueOf(joincnt); 
	}
	
	
	
	@RequestMapping("addChat")
	public String addChat(Model model, Principal pri) {
		service.addChat(model, pri.getName());
		EmployeeDTO dto = empService.mypage(pri.getName());
		model.addAttribute("my", dto);
		return "/chat/addChat";
	}
	
	@RequestMapping("createRoom")
	public String createRoom(Model model, Principal pri, String[] invite, String roomname) {
		service.createRoom(model, invite, roomname, pri.getName());
		return "redirect:/chat/list";
	}
	
	
	
}
