package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Board;
import web.dto.BoardNotice;
import web.service.face.BoardNoticeService;
import web.service.impl.BoardNoticeServiceImpl;
import web.util.Paging;

@Controller
@RequestMapping("/boardnotice")
public class BoardNoticeController {
	
	private final BoardNoticeService boardNoticeService;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	public BoardNoticeController(BoardNoticeService boardNoticeService) {
		this.boardNoticeService = boardNoticeService;
	}
	
	@RequestMapping("/list")
	public void noticeList(Paging paging, Model model, String keyword) {
		
		//페이징 계산
		Paging page = boardNoticeService.getPaging(paging, keyword);
		
		//게시글 목록 조회
		List<BoardNotice> boardNoticeList = boardNoticeService.boardNoticeList(page, keyword);
		
		model.addAttribute("page", page);
		model.addAttribute("boardNoticeList", boardNoticeList);
		model.addAttribute("keyword", keyword);
	}
	
	@RequestMapping("/view")
	public String view(BoardNotice boardNotice, Model model) {
		
		logger.info("~~~~~~~~~~~~~~~~~~~~~~~~~~{}", boardNotice);
		
		
		//게시글 조회
		boardNotice = boardNoticeService.viewNotice( boardNotice );
		logger.info("boardNotice {}", boardNotice);
		//모델값 전달  - 게시글
		model.addAttribute("boardNotice", boardNotice);
		logger.info("BBBBBBBBBBBBBBBBBBBBBBBBBboardNotice.getNoticeNo() {}", boardNotice.getNoticeNo() );
		
		 return "/boardnotice/view";
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc(BoardNotice boardNotice, Model model, HttpSession session) {
		
		// 세션 데이터 읽기
        boolean adminlogin = (boolean) session.getAttribute("adminlogin");
        String adminId = (String) session.getAttribute("adminloginid");
        int adminNo = (int) session.getAttribute("adminNo");
        
        boardNotice.setAdminNo(adminNo);
		
		boardNoticeService.write( boardNotice );
		
		return "redirect:/boardnotice/list";	//게시글 목록
	}
	
	@RequestMapping("/update")
	public String update( BoardNotice boardNotice, Model model ) {
		
		boardNoticeService.update(boardNotice);
		model.addAttribute("boardNotice", boardNotice);
		
		return "redirect:/boardnotice/view?noticeNo=" + boardNotice.getNoticeNo();
	}
	
	
	@RequestMapping("/delete")
	public String delete( Board boardNotice ) {
		
		boardNoticeService.delete(boardNotice);
		
		return "redirect:/boardnotice/list";
	}

}
