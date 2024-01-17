package com.injoit.mvc.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.injoit.mvc.bean.CalendarDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.Vote_countDTO;
import com.injoit.mvc.bean.Vote_queDTO;
import com.injoit.mvc.repository.EmployeeMapper;

@Service
public class EmployeeSerivceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeMapper mapper;
	
	@Autowired
	PasswordEncoder encoder;

	// 회원가입
	@Override
	public int insertEmp(EmployeeDTO dto, Model model) {
//		mapper.createCal(dto.getId()); // 회원가입시 해당 id 로 일정 테이블 생성
		String auth = "ROLE_MEMBER";
		if(dto.getDepartnum().equals("6666")) {
			auth = "ROLE_ADMIN";
		}
		dto.setPw(encoder.encode(dto.getPw()));
		int result = mapper.insertEmp(dto);
        String employeenum = String.valueOf(dto.getEmployeenum());
		mapper.insertauth(employeenum, auth);
		model.addAttribute("emp", employeenum);
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
//	for(int i = 0; i < dto.getVocount(); i++) {
//	if(votefile.size() > 0) {
//		for(int j = 0; j < votefile.size(); i++) {
//			String uuid = UUID.randomUUID().toString();
//			MultipartFile vote = votefile.get(j);
//			String filename = vote.getOriginalFilename();
//			System.out.println("filename"+filename);
//			if(!filename.equals("")) {
//				String ext = filename.substring(filename.lastIndexOf("."));
//				System.out.println("ext"+ext);
//				filename = "file_" + uuid + ext;
//				File copy = new File(path + filename);
//				dto.setImg(filename);
//				dto.setNo(no);
//				mapper.vote_count(dto);
//				try {
//					vote.transferTo(copy);
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//	}
	// 투표 작성
	// 투표 항목 및 이미지 저장
	@Override
	public void vote_count(Vote_countDTO dto, ArrayList<MultipartFile> votefile, String path, Vote_queDTO vq, String[] typevalue) {
	    mapper.vote(vq);
	    int no = vq.getNo();
	    System.out.println("bbbbbbb" + no);
	    String uuid = UUID.randomUUID().toString();

	    for (int i = 0; i < typevalue.length; i++) {
	        System.out.println(typevalue.length);
	        String typevalue1 = typevalue[i];
	        dto.setTypevalue(typevalue1);

	        // votefile의 크기가 인덱스 i에 해당하는 파일이 존재하는지 확인
	        if (votefile.size() > i) {
	            MultipartFile voteFile = votefile.get(i);

	            if (voteFile != null && !voteFile.isEmpty()) {
	                String filename = voteFile.getOriginalFilename();
	                String ext = filename.substring(filename.lastIndexOf("."));
	                System.out.println("ext" + ext);
	                filename = "file_" + uuid + ext;
	                File copy = new File(path + filename);
	                dto.setImg(filename);
	            } else {
	                // 이미지가 없는 경우에는 null로 설정
	                dto.setImg("null");
	            }
	        } else {
	            // votefile의 크기가 i에 미치지 못하는 경우에는 이미지가 없는 것으로 처리
	            dto.setImg("null");
	        }
	        dto.setNo(no);
	        mapper.vote_count(dto);
	    }
	}
	@Override
	public List<Vote_countDTO> vote_que() {
		return mapper.vote_que();
	}
} 
