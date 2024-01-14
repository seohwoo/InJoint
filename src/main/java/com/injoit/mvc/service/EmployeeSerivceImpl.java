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

	// ȸ������
	@Override
	public int insertEmp(EmployeeDTO dto) {
//		mapper.createCal(dto.getId()); // ȸ�����Խ� �ش� id �� ���� ���̺� ����
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
	// ���̵� �ߺ� Ȯ��
	@Override
	public int confirmid(String id) {
		return mapper.confirmid(id);
	}
	// ���� �߰�
	@Override
	public void insertCal(CalendarDTO dto) {
		mapper.insertCal(dto);
	}
	// ���� ����
	@Override
	public void up_Cal(CalendarDTO dto) {
		mapper.up_Cal(dto);
	}
	// ������ �̹���
	@Override
	public void up_pro(String id, String profile) {
		mapper.up_pro(id, profile);
	}
	// ȸ������ ����
	@Override
	public int up_emp(EmployeeDTO dto) {
		int result = mapper.up_emp(dto);
		return result;
	}
	// ȸ��Ż��
	@Override
	public void withdraw(String id) {
		mapper.withdraw(id);
	}
	// ���������� ����
	@Override
	public EmployeeDTO mypage(String id) {
		return mapper.mypage(id);
	}
	// id �� ���� ����
	@Override
	public List<CalendarDTO> calendar(String id) {
		return mapper.calendar(id);
	}
	// ������
	@Override
	public String profile(String id) {
		return mapper.profile(id);
	}
	// ȸ��Ż��
	@Override
	public void memout(String id) {
		mapper.memout(id);
	}
	@Override
	public String departname(String departnum) {
		return mapper.departname(departnum);
	}
} 
