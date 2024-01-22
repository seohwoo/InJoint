package com.injoit.mvc.repository;

import java.util.HashMap;
import java.util.List;

import com.injoit.mvc.bean.ChatDTO;
import com.injoit.mvc.bean.EmpAttendanceDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.NoticeBoardDTO;

public interface AdminMapper {
	
	public int employeeCnt(); 
	public List<EmployeeDTO> showAllEmployee(HashMap<String, String> map);
	public int isCommute(HashMap<String, String> map);
	public int isOffWork(HashMap<String, String> map);
	public void onWorkEmp(HashMap<String, String> map);
	public void offWorkEmp(HashMap<String, String> map);
	public int empAttendanceCnt(HashMap<String, String> map);
	public int empOnWorkCnt(HashMap<String, String> map);
	public List<EmpAttendanceDTO> showEmpAttendance(HashMap<String, String> map);
	public int myChatRoomCnt(String employeenum);
	public List<ChatDTO> findMyChatRoom(String employeenum);
	public List<EmployeeDTO> findAllEmpToChat(String employeenum);
	public int isRoom(HashMap<String, String> map);
	public void insertRoomToMe(HashMap<String, String> map);
	public void insertRoomToOther(HashMap<String, String> map);
	public int findChatNo(HashMap<String, String> map);
	public ChatDTO inRoomInfo(HashMap<String, String> map);
	public String findProfile(HashMap<String, String> map);
	public int findJoinCnt(HashMap<String, String> map);
	public void updateJoinCnt(HashMap<String, String> map);
	public int noticeBoardCnt();
	public List<NoticeBoardDTO> findAllNotice(HashMap<String, String> map);
	public NoticeBoardDTO findNoticeContent(HashMap<String, String> map);
	public void readCntUp(HashMap<String, String> map);
	public void insertNotice(NoticeBoardDTO dto);
	public void updateNotice(NoticeBoardDTO dto);
	public void deleteNotice(NoticeBoardDTO dto);
}
