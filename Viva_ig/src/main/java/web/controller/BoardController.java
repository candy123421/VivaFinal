package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import web.service.face.UsersService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
   
   @Autowired BoardService boardService;
   
   private final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
	@GetMapping("/list")
//	public String list(  Model model, Paging paramData, Board board, String userId
	public String list(  Model model, Paging paramData, Board board,
					@RequestParam(name = "categoryType", required = false, defaultValue = "all") String categoryType,
					@RequestParam(name = "keyword", required = false) String keyword ) {
   
	   logger.info("board/list [GET] ❤️도착❤️");

	   logger.info("categoryType: {}", categoryType);
	   logger.info("keyword: {}", keyword);
	   
	   //페이징 계산
	    Paging paging = boardService.getPaging(paramData, keyword, categoryType);
	    paging.setCategoryType(categoryType);
      
	    //게시글 목록 조회
//	    List<Board> boardList = boardService.boardList(paging, userId, keyword, categoryType);
	    List<Board> boardList = boardService.boardList(paging, keyword, categoryType);
	    logger.info("boardList : {}", boardList);
      
	    model.addAttribute("paging", paging);
//	    model.addAttribute("userId", userId);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("categoryType", categoryType);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("board", board);
	    
	   return "/board/list"; // 리스트를 보여줄 뷰 이름을 반환합니다.
   }
   
   @RequestMapping("/view")
   public String view( Board viewBoard, Model model, List<MultipartFile> file, HttpSession session, Comments comments, Likes like ) {
      logger.info("/board/view ❤️도착❤️");
      
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
      
      List<Map<String,Object>> commentList = boardService.viewComment(comments);
      model.addAttribute("commentList", commentList);
      
      // 좋아요 수 조회
      int likeCount = boardService.getBoardLikeCount(like);
      logger.info("VIEW - 좋아요 수는 ? : {}", likeCount);
      logger.info("VIEW - viewBoard.likeCount : {}", viewBoard.getLikeCount());
      model.addAttribute("likeCount", likeCount);
      
      //좋아요 이력 조회 (0이면 좋아요 안 한 상황 -> 좋아요 삽입, 1이면 좋아요 한 상황 -> 좋아요 삭제)
      boolean likeCheck = boardService.viewCheckLike(session, viewBoard);
      if (likeCheck == true) {
         model.addAttribute("likeCheck", likeCheck);
      } else if ( likeCheck == false) {
         model.addAttribute("likeCheck", likeCheck);
      }
      
      //보현작성 세션에있는 no로 id 랑 nick 가져오기(nick가져올지 id가져올지 고민중)
      Users userInfo = boardService.getUserInfo((int)session.getAttribute("userNo"));
      
      model.addAttribute("userInfo", userInfo);
      
      
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
      String userId = (String)session.getAttribute("userId");
      writeBoard.setUserId(userId);
      logger.info("userId : {}", userId);
      
      boardService.write( writeBoard, file );
      model.addAttribute("writeBoard", writeBoard);
      
      return "redirect:./list";   //게시글 목록
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
      
      //댓글을 하나씩 삭제 (댓글이 있는 게시글 삭제를 위한 댓글 선삭제)
      boardService.deleteComment(comments);
      boardService.delete(board);
      
      return "redirect:./list";
   }
   
   
   @GetMapping("/like")
   @ResponseBody
   public void likeBoard(Likes like, Board board, Writer out, Model model, HttpSession session) {
      logger.info("/like ❤️도착❤️ : {}", like);
      
      //좋아요 상태 조회 (0이면 좋아요 안 한 상황 -> 좋아요 삽입, 1이면 좋아요 한 상황 -> 좋아요 삭제)
      boolean likeCheck = boardService.likeCheck(like);
      logger.info("좋아요 상태 확인 : {}", likeCheck);
      
      if (likeCheck == false) {
            
         //좋아요 이력 없음 -> 좋아요 삽입
         boardService.boardLike(like);
            
         //좋아요 수 조회
         int likeCount = boardService.getBoardLikeCount(like);
         logger.info("좋아요 수는 ? ZERO : {}", likeCount);
         
         try {
            out.write("{\"result\":true, \"likeCount\": \"" + likeCount + "\"}");
            logger.info("likeCheck - 뭘까? {}", likeCheck);
            
         } catch (IOException e) {
            e.printStackTrace();
            }
         } else if (likeCheck == true) {
            
            //좋아요 이력 있음 -> 좋아요 삭제
            boardService.boardDislike(like);
            
            //좋아요 수 조회
            int likeCount = boardService.getBoardLikeCount(like);
            logger.info("좋아요 수는 ? ONE : {}", likeCount);
            
            try {
               out.write("{\"result\":false, \"likeCount\": \"" + likeCount + "\"}");
               logger.info("likeCheck - 뭐지?? {}", likeCheck);
               
            } catch (IOException e) {
               e.printStackTrace();
            }
         }
      logger.info("likeCount : {}", board.getLikeCount());
   }
   
   
   @GetMapping("/commentView")
   @ResponseBody
   public List<Map<String,Object>> commentList(Board viewBoard, Comments comments, Model model) {
       
      Comments comment = new Comments();
      comment.setBoardNo(comment.getBoardNo());
      comment.setCommContent(comment.getCommContent());
      
      //댓글 조회
      int boardNo = viewBoard.getBoardNo();
      

   
      List<Map<String,Object>> commentList = boardService.viewComment(comments);

      model.addAttribute("commentList", commentList);
      
      return commentList;
   }
   
   @PostMapping("/commentWrite")
   @ResponseBody
   public List<Map<String,Object>> commentWrite(
         
         @RequestParam("boardNo") int boardNo, 
         @RequestParam("commContent") String commContent, Comments comments,
         Model model,HttpSession session) {
      
	   comments.setUserNo((int)session.getAttribute("userNo"));
       boardService.writeComment(comments);
       
       List<Map<String,Object>> commentList = boardService.viewComment(comments);
       model.addAttribute("commentList", commentList);
       logger.info("코맨트리스틍*******@*@*@*@*@*{}",commentList);
       return commentList;
   }
   
   
   @PostMapping("/commentUpdate")
   @ResponseBody
   public List<Map<String,Object>> commentUpdate(Comments comments, Model model) {
	   logger.info("/commentUpdate ❤️도착❤️ ");
      
       logger.info("comments {}", comments);
       
       boardService.updateComment(comments);
      
      //수정된 댓글 리스트 조회
       List<Map<String,Object>> commentList = boardService.viewComment(comments);
       
//      return "redirect:./view?boardNo=" + board.getBoardNo();
       return commentList;
   }

   
   @RequestMapping("/commentDelete")
   @ResponseBody
   public List<Map<String,Object>> commentDelete(Board viewBoard, Comments comments, Model model) {
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
       List<Map<String,Object>> commentList = boardService.viewComment(comments);
       model.addAttribute("commentList", commentList);

       return commentList;
   }
   


}