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
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Admin;
import web.dto.Board;
import web.dto.BoardNotice;
import web.service.face.BoardNoticeService;
import web.service.impl.BoardNoticeServiceImpl;
import web.util.Paging;

@Controller
@RequestMapping("/boardnotice")
public class BoardNoticeController {
	
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardNoticeService boardNoticeService;
	
	@RequestMapping("/list")
	public void noticeList(Paging paging, Model model, String keyword) {
		logger.info("/boardnotice/list ❤️도착❤️");
		
		//페이징 계산
		Paging page = boardNoticeService.getPaging(paging, keyword);
		
		//게시글 목록 조회
		List<BoardNotice> boardNoticeList = boardNoticeService.boardNoticeList(page, keyword);
		
		model.addAttribute("page", page);
		model.addAttribute("boardNoticeList", boardNoticeList);
		model.addAttribute("keyword", keyword);
		
		logger.info("boardNoticeList : {}", boardNoticeList);
	}
	
	@RequestMapping("/view")
	public String view(BoardNotice boardNotice, Admin admin,  Model model, HttpSession session) {
		logger.info("/boardnotice/view ❤️도착❤️");
		
		logger.info("boardNotice : {}", boardNotice);	//noticeNo만 가지고 있음
		
		//잘못된 게시글 번호 처리
		if( boardNotice.getNoticeNo() < 1 ) {
			return "redirect:./list";
		}
	      
        boardNotice.setAdminNo(admin.getAdminNo());
        logger.info("admin.getAdminNo() : {}", admin.getAdminNo());
       
        //공지 게시글 상세보기
        boardNotice = boardNoticeService.viewNotice( boardNotice );
        logger.info("조회된 게시글 {}", boardNotice);
        
        //모델값 전달  - 게시글
        model.addAttribute("boardNotice", boardNotice);
        logger.info("boardNotice : {} ",boardNotice);
        logger.info("boardNotice.getNoticeNo() : {} ",boardNotice.getNoticeNo());
        
		 return "boardnotice/view";
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc(BoardNotice boardNotice, Model model, HttpSession session) {
		logger.info("/boardnotice/write ❤️도착❤️");
		
		// 세션 데이터 읽기
        boolean adminlogin = (boolean) session.getAttribute("adminlogin");
        String adminId = (String) session.getAttribute("adminloginid");
        int adminNo = (int) session.getAttribute("adminNo");
        
        boardNotice.setAdminNo(adminNo);
		
        //공지 게시글 작성
		boardNoticeService.write( boardNotice );
		
		return "redirect:/boardnotice/list";	//게시글 목록
	}
	
	@GetMapping("/update")
	public String update( BoardNotice boardNotice, Model model ) {
		logger.info("/boardnotice/update [GET] ❤️도착❤️");
		
		//잘못된 게시글 번호 처리
		if( boardNotice.getNoticeNo() < 1 ) {
			return "redirect:/board/list";
		}
	      
		//수정할 게시글의 상세보기
		boardNotice.getAdminNo();
		boardNotice = boardNoticeService.viewNotice(boardNotice);
		model.addAttribute("boardNotice", boardNotice);
		
		logger.info("boardNotice.getAdminNo : {}", boardNotice.getAdminNo());
	    
		return "boardnotice/update";
	}
	
	@PostMapping("/update")
	public String update( BoardNotice boardNotice, Admin admin, Model model, HttpSession session ) {
		logger.info("/boardnotice/update [POST] ❤️도착❤️");
		
		logger.info("boardNotice : {}", boardNotice);
		
		//세션 데이터 읽기
        boolean adminlogin = (boolean) session.getAttribute("adminlogin");
        String adminId = (String) session.getAttribute("adminloginid");
        int adminNo = (int) session.getAttribute("adminNo");
        
//        boardNotice.setAdminNo(admin.getAdminNo());
        boardNotice.setAdminNo(adminNo);
        boardNotice.getAdminNo();
        boardNotice.getNoticeNo();
        logger.info("admin.getAdminNo() : {}", admin.getAdminNo());
		
        //공지 게시글 수정
		boardNoticeService.update(boardNotice);
		
		//모델값 전달  - 게시글
		model.addAttribute("boardNotice", boardNotice);
		model.addAttribute("adminNo", adminNo);
		logger.info("boardNotice : {}", boardNotice);

		return "redirect:/boardnotice/view?noticeNo=" + boardNotice.getNoticeNo();
	}
	
	
	@RequestMapping("/delete")
	public String delete( BoardNotice boardNotice, HttpSession session ) {
		logger.info("/boardnotice/delete ❤️도착❤️");
		
		//공지 게시글 삭제
		boardNoticeService.delete(boardNotice);
		
		return "redirect:/boardnotice/list";
	}

}
