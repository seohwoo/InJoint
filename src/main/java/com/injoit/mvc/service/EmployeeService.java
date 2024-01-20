package com.injoit.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.Vote_countDTO;
import com.injoit.mvc.bean.Vote_queDTO;

public interface EmployeeService {
	public int insertEmp(EmployeeDTO dto, Model model);
	public int confirmid(String id);
	public void insertCal(CalendarDTO dto);
	public void up_Cal(CalendarDTO dto);
	public void up_pro(String id, String profile);
	public int up_emp(EmployeeDTO dto);
	public void withdraw(String id);
	public EmployeeDTO mypage(String id);
	public List<CalendarDTO> calendar(String id);
	public String profile(String id);
	public void memout(String id);
	public String departname(String departnum);
	public void vote_count(Vote_countDTO dto, ArrayList<MultipartFile> votefile, String path, Vote_queDTO vq, String [] typevalue);
	public List<Vote_countDTO> vote_que();
}
