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
import web.dto.ExchangeInfo;
import web.dto.UserQuestion;
import web.dto.Users;
import web.service.face.AdminService;
import web.util.Paging;

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
	public void qnalist(Paging paramData,Model model,HttpSession session) {
		logger.info("/qna/list [GET]");
		
		//페이징 계산
		Paging paging = adminService.getPaging( paramData );
		logger.info("{}",paging);
		
		//관리자 - 문의 목록 조회 
		List<UserQuestion> qnalist= adminService.qnalist(paging);
		
		
		if(session.getAttribute("adminlogin") == null) {
			
			//회원 -문의 목록 조회
			List<UserQuestion> userqna = adminService.userQnA((int)session.getAttribute("userNo"));
			logger.info("**userqna 의 값:***{}",userqna);
			model.addAttribute("userqna",userqna);
			
		}
		
		
		model.addAttribute("paging",paging);
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
	public void noticeview(UserQuestion userQuestion,AdminAnswer adminAnswer,Model model,Users users,Admin admin) {
		
		userQuestion = adminService.getQNo(userQuestion);
		logger.info("{}",userQuestion);
		
		adminAnswer = adminService.getANo(adminAnswer);
		logger.info("{}",adminAnswer);
		users.setUserNo(userQuestion.getUserNo());
		users = adminService.getUsersInfo(users);
		
		int process = adminService.getProcess(userQuestion);
		logger.info("*******process의 값 : ******{}",process);
		
		if( process == 1) {
			admin.setAdminNo(adminAnswer.getAdminNo());
			admin = adminService.getAdminId(admin);
			logger.info("*********admin의 값 :**********{}",admin);
		}
		
		model.addAttribute("userQuestion",userQuestion);
		model.addAttribute("adminAnswer",adminAnswer);
		model.addAttribute("users",users);
		model.addAttribute("process",process);
		model.addAttribute("admin",admin);
		
	}
	@GetMapping("/qna/question")
	public void question(HttpSession session,Model model) {
		logger.info("/qna/question [GET]");
		
		Users users = adminService.getUserInfo((int)session.getAttribute("userNo"));
		
		logger.info("users:{}",users);
		model.addAttribute("users",users);
	}
	
	@PostMapping("/qna/question")
	public String questionpost(UserQuestion userQuestion,HttpSession session) {
		logger.info("/qna/question [POST]");
		userQuestion.setUserNo((int)session.getAttribute("userNo"));
		adminService.writeQuestion(userQuestion);
		
		return "redirect:/qna/view?qNo=" + userQuestion.getqNo();
		
	}
	
	
	@GetMapping("/qna/answer")
	public void answer(UserQuestion userQuestion,Model model,HttpSession session) {
		logger.info("/qna/answer [GET]");
		userQuestion = adminService.getQNo(userQuestion);
		logger.info("{}",userQuestion);
		Admin admin = adminService.getAdminInfo((int)session.getAttribute("adminNo"));
		
		model.addAttribute("userQuestion", userQuestion);
		model.addAttribute("admin",admin);
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
		return "redirect:/qna/view?qNo=" + userQuestion.getqNo();
		
	}
	
	@GetMapping("/admin/usergrade")
	public void usergrade(Paging paramData,Model model ) {
		logger.info("/admin/usergrade [get]");
		
		//페이징계산
		Paging paging = adminService.getUserPaging( paramData ); 
		
		//회원 전체 목록 조회
		List<Users> userlist = adminService.userlist(paging);
		
		model.addAttribute("paging",paging);
		model.addAttribute("userlist",userlist);
		
		
	}
	
	@PostMapping("/admin/usergrade")
	public void usergradepost() {
		logger.info("/admin/usergrade [post]");
	}
	
	
//===========================================================
	//환전 관리
	@RequestMapping("/admin/credit")
	public void exchange(HttpSession session, ExchangeInfo exchange) {
		logger.info("/admin/credit - exchange()");
		
		
		
		
		
	}
		
		
	

}
