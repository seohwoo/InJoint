package com.injoit.mvc.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Data;

@Data
public class EmployeeDTO {

//	private int no;	// 占쏙옙占쏙옙占쏙옙
	private String employeenum; // 占쏙옙占싱듸옙
	private String pw; // 占쏙옙占�
	private String name; // 占싱몌옙
	private String profile; // 占쏙옙占쏙옙占쏙옙 占싱뱄옙占쏙옙
	private String email; // 占싱몌옙占쏙옙
	private String phone; // 占쏙옙화占쏙옙호
	private String addr1; // 占썩본 占쌍쇽옙
	private String addr2; // 占쏙옙 占쌍쇽옙
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth; // 占쏙옙占쏙옙占쏙옙占�
	private String departnum; // 占싸쇽옙占쏙옙호
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg; // 占쏙옙占쌉놂옙짜
	private String position; // 占쏙옙占쏙옙
	private int status; 
	private List<AuthDTO> authList; // 권한
	private String departname;

}
