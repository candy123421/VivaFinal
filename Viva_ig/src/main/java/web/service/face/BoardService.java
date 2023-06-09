package web.service.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Tag;
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
	public Paging getPaging(Paging paging, String keyword);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param page - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Board> boardList(Paging page, String userId, String keyword);

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
	public void write(Board board, List<MultipartFile> file);

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
	public void update(Board board, List<MultipartFile> file);

	/**
	 * 게시글 + 첨부파일 삭제 처리
	 * 
	 * @param board - 삭제할 게시글의 번호
	 */
	public void delete(Board board);

	/**
	 * 댓글 조회하기 
	 * 
	 * @param boardNo - 댓글 조회할 게시글의 번호
	 * @return
	 */
	public List<Comments> viewComment(int boardNo);

	/**

	 * 관리자가 /board/list에서 선택한애들 삭제하도록
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
//	public List<Comments> writeComment(Comments comments);
	
	
	/**
	 * 댓글 수정하기
	 * 
	 * @param board - 댓글 수정할 게시글 번호(를 가지고 있는 DTO)
	 */
	public void updateComment(Comments comments);

	/**
	 * 댓글 삭제하기
	 * 
	 * @param board - 댓글 삭제할 게시글 번호(를 가지고 있는 DTO)
	 */
	public void deleteComment(Comments comments);

	/**
	 * 전체 검색하기
	 * 
	 * @param keyword - 클라이언트가 입력한 검색할 키워드
	 * @param page - 페이징 정보 객체
	 * @return
	 */
	public List<Board> searchBoard(String keyword, Paging page);

	/**
	 * 보현작성
	 * 체크 선택한거 삭제 시키는거
	 * @param check
	 */
	public void deleteCheckBoard(int[] check);






}
