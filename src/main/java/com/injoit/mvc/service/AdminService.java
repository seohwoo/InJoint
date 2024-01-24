package com.injoit.mvc.service;

import org.springframework.ui.Model;

import com.injoit.mvc.bean.NoticeBoardDTO;

public interface AdminService {

	public void findAllEmployee(Model model, int pageNum);
	public void onWorkEmp(Model model, String employeenum);
	public void offWorkEmp(Model model, String employeenum);
	public void findAllEmpAttendance(Model model, int pageNum);
	public void findMyChatRoom(Model model, String employeenum);
	public void chatting(Model model, String roomname, String chatno, String employeenum);
	public void addChat(Model model, String employeenum);
	public void createRoom(Model model, String[] invite, String roomname, String employeenum);
	public int changeJoinCnt(int joincnt, int chatno,int updown, String employeenum);
	public void changeNoreadCnt(int chatno);
	public void showAllNotice(Model model, int pageNum);
	public void showNoticeContent(Model model,String no);
	public void insertNotice(NoticeBoardDTO dto);
	public void updateToForm(Model model, String no);
	public void updateNotice(NoticeBoardDTO dto);
	public void deleteNotice(NoticeBoardDTO dto);
}
