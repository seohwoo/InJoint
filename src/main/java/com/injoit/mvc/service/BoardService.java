package com.injoit.mvc.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	public void ApprovalReg(String id,String title,String content,String realPath,HttpSession session);
	public void ApprovalUpdate(String realPath,int num,Model model);
	public void ApprovalUpdateReg(String realPath, int num, String title, String content, String id);
	public String ApprovalImgUpload(MultipartFile multipartFile,String realPath);
	public void ApprovalImgDel(String fileName,String realPath);
	public void ApprovalList(Model model);
	public void ApprovalContent(Model model,int num);
	public void ApprovalDelete(int num);
}
