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
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.Board;
import web.dto.ExchangeInfo;
import web.dto.UserQuestion;
import web.dto.Users;
import web.service.face.AdminService;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	@Autowired BoardService boardService;
	
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
			session.setAttribute("loginCheck", true);
			session.setAttribute("adminloginid", admin.getAdminId());
			session.setAttribute("adminNo", adminNo.getAdminNo());
			session.setAttribute("userNo",1 );
		} else {
			session.invalidate();
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/admin/main")
	public void adminmain() {
		logger.info("/admin/main [GET]");
		
	}
	
	@RequestMapping("/admin/logout")
	public String adminlogout(HttpSession session) {
		logger.info("/admin/logout [GET]");
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/qna/list")
	public void qnalist(Paging paramData,Model model,HttpSession session , String qProcess ,String keyword) {
		logger.info("/qna/list [GET]");
		
		//회원 로그인이 되어있을때 
		if(session.getAttribute("login") !=null) {
			//회원 -문의 목록 조회
			List<UserQuestion> userqna = adminService.userQnA((int)session.getAttribute("userNo"));
			logger.info("**userqna 의 값:***{}",userqna);
			model.addAttribute("userqna",userqna);
		}
		
		//관리자 로그인 되어있을때
		if(session.getAttribute("adminlogin") !=null ) {
			//페이징 계산
			Paging paging = adminService.getPaging( paramData , qProcess,keyword);
			logger.info("{}",paging);
			
			//관리자 - 문의 목록 조회 
			List<UserQuestion> qnalist= adminService.qnalist(paging,qProcess,keyword);
			model.addAttribute("paging",paging);
			model.addAttribute("qnalist",qnalist);
			model.addAttribute("qProcess",qProcess);
			model.addAttribute("keyword",keyword);
		}
		
	}
	
	@RequestMapping("/viva/login")
	public void vivalogin() {
	}
	
	@GetMapping("/admin/boardnotice")
	public void boardnotice() {
		logger.info("/admin/boardnotice");
		
	}
	
	@GetMapping("/qna/view")
	public void qnaview(UserQuestion userQuestion,AdminAnswer adminAnswer,Model model,Users users,Admin admin) {
		
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
	
	@GetMapping("/admin/userlist")
	public void userlist(Paging paramData,Model model,String keyword) {
		logger.info("/admin/userlist [get]");
		
		//페이징계산
		Paging paging = adminService.getUserPaging( paramData , keyword); 
		
		//회원 전체 목록 조회
		List<Users> userlist = adminService.userlist(paging,keyword);
		
		model.addAttribute("paging",paging);
		model.addAttribute("userlist",userlist);
		model.addAttribute("keyword",keyword);
		
		
	}
	
	@PostMapping("/admin/userlist")
	public void userlistpost(Paging paramData,Model model ,@RequestParam(value="check") int[] check ,String keyword) {
		logger.info("/admin/userlist [post]");
		
		//페이징계산
		Paging paging = adminService.getUserPaging( paramData ,keyword ); 
		
		//회원 전체 목록 조회
		List<Users> userlist = adminService.userlist(paging,keyword);
		
		model.addAttribute("paging",paging);
		model.addAttribute("userlist",userlist);
		model.addAttribute("keyword",keyword);
		
		//체크박스부분 
		logger.info("***check의값 : ***{}",check);
		adminService.checkUser(check);
		
	
	}
	
	@GetMapping("/admin/boardlist")
	public void adminboardlist(  Model model, Paging paramData, Board board,
			@RequestParam(name = "categoryType", required = false, defaultValue = "all") String categoryType,
			@RequestParam(name = "keyword", required = false) String keyword ) {

		logger.info("/admin/boardlist [GET]");
		
		logger.info("categoryType: {}", categoryType);
		logger.info("keyword: {}", keyword);
		
		//페이징 계산
		Paging paging = boardService.getPaging(paramData, keyword, categoryType);
		paging.setCategoryType(categoryType);
		
		//게시글 목록 조회
		//List<Board> boardList = boardService.boardList(paging, userId, keyword, categoryType);
		List<Board> boardList = boardService.boardList(paging, keyword, categoryType);
		logger.info("boardList : {}", boardList);
		
		model.addAttribute("paging", paging);
		//model.addAttribute("userId", userId);
		model.addAttribute("boardList", boardList);
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("board", board);
		
	}
	
	@PostMapping("/admin/boardlist")
	public void adminboardlistPost(  Model model, Paging paramData, Board board,
			@RequestParam(name = "categoryType", required = false, defaultValue = "all") String categoryType,
			@RequestParam(name = "keyword", required = false) String keyword ,
			@RequestParam(value="check") int[] check) {

		logger.info("/admin/boardlist [GET]");
		//페이징 계산
		Paging paging = boardService.getPaging(paramData, keyword, categoryType);
		paging.setCategoryType(categoryType);
		
		//게시글 목록 조회
		//List<Board> boardList = boardService.boardList(paging, userId, keyword, categoryType);
		List<Board> boardList = boardService.boardList(paging, keyword, categoryType);
		logger.info("boardList : {}", boardList);
		
		model.addAttribute("paging", paging);
		//model.addAttribute("userId", userId);
		model.addAttribute("boardList", boardList);
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("board", board);
		
		
		   //관리자일때 리스트에서 선택한거 삭제가능하게 만드는거 - 보현
		   logger.info("***check의값 : ***{}",check);
		   boardService.deleteCheckBoard(check);
	}
//===========================================================
	//환전 관리
	@RequestMapping("/admin/credit")
	public void exchange(HttpSession session, ExchangeInfo exchange) {
		logger.info("/admin/credit - exchange()");
		
		
		
		
		
	}
	

	

}
