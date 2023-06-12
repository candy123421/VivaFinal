package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import web.controller.BoardController;
import web.dao.face.BoardNoticeDao;
import web.dto.Board;
import web.dto.BoardNotice;
import web.service.face.BoardNoticeService;
import web.util.Paging;

@Service
public class BoardNoticeServiceImpl implements BoardNoticeService {
	
	@Autowired BoardNoticeDao boardNoticeDao;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Override
	public Paging getPaging(Paging paging, String keyword) {
		
		Paging page = null;
		
		//총 게시글 수 조회
		if( keyword == null ) {
			int totalCount = boardNoticeDao.selectCntNoticeAll();
			page = new Paging(totalCount, paging.getCurPage());			//페이징 계산
		} else {
			int totalCount = boardNoticeDao.selectCntNoticeByKeyword(keyword);
			page = new Paging(totalCount, paging.getCurPage());			//페이징 계산
		}
		return page;
	}
	
	
	
	@Override
	public List<BoardNotice> boardNoticeList(Paging page, String keyword) {

		Paging paging = null;
		
		if( keyword == null ) {
			int totalCount = boardNoticeDao.selectCntNoticeAll();
			paging = new Paging(totalCount, page.getCurPage() );		//페이징 계산
			
			return boardNoticeDao.selectBoardNoticeList(paging);
			
		} else {
			int totalCount = boardNoticeDao.selectCntNoticeByKeyword(keyword);
			paging = new Paging(totalCount, page.getCurPage());			//페이징 계산

			return boardNoticeDao.selectBoardNoticeListByKeyword(paging, keyword);
								  
		}
	}
	
	
	@Override
	public BoardNotice viewNotice(BoardNotice boardNotice) {
		return boardNoticeDao.select(boardNotice);
	}
	
	
	@Override
	public void write(BoardNotice boardNotice) {
		
		boardNotice.setAdminNo(boardNotice.getAdminNo());
		
		if("".equals( boardNotice.getNoticeTitle() ) ) {
			boardNotice.setNoticeTitle("(제목없음)");
		}
		boardNoticeDao.insert( boardNotice );
	}
	
	
	@Override
	public void update(BoardNotice boardNotice) {
		
		if( "".equals( boardNotice.getNoticeTitle() ) ) {
			boardNotice.setNoticeTitle("(제목없음)");
		}
		boardNoticeDao.update(boardNotice);
	}
	
	
	@Override
	public void delete(Board boardNotice) {
		boardNoticeDao.delete(boardNotice);
	}

}
