package com.injoit.mvc.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.injoit.mvc.bean.ChatDTO;
import com.injoit.mvc.bean.EmpAttendanceDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.data.FileRoot;
import com.injoit.mvc.repository.AdminMapper;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	@Autowired
	private HashMap<String, String> employeeMap;
	@Autowired
	private SimpleDateFormat simpleDateFormat;
	
	public void page(int pageSize, int pageNum, int cnt, HashMap map) {
		int maxPageNum = (int) (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1);
		if(pageNum < 1) {
			pageNum = 1;
		}else if(pageNum > maxPageNum) {
			pageNum = maxPageNum;
		}
		int start = (pageNum-1)*pageSize+1;
		int end = pageNum * pageSize;
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("maxPageNum", String.valueOf(maxPageNum));
	}
	
	public void todayInfo(HashMap map) {
		Date date = new Date();
		String formatDate = simpleDateFormat.format(date);
		String[] today = formatDate.split("/");
		String day = today[0] + "/" + today[1] + "/" + today[2]; 
		String time = today[3] + "/" + today[4];
		map.put("today", formatDate);
		map.put("day", day);
		map.put("time", time);
	}
	
	@Override
	public void findAllEmployee(Model model, int pageNum) {
		int pageSize = 10;
		int cnt = mapper.employeeCnt();
		List<EmployeeDTO> list = Collections.EMPTY_LIST;
		page(pageSize, pageNum, cnt, employeeMap);
		if(cnt>0) {
			list = mapper.showAllEmployee(employeeMap);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("maxPageNum", Integer.parseInt(employeeMap.get("maxPageNum")));
		model.addAttribute("employeeList", list);
	}

	@Override
	public void onWorkEmp(Model model, String employeenum) {
		todayInfo(employeeMap);
		employeeMap.put("employeenum", employeenum);
		int cnt = mapper.isCommute(employeeMap);
		if(cnt == 0) {
			mapper.onWorkEmp(employeeMap);
		}
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void offWorkEmp(Model model, String employeenum) {
		todayInfo(employeeMap);
		employeeMap.put("employeenum", employeenum);
		int cnt = mapper.isCommute(employeeMap);
		int isOff = mapper.isOffWork(employeeMap);
		if(cnt == 1 && isOff==0) {
			mapper.offWorkEmp(employeeMap);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("isOff", isOff);
	}

	@Override
	public void findAllEmpAttendance(Model model, int pageNum) {
		Date date = new Date();
		int pageSize = 10;
		todayInfo(employeeMap);
		int cnt = mapper.empAttendanceCnt(employeeMap);
		int empCnt = mapper.employeeCnt();
		int onWorkCnt = mapper.empOnWorkCnt(employeeMap);
		List<EmpAttendanceDTO> list = Collections.EMPTY_LIST;
		page(pageSize, pageNum, cnt, employeeMap);
		if(cnt>0) {
			list = mapper.showEmpAttendance(employeeMap);
		}
		model.addAttribute("day", date);
		model.addAttribute("cnt", cnt);
		model.addAttribute("empCnt", empCnt);
		model.addAttribute("onWorkCnt", onWorkCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("maxPageNum", Integer.parseInt(employeeMap.get("maxPageNum")));
		model.addAttribute("empAttendaceList", list);
		
	}

	@Override
	public void findMyChatRoom(Model model, String employeenum) {
		int cnt = mapper.myChatRoomCnt(employeenum);
		List<ChatDTO> list = Collections.EMPTY_LIST;
		if(cnt > 0) {
			list = mapper.findMyChatRoom(employeenum);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("chatList", list);
	}

	@Override
	public void chatting(Model model, String roomname, String chatno, String employeenum) {
		String chat = "";
		String fileRoot = FileRoot.getFilepath();
		String filePath = "";
		String ip = FileRoot.getIp();
		employeeMap.put("roomname", roomname);
		employeeMap.put("employeenum", employeenum);
		ChatDTO dto = mapper.inRoomInfo(employeeMap);
		int maxJoinCnt = mapper.findJoinCnt(employeeMap);
		try {
			filePath = fileRoot+"\\"+roomname+"_"+chatno+".txt";
			File file = new File(filePath);
			Scanner sc = new Scanner(file);
			while (sc.hasNextLine()) {
				chat += sc.nextLine();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		chat = changeChat(chat, dto);
		model.addAttribute("chat", chat);
		model.addAttribute("dto", dto);
		model.addAttribute("ip", ip);
		model.addAttribute("maxJoinCnt", maxJoinCnt);
	}
	
	private String changeChat(String chat, ChatDTO dto) {
		String result = "";
		String[] arChat = chat.split(",");
		String profile = "";
		for (int i = 0; i < arChat.length; i++) {
			if(i%3==2) {
				employeeMap.put("name", arChat[i-2]);
				profile = mapper.findProfile(employeeMap);
				if(arChat[i-2].equals(dto.getName())) {
					result += "<div class='msg right-msg'><div class='msg-img' style='background-image: url(/resources/file/profile/"+profile+")'></div><div class='msg-bubble'><div class='msg-info'><div class='msg-info-name'>"+ arChat[i-2] +"</div><div class='msg-info-time'>"+arChat[i]+"</div></div><div class='msg-text'>"+arChat[i-1]+"</div></div></div>";
				}else {
					result += "<div class='msg left-msg'><div class='msg-img' style='background-image: url(/resources/file/profile/"+profile+")'></div><div class='msg-bubble'><div class='msg-info'><div class='msg-info-name'>"+arChat[i-2]+"</div><div class='msg-info-time'>"+arChat[i]+"</div></div><div class='msg-text'>"+arChat[i-1]+"</div></div></div>";
				}
			}
		}
		return result;
	}
	
	@Override
	public void addChat(Model model, String employeenum) {
		int cnt = mapper.employeeCnt();
		List<EmployeeDTO> list = Collections.EMPTY_LIST;
		if(cnt > 0) {
			list = mapper.findAllEmpToChat(employeenum);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("empList", list);
	}

	@Override
	public void createRoom(Model model, String[] invite, String roomname, String employeenum) {
		employeeMap.put("roomname", roomname);
		employeeMap.put("employeenum", employeenum);
		int roomCnt = mapper.isRoom(employeeMap);
		model.addAttribute("roomCnt", roomCnt);
		if(roomCnt==0) {
			mapper.insertRoomToMe(employeeMap);
			for (String empNo : invite) {
				employeeMap.put("employeenum", empNo);
				mapper.insertRoomToOther(employeeMap);
			}
			employeeMap.put("employeenum", employeenum);
			int empno = mapper.findChatNo(employeeMap);
			String fileRoot = FileRoot.getFilepath();
			String filePath = "";
			try {
				filePath = fileRoot+"\\"+roomname+"_"+empno+".txt";
				Path path = Paths.get(filePath);
				if(!Files.exists(path)) {
					Files.createFile(path);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public int changeJoinCnt(int joincnt, int chatno, int updown) {
		if(updown==1) {
			joincnt++;
		}else {
			joincnt--;
		}
		employeeMap.put("joincnt", String.valueOf(joincnt));
		employeeMap.put("chatno", String.valueOf(chatno));
		mapper.updateJoinCnt(employeeMap);
		return joincnt;
	}
}
