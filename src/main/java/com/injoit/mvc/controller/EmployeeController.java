package com.injoit.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.injoit.mvc.bean.Emp_voteDTO;
import com.injoit.mvc.bean.EmployeeDTO;
import com.injoit.mvc.bean.Vote_countDTO;
import com.injoit.mvc.bean.Vote_queDTO;
import com.injoit.mvc.service.EmployeeService;


@Controller
@RequestMapping("/emp/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@RequestMapping("all")
	public String all() {
		return "employee/all";
	}
	
	@RequestMapping("worker")
	public String worker(Principal pri, Model model) {
		//service.deldate();
		EmployeeDTO dto = service.mypage(pri.getName());
		model.addAttribute("my", dto);
		return "employee/worker";
	}
	@RequestMapping("admin")
	public String admin() {
		return "employee/admin";
	}
	
	//접근 제한 에러 
	@RequestMapping("accessError")
	public String accessError(Authentication auth) {
		System.out.println("access Denied===>>"+auth);
		return "employee/accessError";
	}
	//로그인
	@RequestMapping("customLogin")
	public String doLogin(HttpServletRequest req) {
	//	String referer = req.getHeader("Referer");
	//	if(referer != null) {
	//		req.getSession().setAttribute("url_prior", referer);
	//	}
	//	System.out.println("aa" + referer);
		return "employee/login";
	}
	//로그아웃
	@RequestMapping("customLogout")
	public String doLogout() {
		return "redirect:/emp/all";
	}
	//회원가입 폼
	@RequestMapping("registerForm")
	public String register() {
		return "employee/registerForm";
	}
	// 아이디 중복확인
	@RequestMapping(value ="idCheck", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String idCheck(String id) {
		int result = service.confirmid(id);
		String com = "사용 불가능한 아이디입니다";
		if(result == 0) {
			com = "사용 가능한 아이디입니다";
		}
		return com;
	}
	// 부서번호 확인
	@RequestMapping(value ="departnum", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String departnum(String departnum) {
		String result = service.departnum(departnum);
		String com = "부서번호가 틀렸습니다";
		if(result != null) {
			com = "부서번호 확인 완료";
		}
		return com;
	}
	//회원가입 
	@RequestMapping("registerPro")
	public String registerPro(EmployeeDTO dto, Model model) {
		int check = service.insertEmp(dto, model);
		model.addAttribute("check", check);
		return "employee/registerPro";
	}

	@RequestMapping("/member/calendar")
	public String calendar() {
		return "employee/member/calendar";
	}
	@RequestMapping("/member/mypage")
	public String mypage(Principal pri, Model model) {
		EmployeeDTO dto = service.mypage(pri.getName());
		String departname = service.departname(dto.getDepartnum());
		dto.setDepartname(departname);
		model.addAttribute("my", dto);
		return "employee/mypage";
	}
	@RequestMapping("mypagePro")
	public String mypagePro(EmployeeDTO dto, Principal pri, ArrayList<MultipartFile> upload) {
		dto.setEmployeenum(pri.getName());
		int result = service.up_emp(dto);
		return "redirect:/emp/mypage";
	}
	@RequestMapping("profile")
	public String profile(HttpServletRequest request, MultipartFile profile, Principal pri) {
		String path = request.getServletContext().getRealPath("/resources/profile/");
		String contentType = profile.getContentType();
		if(contentType.split("/")[0].equals("image")){
			String orgName = profile.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String filename = pri.getName() + ext;
			File copy = new File(path + pri.getName() + ext);
			File file = new File(path + filename.trim());
			if(file.isFile()) {
				file.delete();
			}
			service.up_pro(pri.getName(), pri.getName()+ext);
			try {
				profile.transferTo(copy);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:/emp/mypage";
	}
	
	@RequestMapping("room")
	public String chatRoom() {
		return "employee/room";
	}

	@RequestMapping("header")
	public String header(Principal pri, Model model) {
		String profile = service.profile(pri.getName());
		model.addAttribute("profile", profile);
		return "employee/header";
	}
	@RequestMapping("memoutPro")
	public String memoutPro(Principal pri) {
		service.memout(pri.getName());
		return "redirect:/emp/customLogin";
	}
	@RequestMapping("memout")
	public String memout() {
		return "employee/memout";
	}
	@RequestMapping("/member/vote")
	public String vote(Model model, Principal pri) {
		service.deldate();
		EmployeeDTO dto = service.mypage(pri.getName());
		List<EmployeeDTO> name = null;
		//List<Vote_countDTO> vote = service.vote_que();
		List<Vote_queDTO> vq = service.vq2();
		if(vq != null) {
			for(Vote_queDTO q : vq) {
				List<Vote_countDTO> c = service.vc(q.getNo());
				int count = service.votecount(q.getNo());
			    List<ListDTO> typeImg = new ArrayList<>();
			    
		 		for(Vote_countDTO cv : c) {
		 			int num = cv.getNum();
		 			int mc = service.memcount(cv.getNum());
		 			ListDTO list = new ListDTO(cv.getTypevalue(), cv.getImg(), cv.getNum(), mc, name);
		 			typeImg.add(list);
				}
		 		q.setImg(typeImg);
		 		q.setAllcount(count);
			}
		}
		model.addAttribute("vote", vq);
		model.addAttribute("my", dto);
		return "employee/member/vote";
	}

	@RequestMapping("/member/votePro")
	public String votePro(HttpServletRequest request, String [] typevalue, Vote_countDTO vc, Vote_queDTO vq, ArrayList<MultipartFile> votefile) {
		int count = 0;
		for(String t : typevalue) {
			if(!t.equals("")) {
				count++;
			}
		}
		String path = request.getServletContext().getRealPath("/resources/img/");
		vq.setTypenum(count);
		service.vote_count(vc, votefile, path, vq, typevalue);
//		dto.setTypeum(1);
		return "redirect:/emp/member/vote";
	}
	
	@RequestMapping("votePro")
	public String votePro(Emp_voteDTO dto) {
		service.vo(dto);
		return "redirect:/emp/member/vote"; 
	}
	@RequestMapping("delvote")
	public String delvote(int no, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/resources/img/");
		service.delvote(no, path);
		return "redirect:/emp/member/vote"; 
	}
	@RequestMapping("/member/voting")
	public String voting(Model model, Principal pri, int no) {
		EmployeeDTO dto = service.mypage(pri.getName());
		String check = service.sel(pri.getName(), no);
		int chk = Integer.parseInt(check);
		//List<Vote_countDTO> vote = service.vote_que();
		List<Vote_queDTO> vq = service.vq(no);
		List<EmployeeDTO> name = null;
		if(vq != null) {
			for(Vote_queDTO q : vq) {
				List<Vote_countDTO> c = service.vc(no);
				int count = service.votecount(no);
			    List<ListDTO> typeImg = new ArrayList<>();
		 		for(Vote_countDTO cv : c) {
		 			name = service.votename(cv.getNum());
		 			int num = cv.getNum();
		 			int mc = service.memcount(cv.getNum());
		 			ListDTO list = new ListDTO(cv.getTypevalue(), cv.getImg(), cv.getNum(), mc, name);
		 			typeImg.add(list);
				}
		 		q.setImg(typeImg);
		 		q.setAllcount(count);
			}
		}
		model.addAttribute("vote", vq);
		model.addAttribute("my", dto);
		model.addAttribute("check", chk);
		return "employee/member/voteing";
	}
}
