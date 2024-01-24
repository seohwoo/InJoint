package com.injoit.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.injoit.mvc.bean.EmpApprovalDTO;
import com.injoit.mvc.service.BoardService;

@Controller
@RequestMapping("/Approval/*")
public class BoardController {
	
	@Autowired
	private BoardService boardServiceImpl;
	
	@RequestMapping("/boardform")
	public String boardform() {
		return "ApprovalBoard/form";
	}
	
	@RequestMapping("/boardlist")
	public String boardList(Model model) {
			boardServiceImpl.ApprovalList(model);
		return "ApprovalBoard/list";
	}
	
	@PostMapping("/boardReg")
	public String boardReg(HttpSession session,HttpServletRequest req, HttpServletResponse resp,String title, String content, Model model) {
		String realPath = req.getServletContext().getRealPath("/resources/file/ApprovalBoard");
		String id = "2440040011";
		boardServiceImpl.ApprovalReg(id,title,content,realPath,session);
		return "redirect:/Approval/boardlist";
	}
	@RequestMapping("/boardUpdate")
	public String boardUpdate(HttpSession session,HttpServletRequest req,Model model, int num) {
		String realPath = req.getServletContext().getRealPath("/resources/file/ApprovalBoard/");
		boardServiceImpl.ApprovalUpdate(realPath, num, model);
		return "ApprovalBoard/update";
	}
	@RequestMapping("/boardUpdateReg")
	public String boardDelUpdate(HttpServletRequest req, int num, String title, String content, MultipartFile thumbnail) {
		String realPath=req.getServletContext().getRealPath("/resources/file/ApprovalBoard/");
		String id = "2440040011";
		boardServiceImpl.ApprovalUpdateReg(realPath, num, title, content, id);
		return "redirect:/Approval/aprvlContent?num="+num;
	}
	
	@RequestMapping(value="/uploadImageFile", produces = "application/json; charset=utf8")
    @ResponseBody
    public String uploadImageFile(@RequestParam("file") MultipartFile multipartFile,
            HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/file/ApprovalBoard/");
		return boardServiceImpl.ApprovalImgUpload(multipartFile, realPath);
	}
	@RequestMapping(value = "/deleteImageFile", produces = "application/json; charset=utf8")
    public String deleteSummernoteImageFile(@RequestParam("file") String fileName,HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/file/ApprovalBoard/");
		boardServiceImpl.ApprovalImgDel(fileName, realPath);
		return "redirect:/Approval/boardlist";
	}
	@RequestMapping("/aprvlContent")
	public String aprvContent(int num,Model model) {
		boardServiceImpl.ApprovalContent(model, num);
		return "ApprovalBoard/content";
	}
	@RequestMapping("/boardDelete")
	public String boardDelete(int num) {
		boardServiceImpl.ApprovalDelete(num);
		return "redirect:/Approval/boardlist";
	}
}
