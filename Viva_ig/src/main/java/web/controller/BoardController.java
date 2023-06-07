package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired BoardService boardService;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/list")
	public void list( Paging paging, Model model, String userNick ) {
		logger.info("/board/list [GET]");
		
		//페이징 계산
		Paging page = boardService.getPaging(paging);
		logger.info("{}", page);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.list(page);
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userNick", userNick);
	}
	
	@PostMapping("/list")
	public void listpost(Paging paging, Model model, String userNick,Board board) {
		logger.info("/board/list [Post]");
		
		//페이징 계산
		Paging page = boardService.getPaging(paging);
		logger.info("{}", page);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.list(page);
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userNick", userNick);
		
		//관리자일때 리스트에서 선택한거 삭제가능하게 만드는거 - 보현
		boardService.deleteBoard(board);
		
	}
	
	@RequestMapping("/view")
	public String view( Board viewBoard, Model model, List<MultipartFile> file ) {
		logger.info("/board/view");
		
		//잘못된 게시글 번호 처리
		if( viewBoard.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		//게시글 조회
		viewBoard = boardService.view( viewBoard );
		logger.info("조회된 게시글 {}", viewBoard);
		
		//모델값 전달  - 게시글
		model.addAttribute("viewBoard", viewBoard);
		logger.info("viewBoard : {} ",viewBoard);
		
		//첨부파일 정보 모델값 전달
		List<Files> boardFile = boardService.getAttachFile(viewBoard);
		
		logger.info("**************파일!{}", file);
		logger.info("^^^^^^^^^^^^^^컨트롤러 {}", boardFile);
		model.addAttribute("boardFile", boardFile);
		
		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		logger.info("boardNo {}", boardNo);
		
		List<Comments> commentList = boardService.viewComment(boardNo);
		model.addAttribute("commentList", commentList);
		
		logger.info("+++ ++++ 확인 {} : ",commentList);
	
		return "board/view";
	}		
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc( Board board, @RequestParam(required=false) List<MultipartFile> file, Model model, HttpSession session ){		
		logger.info("/board/write [POST]");	
		logger.info("컨트롤러 보드 {}", board);
		logger.info("컨트롤러 파일 {}", file);
		
		//로그인
		//session에 저장된 userId를 id에 저장
//		String id = null; 
//		if( session.getAttribute("userid")!= null ) {
//
//			id = (String)session.getAttribute("userid");	  
//			logger.info("로그인 성공"); 
//		
//		} else {
//			logger.info("로그인 실패"); 
//			return "redirect:./main"; 
//		} 
//
//		model.addAttribute("userId", id);
		
//		board.setBoardTitle(boardTitle);// 여기에 tilte담아야함
//		board.setBoardContent(boardContent);
//		board.setBoardContent(categoryType);
		
		boardService.write( board, file );
		
		return "redirect:./list";	//게시글 목록
	}
	
	
	@RequestMapping("/download")
	public String download(Files boardFile, Model model) {
		
		boardFile = boardService.getFile(boardFile);
		model.addAttribute("downFile", boardFile);
		 
		return "down";
	}
	
	
	@GetMapping("/update")
	public String update( Board board, Model model ) {
		
		//잘못된 게시글 번호 처리
		if( board.getBoardNo() < 1 ) {
			return "redirect:/board/list";
		}
		
		//수정할 게시글의 상세보기
		board = boardService.view(board);
		model.addAttribute("updateBoard", board);
		
		//첨부파일 정보 모델값 전달
		List<Files> boardFile = boardService.getAttachFile(board);
		
		model.addAttribute("boardFile", boardFile);
		
		logger.info("BoardController - update [GET] {}", boardFile);
			
		return "board/update";
	}
	
	@PostMapping("/update")
	    public String updateProc(Board board, List<MultipartFile> file) {
	        
		//게시글+첨부파일 수정
		boardService.update(board, file);
	        
	    return "redirect:./view?boardNo=" + board.getBoardNo();
	    }
	
	@RequestMapping("/delete")
	public String delete( Board board ) {
		boardService.delete(board);
		
		return "redirect:./list";
	}
	
	
	@RequestMapping("/commentWrite")
//	public String commentWrite(Comments comments, @RequestBody Map<String, Object> param) {
	public String commentWrite(Board viewBoard, @RequestBody Comments comments, @RequestParam("comments") int boardNo, Model model) {
//	public String commentWrite(@ModelAttribute("commContent") Comments commContent, @RequestParam("commContent") int boardNo, Model model) {
	
		
		boardService.writeComment(comments, boardNo);
		
		//댓글 조회
		List<Comments> commentList = boardService.viewComment(boardNo);
		model.addAttribute("commentList", commentList);
		
//		return "redirect:./view?boardNo=" + board.getBoardNo();
		return "redirect:./view?boardNo=" + comments.getBoardNo();
//		return null;
	}
	
	
	@RequestMapping("/commentUpdate")
	public String commentUpdate(Board board) {
		
		boardService.updateComment(board);
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/commentDelete")
	public String commentDelete(Board board) {
		
		boardService.deleteComment(board);
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}

}
