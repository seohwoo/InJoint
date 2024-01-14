package com.injoit.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.repository.EmployeeMapper;

@Service
public class EmployeeSerivceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeMapper mapper;
	
	@Autowired
	PasswordEncoder encoder;

	// 회원가입
	@Override
	public int insertEmp(EmployeeDTO dto) {
//		mapper.createCal(dto.getId()); // 회원가입시 해당 id 로 일정 테이블 생성
		String auth = "ROLE_MEMBER";
		if(dto.getDepartnum().equals("6666")) {
			auth = "ROLE_ADMIN";
		}
		dto.setPw(encoder.encode(dto.getPw()));
		int result = mapper.insertEmp(dto);
		 String employeenum = String.valueOf(dto.getEmployeenum());
		System.out.println(employeenum);
		mapper.insertauth(employeenum, auth);
		return result;
	}
	// 아이디 중복 확인
	@Override
	public int confirmid(String id) {
		return mapper.confirmid(id);
	}
	// 일정 추가
	@Override
	public void insertCal(CalendarDTO dto) {
		mapper.insertCal(dto);
	}
	// 일정 수정
	@Override
	public void up_Cal(CalendarDTO dto) {
		mapper.up_Cal(dto);
	}
	// 프로필 이미지
	@Override
	public void up_pro(String id, String profile) {
		mapper.up_pro(id, profile);
	}
	// 회원정보 수정
	@Override
	public int up_emp(EmployeeDTO dto) {
		int result = mapper.up_emp(dto);
		return result;
	}
	// 회원탈퇴
	@Override
	public void withdraw(String id) {
		mapper.withdraw(id);
	}
	// 마이페이지 정보
	@Override
	public EmployeeDTO mypage(String id) {
		return mapper.mypage(id);
	}
	// id 별 일정 정보
	@Override
	public List<CalendarDTO> calendar(String id) {
		return mapper.calendar(id);
	}
	// 프로필
	@Override
	public String profile(String id) {
		return mapper.profile(id);
	}
	// 회원탈퇴
	@Override
	public void memout(String id) {
		mapper.memout(id);
	}
	@Override
	public String departname(String departnum) {
		return mapper.departname(departnum);
	}
} 
