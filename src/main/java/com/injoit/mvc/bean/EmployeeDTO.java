package com.injoit.mvc.bean;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Data;

@Data
public class EmployeeDTO {

//	private int no;	// ������
	private String employeenum; // ���̵�
	private String pw; // ���
	private String name; // �̸�
	private String profile; // ������ �̹���
	private String email; // �̸���
	private String phone; // ��ȭ��ȣ
	private String addr1; // �⺻ �ּ�
	private String addr2; // �� �ּ�
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth; // �������
	private String departnum; // �μ���ȣ
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reg; // ���Գ�¥
	private String position; // ����
	private int status; 
	private List<AuthDTO> authList; // ����

}
