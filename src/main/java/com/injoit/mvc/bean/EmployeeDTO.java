package com.injoit.mvc.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeeDTO {
//	private int no;	// 시퀀스
	private String employeenum; // 아이디
	private String pw; // 비번
	private String name; // 이름
	private String profile; // 프로필 이미지
	private String email; // 이메일
	private String phone; // 전화번호
	private String addr1; // 기본 주소
	private String addr2; // 상세 주소
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth; // 생년월일
	private String departnum; // 부서번호
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg; // 가입날짜
	private String position; // 직급
	private int status; 
	private List<AuthDTO> authList; // 권한
}
