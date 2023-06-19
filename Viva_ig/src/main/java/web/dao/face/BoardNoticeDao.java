package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.dto.Board;
import web.dto.BoardNotice;
import web.util.Paging;

public interface BoardNoticeDao {

	/**
	 * 공지 게시글 수를 조회한다
	 * 
	 * @return 공지 게시글의 갯수
	 */
	public int selectCntNoticeAll();

	/**
	 * keyword로 검색한 전체 공지 게시글 수를 조회한다
	 * 
	 * @param keyword - 검색어
	 * @return keyword가 들어간 전체 공지 게시글 갯수
	 */
	public int selectCntNoticeByKeyword(String keyword);
	
	/**
	 * 페이징을 적용하여 모든 공지게시글 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param page - 페이지 정보 객체
	 * @return 페이징이 적용된 모든 공지게시글 목록
	 */
	public List<BoardNotice> selectBoardNoticeList(Paging paging);

	/**
	 * 페이징을 적용하고, 키워드로 검색한 공지게시글 목록 조회
	 * 
	 * @param paging - 페이지 정보 객체
	 * @param keyword - 검색어
	 * @return 페이징이 적용되고, 키워드로 검색한 전체 공지게시글 목록
	 */
	public List<BoardNotice> selectBoardNoticeListByKeyword(@Param("paging") Paging page, @Param(value="keyword") String keyword);

	/**
	 * 공지게시글 번호를 이용하여 공지게시글을 조회한다
	 * 
	 * @param boardNotice - 조회하려는 공지게시글 번호
	 * @return 조회된 공지게시글 정보
	 */
	public BoardNotice select(BoardNotice boardNotice);

	/**
	 * 공지게시글 정보를 삽입한다
	 * 
	 * @param boardNotice - 삽입할 공지게시글 정보
	 */
	public void insert(BoardNotice boardNotice);

	/**
	 * 공지게시글 정보 수정
	 * 
	 * @param boardNotice - 수정할 내용을 가진 공지게시글 객체
	 */
	public void update(BoardNotice boardNotice);

	/**
	 * 공지게시글 정보 삭제
	 * 
	 * @param boardNotice - 삭제할 공지게시글의 글번호
	 */
	public void delete(BoardNotice boardNotice);

}
