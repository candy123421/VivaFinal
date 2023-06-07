package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.UserQuestion;
import web.dto.Users;
import web.service.face.AdminService;

@Controller
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	
	@GetMapping("/admin/login")
	public void adminloginget() {
		logger.info("/admin/login [GET]");
	}
	
	@PostMapping("/admin/login")
	public String adminlogin(Admin admin , HttpSession session) {
		
		boolean adminlogin = adminService.adminLogin(admin);
		logger.info("adminloginparam 값 : {}",admin);
		
		if(adminlogin) {
			//관리자 번호 가져오기 
			Admin adminNo= adminService.getAdminNo(admin);
			session.setAttribute("adminlogin", true);
			session.setAttribute("adminloginid", admin.getAdminId());
			session.setAttribute("adminNo", adminNo.getAdminNo());
		} else {
			session.invalidate();
		}
		
		
		return "redirect:./main";
		
	}
	
	@RequestMapping("/admin/main")
	public void main() {
		logger.info("/admin/main [GET]");
		
	}
	
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		logger.info("/admin/logout [GET]");
		session.invalidate();
		
		return "redirect:./main";
		
	}
	
	@RequestMapping("/qna/list")
	public void qnalist(Model model) {
		logger.info("/qna/list [GET]");
		
		
		
		List<UserQuestion> qnalist= adminService.qnalist();
		
		model.addAttribute("qnalist",qnalist);
		
		
		
	}
	
	@RequestMapping("/viva/login")
	public void vivalogin() {
		
		
	}
	
	@GetMapping("/admin/boardnotice")
	public void boardnotice() {
		logger.info("/admin/boardnotice");
		
	}
	
	@GetMapping("/qna/view")
	public void noticeview(UserQuestion userQuestion,Model model) {
		
		userQuestion = adminService.getQNo(userQuestion);
		logger.info("{}",userQuestion);
		
		model.addAttribute("userQuestion",userQuestion);
		
	}
	
	@GetMapping("/qna/answer")
	public void answer(UserQuestion userQuestion,Model model) {
		logger.info("/qna/answer [GET]");
		userQuestion = adminService.getQNo(userQuestion);
		logger.info("{}",userQuestion);
		model.addAttribute("userQuestion", userQuestion);
	}

	
	@PostMapping("/qna/answer")
	public String answerpost(UserQuestion userQuestion,AdminAnswer adminAnswer,Admin admin,Users users,HttpSession session) {
		logger.info("/qna/answer [POST]");
		
		//adminno가 세션에 있기때문에 
		adminAnswer.setAdminNo( (int)session.getAttribute("adminNo"));
		logger.info("{}",userQuestion);
		userQuestion = adminService.getQNo(userQuestion);
		adminService.answerSingUp(userQuestion,adminAnswer,admin,users);
		
		logger.info("adminAnswer 의 값 : {}",adminAnswer);
		return "redirect:/qna/view";
		
	}
	

}
