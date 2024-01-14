package com.injoit.mvc.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.injoit.mvc.bean.EmpAttendanceDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.repository.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	@Autowired
	private HashMap<String, String> employeeMap;
	@Autowired
	private Date date;
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
		if(cnt>0) {
			page(pageSize, pageNum, cnt, employeeMap);
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

}
