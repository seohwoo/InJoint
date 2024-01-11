package com.injoit.mvc.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.repository.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	@Autowired
	private HashMap<String, String> employeeMap;
	
	public void page(int pageSize, int pageNum, HashMap map) {
		int start = (pageNum-1)*pageSize+1;
		int end = pageNum * pageSize;
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
	}
	
	@Override
	public void findAllEmployee(Model model, int pageNum) {
		int pageSize = 10;
		int cnt = mapper.employeeCnt();
		int maxPageNum = (int) (cnt / pageSize) + (cnt % pageSize == 0 ? 0 : 1);
		if(pageNum < 1) {
			pageNum = 1;
		}else if(pageNum > maxPageNum) {
			pageNum = maxPageNum;
		}
		List<EmployeeDTO> list = Collections.EMPTY_LIST;
		if(cnt>0) {
			page(pageSize, pageNum, employeeMap);
			list = mapper.showAllEmployee(employeeMap);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("maxPageNum", maxPageNum);
		model.addAttribute("employeeList", list);
	}

}
