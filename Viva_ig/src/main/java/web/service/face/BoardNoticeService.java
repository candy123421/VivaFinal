package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.BoardNotice;
import web.util.Paging;

public interface BoardNoticeService {

	/**
	 * 공지게시글 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 객체의 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paging - curPage를 저장하고 있는 객체
	 * @param keyword - 검색어
	 * @return 계산이 완료된 Paging객체
	 */
	Paging getPaging(Paging paramData, String keyword);

	/**
	 * 페이징이 적용된 공지 게시글 목록 조회
	 * 
	 * @param page - 페이징 정보 객체
	 * @param keyword - 검색어
	 * @return 페이징이 적용된 게시글 목록
	 */
	List<BoardNotice> boardNoticeList(Paging page, String keyword);
	

	/**
	 * 공지게시글 상세보기
	 * 
	 * @param boardNotice - 상세 조회할 공지게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public BoardNotice viewNotice(BoardNotice boardNotice);

	/**
	 * 공지게시글 작성
	 * 
	 * @param boardNotice - 공지게시글 정보 DTO
	 */
	public void write(BoardNotice boardNotice);
	
	/**
	 * 공지게시글 수정
	 * 
	 * @param boardNotice - 공지게시글 정보 객체
	 * @return 
	 */
	public void update(BoardNotice boardNotice);

	/**
	 * 공지게시글 삭제
	 * 
	 * @param boardNotice - 삭제할 공지게시글의 번호
	 */
	public void delete(BoardNotice boardNotice);


}
