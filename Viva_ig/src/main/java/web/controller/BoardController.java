package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
	public void list( Paging paging, Model model, Board board, String userId, String keyword ) {
		logger.info("/board/list [GET]");
		logger.info("카테고리 : {} ", board.getCategoryType());

		if("all".equals(board.getCategoryType())) {
			logger.info("전체 게시판");

		} else if ("free".equals(board.getCategoryType())){
			logger.info("자유게시판");
			
		} else if ("notice".equals(board.getCategoryType())) {
			logger.info("공지게시판");
			
			
		}

		//페이징 계산
		Paging page = boardService.getPaging(paging, keyword);

		//게시글 목록 조회
		List<Board> boardList = boardService.boardList(page, userId, keyword);

		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userId", userId);
		model.addAttribute("keyword", keyword);
	}
	
	@PostMapping("/list")
	public String listpost(
			Paging paging, Model model, String userId, Board board, String keyword,
			@RequestParam(value="check") int[] check ) {
		
		logger.info("/board/list [Post]");
		
		//페이징 계산
		Paging page = boardService.getPaging(paging, keyword);
		logger.info("check : {}", check);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.boardList(page, userId, keyword);
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userId", userId);
		model.addAttribute("category", board.getCategoryType());
			
		//관리자일때 리스트에서 선택한거 삭제가능하게 만드는거 - 보현
		logger.info("***check의값 : ***{}",check);
		boardService.deleteCheckBoard(check);
		
		return "redirect:./list";
	}
	
	@RequestMapping("/view")
	public String view( Board viewBoard, Model model, List<MultipartFile> file, HttpSession session ) {
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
		
		model.addAttribute("boardFile", boardFile);
		
		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		logger.info("boardNo {}", boardNo);
		
		List<Comments> commentList = boardService.viewComment(boardNo);
		model.addAttribute("commentList", commentList);

		return "board/view";
	}		
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc( Board board, @RequestParam(required=false) List<MultipartFile> file, Model model, HttpSession session ){		
		logger.info("/board/write [POST]");	
		logger.info("컨트롤러 보드 {}", board);
		logger.info("컨트롤러 파일 {}", file);
		
//		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!{}", userNo);
		
//		model.addAttribute("userLogin", userId);
		
//		board.setBoardTitle(boardTitle);// 여기에 tilte담아야함
//		board.setBoardContent(categoryType);
		
		int userNo = (Integer)session.getAttribute("userNo");
		board.setUserNo(userNo);
		
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
	
	@GetMapping("/commentView")
	@ResponseBody
	public List<Comments> commentList(Board viewBoard, Comments comments, Model model) {
		 
		Comments comment = new Comments();
		comment.setBoardNo(comment.getBoardNo());
		comment.setCommContent(comment.getCommContent());
		
		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		
		List<Comments> commentList = boardService.viewComment(boardNo);
		model.addAttribute("commentList", commentList);
		
		return commentList;
	}
	
	@PostMapping("/commentWrite")
	@ResponseBody
	public List<Comments> commentWrite(
			
			@RequestParam("boardNo") int boardNo, 
			@RequestParam("commContent") String commContent, 
			Model model) {
		
		//Comments 객체 생성 및 데이터 설정
	    Comments comments = new Comments();
	    comments.setBoardNo(boardNo);
	    comments.setCommContent(commContent);
	    
	    boardService.writeComment(comments);
	    
	    List<Comments> commentList = boardService.viewComment(boardNo);
	    model.addAttribute("commentList", commentList);
	    
	    return commentList;
	}
	
	
	@PostMapping("/commentUpdate")
	@ResponseBody
	public List<Comments> commentUpdate(Board viewBoard, Comments comments, Model model) {
		
		//Comments 객체 생성 및 데이터 설정
	    Comments comment = new Comments();
//	    comments.setBoardNo(comment.getBoardNo());
//	    comments.setCommNo(comment.getCommNo());
//	    comments.setCommContent(comment.getCommContent());
	    comments.setBoardNo(viewBoard.getBoardNo());
	    comments.setCommNo(comments.getCommNo());
	    comments.setCommContent(comments.getCommContent());

		boardService.updateComment(comments);
		
		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		
		//수정된 댓글 리스트 조회
	    List<Comments> commentList = boardService.viewComment(boardNo);
	    model.addAttribute("commentList", commentList);
	    
//		return "redirect:./view?boardNo=" + board.getBoardNo();
	    return commentList;
	}

	
	@PostMapping("/commentDelete")
	@ResponseBody
	public List<Comments> commentDelete(Board viewBoard, Comments comments, Model model) {
			
		//Comments 객체 생성 및 데이터 설정
	    Comments comment = new Comments();
	    comment.setBoardNo(viewBoard.getBoardNo());
	    comment.setCommNo(comments.getCommNo());

		boardService.deleteComment(comments);

		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		
		//수정된 댓글 리스트 조회
	    List<Comments> commentList = boardService.viewComment(boardNo);
	    model.addAttribute("commentList", commentList);
	    
		return commentList;
	}
	

}
