package com.injoit.mvc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.Emp_voteDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.Vote_countDTO;
import com.injoit.mvc.bean.Vote_queDTO;

public interface EmployeeMapper {
	public int insertEmp(EmployeeDTO dto);
	public void insertauth(@Param("userid") String id, @Param("auth") String auth);
	public void createCal(String id);
	public int confirmid(String id);
	public void insertCal(CalendarDTO dto);
	public void up_Cal(CalendarDTO dto);
	public void up_pro(@Param("id") String id, @Param("profile") String profile);
	public int up_emp(EmployeeDTO dto);
	public void withdraw(String id);
	public EmployeeDTO mypage(String id);
	public List<CalendarDTO> calendar(String id);
	public String profile(String id);
	public void memout(String id);
	public String departname(String departnum);
	public void vote(Vote_queDTO dto);
	public void vote_count(Vote_countDTO dto);
	//public List<Vote_countDTO> vote_que();
	public String departnum(String departnum);
	public List<Vote_queDTO> vq(int no);
	public List<Vote_queDTO> vq2();
	public List<Vote_countDTO> vc(int no);
	public int vo(Emp_voteDTO dto);
	public int noChk(@Param("no") int no, @Param("employeenum") String employeenum);
	public void up_no(Emp_voteDTO dto);
	public int votecount(int no);
	public int memcount(int num);
	public String sel(@Param("employeenum")String employeenum, @Param("no") int no);
	public void deldate();
	public List<EmployeeDTO> votename(int num);
	public void delvote(int no);
	public List<Vote_countDTO> delimg(int no);
}
