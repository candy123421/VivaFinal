package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
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
import web.dto.Likes;
import web.dto.SourceLike;
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
	public void list( Paging paging, Board board, Model model, String userId, String keyword, String categoryType ) {
		logger.info("/board/list [GET]");
		
		logger.info("CCCCCCCCCCCCCCCCCCCCCCategoryType {}", categoryType);
		if (categoryType == null) {
		    categoryType = "all";
		}
		
		//페이징 계산
		Paging page = boardService.getPaging(paging, keyword, categoryType);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.boardList(page, userId, keyword, categoryType);
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userId", userId);
		model.addAttribute("keyword", keyword);
		model.addAttribute("categoryType", board.getCategoryType());
		
		logger.info("ccccccccccccccccccccccccategoryType {}", categoryType);
		logger.info("1");

	}
	
	@PostMapping("/list")
	public String listpost(
			Paging paging, Model model, String userId, Board board, String keyword, String categoryType,
			@RequestParam(value="check") int[] check ) {
		
		logger.info("/board/list [Post]");
		
		//페이징 계산
		Paging page = boardService.getPaging(paging, keyword, categoryType);
		logger.info("check : {}", check);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.boardList(page, userId, keyword, categoryType);
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userId", userId);
		model.addAttribute("categoryType", board.getCategoryType());
			
		//관리자일때 리스트에서 선택한거 삭제가능하게 만드는거 - 보현
		logger.info("***check의값 : ***{}",check);
		boardService.deleteCheckBoard(check);
		
		return "redirect:./list";
	}
	
	@RequestMapping("/view")
	public String view( Board viewBoard, Model model, List<MultipartFile> file, HttpSession session, Comments comments ) {
		logger.info("/board/view");
		
		logger.info("BBBBBBBBBBBBBBBBBBboardcontent {}", viewBoard.getBoardContent());
		
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
		
		List<Comments> commentList = boardService.viewComment(comments);
		model.addAttribute("commentList", commentList);
		
		logger.info("bbbbbbbbbbbbbbbbbbbbbboardcontent {}", viewBoard.getBoardContent());

		return "board/view";
	}		
	
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String write( Board writeBoard, @RequestParam(required=false) List<MultipartFile> file, Model model, HttpSession session ){		
		logger.info("/board/write ❤️도착❤️");	
		logger.info("컨트롤러 보드 {}", writeBoard);
		logger.info("컨트롤러 파일 {}", file);
		
		int userNo = (Integer)session.getAttribute("userNo");
		writeBoard.setUserNo(userNo);
		
		boardService.write( writeBoard, file );
		model.addAttribute("writeBoard", writeBoard);
		
		return "redirect:./list";	//게시글 목록
	}
	
	@RequestMapping("/download")
	public String download(Files boardFile, Model model) {
		
		boardFile = boardService.getFile(boardFile);
		model.addAttribute("downFile", boardFile);
		 
		return "down";
	}
	
	
	@GetMapping("/update")
	public String update( Board updateBoard, Model model ) {
		logger.info("update[GET] -> Controller 도착! {}");

		//잘못된 게시글 번호 처리
		if( updateBoard.getBoardNo() < 1 ) {
			return "redirect:/board/list";
		}
		
		//수정할 게시글의 상세보기
		updateBoard = boardService.view(updateBoard);
		model.addAttribute("updateBoard", updateBoard);
		
		//첨부파일 정보 모델값 전달
		List<Files> boardFile = boardService.getAttachFile(updateBoard);
		model.addAttribute("boardFile", boardFile);
			
		return "board/update";
	}
	
	@PostMapping("/update")
	    public String update(Board updateBoard, List<MultipartFile> file, Model model) {
		logger.info("update[POST] -> Controller 도착! {}");

		updateBoard.getBoardNo();
		
		//게시글+첨부파일 수정
		boardService.update(updateBoard, file);
		model.addAttribute("updateBoard", updateBoard);
		
		//첨부파일 정보 모델값 전달
		List<Files> boardFile = boardService.getAttachFile(updateBoard);
		model.addAttribute("boardFile", boardFile);
		
	    return "redirect:./view?boardNo=" + updateBoard.getBoardNo();
	    }

		
	
	@RequestMapping("/delete")
	public String delete( Board board, Comments comments, HttpSession session ) {
		logger.info("/delete ❤️도착❤️");
		
		int userNo = (Integer)session.getAttribute("userNo");
		board.setUserNo(userNo);
		
		//댓글 조회 - (댓글이 있는 게시글 삭제를 위한 댓글 조회)
		int boardNo = board.getBoardNo();
		List<Comments> commentList = boardService.viewComment(comments);
		
		//댓글을 하나씩 삭제 (댓글이 있는 게시글 삭제를 위한 댓글 선삭제)
	    for (Comments comment : commentList) {
	        boardService.deleteComment(comment);
	    }
		
		boardService.delete(board);
		
		return "redirect:./list";
	}
	
	@GetMapping("/like")
	@ResponseBody
	public void likeBoard(Likes like, Board board, Writer out, Model model) {
		logger.info("/like ❤️도착❤️ : {}", like);
		
		boolean result = boardService.checkLike(like);
		
		 if (!result) {
		        boardService.boardLike(like);
		        try {
		            out.write("{\"result\":true}");
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		        model.addAttribute("likeCount", boardService.incrementLikeCount(like));
		    } else {
		        boardService.boardReverseLike(like);
		        try {
		            out.write("{\"result\":false}");
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		        model.addAttribute("likeCount", boardService.decrementLikeCount(like));
		    }
		
		//좋아요 수 조회
//		int likeCount = boardService.getBoardLikeCount(board);
//		model.addAttribute("likeCount", likeCount);
////		int likeCount = boardService.getBoardLikeCount(like);
//
//		if (result == false) {
//			boardService.boardLike(like);
//			try {
//				out.write("{\"result\":true, \"likeCount\":" + likeCount + "}");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} else if (result == true) {
//			boardService.boardReverseLike(like); 
//			try {
//				out.write("{\"result\":false}");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		
		logger.info("LLLLLLLLLLLLLLLLLLLLllike like - boardNo {}", like.getBoardNo());
		logger.info("LLLLLLLLLLLLLLLLLLLLllike like - userNo {}", like.getUserNo());
		logger.info("bbbbbbbbbbbbbbbbbbbbboard board - boardNo {}", board.getBoardNo());
		logger.info("likeCount ❤️ = 몇 개? : {}", result);
		logger.info("like - result {}", result);
		logger.info("///////////////////Like {}", like);
		logger.info("///////////////////Like - boardNo {}", like.getBoardNo());
		logger.info("///////////////////Like - userNo {}", like.getUserNo());
		
	}
	
	
	@GetMapping("/commentView")
	@ResponseBody
	public List<Comments> commentList(Board viewBoard, Comments comments, Model model) {
		 
		Comments comment = new Comments();
		comment.setBoardNo(comment.getBoardNo());
		comment.setCommContent(comment.getCommContent());
		
		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		
		List<Comments> commentList = boardService.viewComment(comments);
		model.addAttribute("commentList", commentList);
		
		return commentList;
	}
	
	@PostMapping("/commentWrite")
	@ResponseBody
	public List<Comments> commentWrite(
			
			@RequestParam("boardNo") int boardNo, 
			@RequestParam("commContent") String commContent, Comments comments,
			Model model) {
		
	    boardService.writeComment(comments);
	    
	    List<Comments> commentList = boardService.viewComment(comments);
	    model.addAttribute("commentList", commentList);
	    
	    return commentList;
	}
	
	
	@PostMapping("/commentUpdate")
	@ResponseBody
	public List<Comments> commentUpdate(Comments comments, Model model) {
		
		logger.info("@@@@@@@@@@@@ commentUpdate()");
		
	    logger.info("$$$$$$$$$$$$$$$$$$comments {}", comments);
	    
		boardService.updateComment(comments);
		
		//수정된 댓글 리스트 조회
	    List<Comments> commentList = boardService.viewComment(comments);
//	    model.addAttribute("commentList", commentList);
	    
//		return "redirect:./view?boardNo=" + board.getBoardNo();
	    return commentList;
//		return null;
	}

	
	@RequestMapping("/commentDelete")
	@ResponseBody
	public List<Comments> commentDelete(Board viewBoard, Comments comments, Model model) {
		logger.info("/commentDelete ❤️도착❤️ ");
		
		//Comments 객체 생성 및 데이터 설정
	    Comments comment = new Comments();
	    comment.setBoardNo(viewBoard.getBoardNo());
	    comment.setBoardNo(comments.getBoardNo());
	    comment.setCommNo(comments.getCommNo());

	    boardService.deleteComment(comment);

		//댓글 조회
		int boardNo = viewBoard.getBoardNo();
		
		//수정된 댓글 리스트 조회
	    List<Comments> commentList = boardService.viewComment(comments);
	    model.addAttribute("commentList", commentList);

	    return commentList;
	}
	

}
