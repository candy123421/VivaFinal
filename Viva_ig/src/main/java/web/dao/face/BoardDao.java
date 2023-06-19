package web.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Likes;
import web.dto.Users;
import web.util.Paging;

public interface BoardDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 전체 게시글의 갯수
	 */
	public int selectCntAll();
	
	/**
	 * 자유 게시글 수를 조회한다
	 * 
	 * @return 자유 게시글의 갯수
	 */
	public int selectCntFree();
	
	/**
	 * 공지 게시글 수를 조회한다
	 * 
	 * @return 공지 게시글의 갯수
	 */
	public int selectCntQna();
	
	/**
	 * 페이징을 적용하여 모든 게시글 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param page - 페이지 정보 객체
	 * @param keyword  - 검색어
	 * @return 페이징이 적용된 모든 게시글 목록
	 */
	public List<Board> selectAllBoardList(Paging page);
	
	/**
	 * 페이징을 적용하여 자유 게시글 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이지 정보 객체
	 * @return 페이징이 적용된 자유게시글 목록
	 */
//	public List<Board> selectFreeBoardList(Paging paging);
	public List<Board> selectFreeBoardList(Paging page);

	/**
	 * 페이징을 적용하여 공지 게시글 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이지 정보 객체
	 * @return 페이징이 적용된 공지게시글 목록
	 */
	public List<Board> selectQnaBoardList(Paging page);
	
	/**
	 * keyword로 검색한 전체 게시글 수를 조회한다
	 * 
	 * @param keyword - 검색어
	 * @return keyword가 들어간 전체 게시글 갯수
	 */
	public int selectCntAllByKeyword(String keyword);
	
	/**
	 * keyword로 검색한 자유 게시글 수를 조회한다
	 * 
	 * @param keyword - 검색어
	 * @return keyword가 들어간 자유 게시글 갯수
	 */
	public int selectCntFreeByKeyword(String keyword);

	/**
	 * keyword로 검색한 공지 게시글 수를 조회한다
	 * 
	 * @param keyword - 검색어
	 * @return keyword가 들어간 공지 게시글 갯수
	 */
	public int selectCntQnaByKeyword(String keyword);

	/**
	 * 페이징을 적용하고, 키워드로 검색한 게시글 목록 조회
	 * 
	 * @param paging - 페이지 정보 객체
	 * @param keyword - 검색어
	 * @return 페이징이 적용되고, 키워드로 검색한 전체 게시글 목록
	 */
	public List<Board> selectAllBoardListByKeyword(@Param("paging") Paging page, @Param(value="keyword") String keyword);
//	public List<Board> selectAllBoardListByKeyword(@Param(value="paging")Paging paging, @Param(value="keyword") String keyword);

	/**
	 * 페이징을 적용하고, 키워드로 검색한 게시글 목록 조회
	 * 
	 * @param paging - 페이지 정보 객체
	 * @param keyword - 검색어
	 * @return 페이징이 적용되고, 키워드로 검색한 자유 게시글 목록
	 */
	public List<Board> selectFreeBoardListByKeyword(@Param("paging") Paging page, @Param(value="keyword") String keyword);

	/**
	 * 페이징을 적용하고, 키워드로 검색한 게시글 목록 조회
	 * 
	 * @param paging - 페이지 정보 객체
	 * @param keyword - 검색어
	 * @return 페이징이 적용되고, 키워드로 검색한 공지 게시글 목록
	 */
	public List<Board> selectQnaBoardListByKeyword(@Param("paging") Paging page, @Param(value="keyword") String keyword);
	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */
	public void hit(Board viewBoard);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Board select(Board viewBoard);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertBoard(Board writeBoard);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param boardFile - 삽입할 첨부파일 정보
	 */
	public void insertFile(Files boardFile);
//	public void insertFile(List<MultipartFile> file);

	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewBoard - 조회할 게시글 정보
	 * @return 조회된 첨부파일 정보
	 */
	public List<Files> selectBoardFileByBoardNo(Board viewBoard);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param boardFile - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public Files selectBoardFileByFileNo(Files boardFile);

	/**
	 * 게시글 정보 수정
	 * 
	 * @param board - 수정할 내용을 가진 게시글 객체
	 */
	public void update(Board updateBoard);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일을 삭제한다
	 * 
	 * @param board - 첨부파일을 삭제할 게시글 번호 객체
	 */
	public void deleteFile(Board board);

	/**
	 * 게시글 정보 삭제
	 * 
	 * @param board - 삭제할 게시글의 글번호
	 */
	public void delete(Board board);
	
	
	/**
	 * 게시글 좋아요 확인 
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 조회된 행 수
	 */
	public int selectByLikeCheck(Likes like);
	
	/**
	 * 게시글 좋아요 삽입
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void insertBoardLike(Likes like);
	
	/**
	 * 게시글 좋아요 삭제
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void deleteBoardLike(Likes like);
	
	/**
	 * 특정 사용자가 해당 게시글에 대해 좋아요를 누른 수 조회. 
	 * 즉, 특정 사용자의 좋아요 상태를 확인하고 해당 사용자의 좋아요 수를 반환.
	 * 
	 * @param like - 좋아요 객체
	 * @return 좋아요 수 (1 : 좋아요 누름, 0 : 좋아요 누르지 않음)
	 */
	public int selectBoardLikeCount(Likes like);
	
	/**
	 * 게시글 상세보기 - 회원의 좋아요 상태를 확인한다
	 * 
	 * @param like - 좋아요 객체
	 * @return 로그인한 회원의 게시글 좋아요 여부 (int)
	 */
	public int selectByViewBoardLike(Likes like);
	
	/**
	 * 댓글 조회하기
	 * 
	 * @param comments - 조회할 댓글의 게시글 번호
	 * @return
	 */
	public List<Map<String,Object>> selectComment(Comments comments);

	/**
	 * 댓글 작성하기
	 * @param comments 
	 * 
	 * @param boardNo - 댓글 작성할 게시글 번호(를 가지고 있는 DTO)
	 * @return 
	 */
	public void insertComment(Comments comments);

	/**
	 * 댓글 수정하기
	 * 
	 * @param comment - 댓글번호, 게시글번호, 댓글 내용을 가지고 있는 DTO)
	 */
	public void updateComment(Comments comment);

	/**
	 * 댓글 삭제하기
	 * 
	 * @param board - 댓글 삭할 게시글 번호(를 가지고 있는 DTO)
	 */
	public void deleteComment(Comments comment);

	/**
	 * 보현작성 
	 * 체크박스로 글 삭제하기전에 댓글 먼저 삭제하는거
	 * @param board
	 */
	public void deleteCommentAll(Board board);

	/**
	 * 검색어를 통한 조회
	 * 검색어가 포함된 게시글의 리스트를 가져온다
	 * @param list - paging 과 검색어가 포함된 개체
	 * @return
	 */
	public List<Board> selectBoardBySearch(Map<String, Object> list);

	/**
	 * 세션에있는 userno로 id,nick 가져오기
	 * @param attribute
	 * @return
	 */
	public Users selectUserInfo(int attribute);














}
