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
import com.injoit.mvc.bean.Emp_voteDTO;
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

	// ȸ������
	@Override
	public int insertEmp(EmployeeDTO dto, Model model) {
//		mapper.createCal(dto.getId()); // ȸ�����Խ� �ش� id �� ���� ���̺� ����
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
	// ��ǥ �ۼ�
	// ��ǥ �׸� �� �̹��� ����
	@Override
	public void vote_count(Vote_countDTO dto, ArrayList<MultipartFile> votefile, String path, Vote_queDTO vq, String[] typevalue) {
	    mapper.vote(vq);
	    int no = vq.getNo();
	    System.out.println("bbbbbbb" + no);

	    for (int i = 0; i < typevalue.length; i++) {
	    	String uuid = UUID.randomUUID().toString();
	        System.out.println(typevalue.length);
	        String typevalue1 = typevalue[i];
	        dto.setTypevalue(typevalue1);

	        // votefile�� ũ�Ⱑ �ε��� i�� �ش��ϴ� ������ �����ϴ��� Ȯ��
	        if (votefile.size() >= i) {
	            MultipartFile voteFile = votefile.get(i);
	            System.out.println(voteFile.getOriginalFilename());
	            if (voteFile != null && !voteFile.isEmpty()) {
	                String filename = voteFile.getOriginalFilename();
	                String ext = filename.substring(filename.lastIndexOf("."));
	                System.out.println("ext" + ext);
	                filename = "file_" + uuid + ext;
	                File copy = new File(path + filename);
	                dto.setImg(filename);
	                try {
	                	voteFile.transferTo(copy);
					}catch(Exception e) {
						e.printStackTrace();
					}
	            } else {
	                // �̹����� ���� ��쿡�� null�� ����
	                dto.setImg("noimg.png");
	            }
	        } else {
	            dto.setImg("noimg.png");
	        }
	        dto.setNo(no);
	        mapper.vote_count(dto);
	    }
	}
//	@Override
//	public List<Vote_countDTO> vote_que() {
//		return mapper.vote_que();
//	}
	@Override
	public String departnum(String departnum) {
		return mapper.departname(departnum);
	}
	@Override
	public List<Vote_queDTO> vq(int no) {
		return mapper.vq(no);
	}
	@Override
	public List<Vote_queDTO> vq2() {
		return mapper.vq2();
	}
	@Override
	public List<Vote_countDTO> vc(int no) {
		return mapper.vc(no);
	}
	// ��ǥ�ϱ�
	@Override
	public int vo(Emp_voteDTO dto) {
		int result = mapper.noChk(dto.getNo(), dto.getEmployeenum());
		if(result == 0) {
			mapper.vo(dto);
		}else {
			mapper.up_no(dto);
		}
		return 1;
	}
	@Override
	public int votecount(int no) {
		return mapper.votecount(no);
	}
	@Override
	public int memcount(int num) {
		return mapper.memcount(num);
	}
	
	@Override
	public String sel(String employeenum, int no) {
		String result = mapper.sel(employeenum, no);
		if (result != null)
			return result;
		else
			return "0";
	}
	@Override
	public void deldate() {
		mapper.deldate();
	}
	@Override
	public List<EmployeeDTO> votename(int num) {
		return mapper.votename(num);
	}
	@Override
	public void delvote(int no, String path) {
		List<Vote_countDTO> img = mapper.delimg(no);
		for(Vote_countDTO i : img) {
			File file = new File(path + i.getImg());
			if(file.isFile()) {
				file.delete();
			}
		}
		mapper.delvote(no);
	}
	
	
} 
