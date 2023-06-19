package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Likes;
import web.dto.Tag;
import web.dto.Users;
import web.util.Paging;

public interface BoardService {
	
	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 객체의 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paging - curPage를 저장하고 있는 객체
	 * @param keyword 
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData, String keyword, String categoryType);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param page - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
//	public List<Board> boardList(Paging paging, String userId, String keyword, String categoryType);
//	public List<Board> boardList(Paging paging, String keyword, String categoryType);

//	public List<Board> boardList(Paging paramData, String userId, String keyword, String categoryType);
	public List<Board> boardList(Paging paging, String keyword, String categoryType);

	
	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Board view(Board viewBoard);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void write(Board writeBoard, List<MultipartFile> file);

	/**
	 * 게시글 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회된 게시글 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public List<Files> getAttachFile(Board viewBoard);
	
	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 파일 번호를 가진 객체
	 * @return 첨부파일의 정보
	 */
	public Files getFile(Files boardFile);

	/**
	 * 게시글 수정 처리
	 * 첨부파일 수정 처리
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 파일업로드 객체
	 */
	public void update(Board updateBoard, List<MultipartFile> file);

	/**
	 * 게시글 + 첨부파일 삭제 처리
	 * 
	 * @param board - 삭제할 게시글의 번호
	 * @param comments 
	 */
	public void delete(Board board);

	/**
	 * 게시글 좋아요 확인
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 조회된 행 수
	 */
	public boolean likeCheck(Likes like);
	
	/**
	 * 게시글 좋아요 삽입
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void boardLike(Likes like);

	/**
	 * 게시글 좋아요 삭제
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void boardDislike(Likes like);

	/**
	 * 특정 사용자가 해당 게시글에 대해 좋아요를 누른 수 조회. 
	 * 즉, 특정 사용자의 좋아요 상태를 확인하고 해당 사용자의 좋아요 수를 반환. 
	 * likeCheck 변수와 함께 사용되어 특정 사용자의 좋아요 상태와 좋아요 수를 확인하는 용도로 사용.
	 * 
	 * @param board - 좋아요 객체
	 * @return 좋아요 수 (1 : 좋아요 누름, 0 : 좋아요 누르지 않음)
	 */
	public int getBoardLikeCount(Likes like);

	/**
	 * 게시글 상세보기 - 회원의 좋아요 상태를 확인한다
	 * 
	 * @param session - 로그인한 사용자 정보
	 * @param viewBoard - 게시글 정보
	 * @return 좋아요 상태 확인 (int)
	 */
	public boolean viewCheckLike(HttpSession session, Board viewBoard);
	
	/**
	 * 댓글 조회하기 
	 * 
	 * @param comments - 댓글 번호
	 * @return 댓글 번호로 조회한 댓글 DTO
	 */
	public List<Map<String, Object>> viewComment(Comments comments);

	/**
	 * 관리자가 /board/list에서 선택한애들 삭제하도록 - 보현
	 * @param board
	 */
	public void deleteBoard(Board board);
	
  
	/**
	 * 댓글 작성하기
	 * @param comments 
	 * 
	 * @param boardNo - 댓글 작성할 게시글 번호(를 가지고 있는 DTO)
	 */
	public void writeComment(Comments comments);
	
	/**
	 * 댓글 수정하기
	 * 
	 * @param comments - 댓글 번호, 게시글 번호, 댓글 내용을 가지고 있는 DTO)
	 */
	public void updateComment(Comments comments);

	/**
	 * 댓글 삭제하기
	 * 
	 * @param board - 댓글 삭제할 게시글 번호(를 가지고 있는 DTO)
	 */
	public void deleteComment(Comments comments);

	/**
	 * 보현작성
	 * 체크 선택한거 삭제 시키는거
	 * @param check
	 */
	public void deleteCheckBoard(int[] check);

	/**
	 * 보현작성 
	 * 세션에있는 userno로 id랑 nick가져오기
	 * @param attribute
	 * @return
	 */
	public Users getUserInfo(int attribute);







}
