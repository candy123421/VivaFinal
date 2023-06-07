package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.controller.BoardController;
import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Tag;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardDao boardDao;
	@Autowired private ServletContext context;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Override
	public List<Board> list(Paging page) {		
		return boardDao.selectList(page);
	}

	
	@Override
	public Paging getPaging(Paging paging) {
		
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll();
		
		//페이징 계산
		Paging page = new Paging( totalCount, paging.getCurPage() );
		
		return page;
	}
	
	
	@Override
	public Board view(Board viewBoard) {
		
		//조회수 증가
		boardDao.hit( viewBoard );
		
		//상세보기 조회 결과 리턴
		return boardDao.select(viewBoard);
	}
	
	
	@Override
	public void write(Board board, List<MultipartFile> file) {
		
		board.setUserNo(board.getUserNo());
		
		if("".equals( board.getBoardTitle() ) ) {
			board.setBoardTitle("제목 없음");
		}
		
		boardDao.insertBoard( board );
		
		logger.info("BoardServiceImpl - board {}", board);
		logger.info("BoardServiceImpl - file {}", file);
	
		//----------------------------------------------
		//파일 업로드 시작
		
		//빈 파일인 경우
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
		for( MultipartFile mpf : file ) {
			if( mpf.getSize() <= 0 ) {	
				logger.info("0보다 작음, 처리 중단");
				return;
			}
		}
			
		List<Files> fileList = new ArrayList<>();

		//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
		String storedPath = context.getRealPath("boardUpload");
		logger.info("storedPath : {}", storedPath);
		
		//upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		for( int i=0; i<file.size(); i++ ) {	
					
		File uploadFile = null;
		
			//파일이 저장될 이름 생성하기
			String originName = ( file.get(i)).getOriginalFilename();						//원본 파일명
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID추가
			logger.info("storedName : {}", storedName);
			
			//실제 저장될 파일 정보 객체
			uploadFile = new File(storedFolder, storedName);
			
		      //-> 중복 이름 검증 코드 do while
		      //이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
					
				try {
					 //업로드된 파일을 upload폴더에 저장하기
			         //여기서 저장
					file.get(i).transferTo(uploadFile);
					logger.info("다중 파일 업로드 성공!");
				} catch (IllegalStateException | IOException e) {
					logger.info("다중 파일 업로드 실패!");
					e.printStackTrace();
				} 
				//----------------------------------------------
					
				logger.info("!!!!!!!!!!!!!!!!!!!!!!BoardServiceImpl {}", file);	
				//DB에 기록할 정보 객체
			      
			    //첨부한 파일 삽입(파일 정보)
				Files boardFile = new Files();
				boardFile.setBoardNo( board.getBoardNo() );
				boardFile.setFilesize( file.size());
				boardFile.setOriginname(originName);
				boardFile.setStoredname(storedName);
				boardFile.setFileDate(board.getBoardDate());
				
				fileList.add(boardFile);
				}		
				
				for( Files e : fileList ) {
					boardDao.insertFile(e);
				}
	}
	
	
	@Override
	public List<Files> getAttachFile(Board viewBoard) {
		return boardDao.selectBoardFileByBoardNo(viewBoard);
	}
	
	
	@Override
	public Files getFile(Files boardFile) {
		return boardDao.selectBoardFileByFileNo(boardFile);
	}
	

	@Override
	public void update(Board board, List<MultipartFile> file) {
		
		if( "".equals( board.getBoardTitle() ) ) {
			board.setBoardTitle("(제목없음)");
		}
		boardDao.update(board);
		
		logger.info("~~~~~~~~~~boardServiceImpl {}", board);
		
		//-------------------------------------------------------
		
		//빈 파일인 경우
				//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
				for( MultipartFile mpf : file ) {
					if( mpf.getSize() <= 0 ) {	
						logger.info("0보다 작음, 처리 중단");
						return;
					}
				}
				
				logger.info("@@@@@@@@@@@boardServiceImpl {}", file);
					
				List<Files> fileList = new ArrayList<>();

				//파일이 저장될 경로 - RealPath - 톰캣 서버 배포 위치
				String storedPath = context.getRealPath("boardUpload");
				logger.info("storedPath : {}", storedPath);
				
				//upload폴더가 존재하지 않으면 생성한다
				File storedFolder = new File(storedPath);
				if( !storedFolder.exists() ) {
					storedFolder.mkdir();
				}
				
				logger.info("###################boardServiceImpl {}", file);
				
				for( int i=0; i<file.size(); i++ ) {	
					 if (file.get(i) == null) {
					        continue; // 파일이 null인 경우 건너뛰기
					    }
							
				File uploadFile = null;
				
					//파일이 저장될 이름 생성하기
					String originName = ( file.get(i)).getOriginalFilename();						//원본 파일명
					String storedName = originName + UUID.randomUUID().toString().split("-")[4];	//UUID추가
					logger.info("storedName : {}", storedName);
					
					//실제 저장될 파일 정보 객체
					uploadFile = new File(storedFolder, storedName);
					
				      //-> 중복 이름 검증 코드 do while
				      //이름이 있으면 다시 만들어라 -> 이름이 없으면 빠져나오기
							
					logger.info("$$$$$$$$$$$$$$$$$$boardServiceImpl {}", file);

					try {
							 //업로드된 파일을 upload폴더에 저장하기
					         //여기서 저장
							file.get(i).transferTo(uploadFile);
							logger.info("다중 파일 업로드 성공!");
						} catch (IllegalStateException | IOException e) {
							logger.info("다중 파일 업로드 실패!");
							e.printStackTrace();
						} 
						//----------------------------------------------
							
						logger.info("++++++++++++++++BoardServiceImpl {}", file);	
						//DB에 기록할 정보 객체
					      
					    //첨부한 파일 삽입(파일 정보)
						Files boardFile = new Files();
						boardFile.setBoardNo( board.getBoardNo() );
						boardFile.setFilesize( file.size());
						boardFile.setOriginname(originName);
						boardFile.setStoredname(storedName);
						boardFile.setFileDate(board.getBoardDate());
						
						fileList.add(boardFile);
						}		
				logger.info("%%%%%%%%%%%%%%%%boardServiceImpl {}", file);
						
					//게시글에 연결되어있는 기존의 모든 첨부파일 정보를 삭제한다
					boardDao.deleteFile(board);
	
					for( Files files : fileList ) {
							boardDao.insertFile(files);
						}
						
						
						logger.info("^^^^^^^^^^^^^^^^boardServiceImpl {}", file);
	}


	@Override
	public void delete(Board board) {
		
		boardDao.deleteFile(board);
		boardDao.delete(board);	
	}
	
	
	
	@Override
	public List<Comments> viewComment(int boardNo) {
		return boardDao.selectComment(boardNo);
	}
	
	
	@Override
	public void deleteBoard(Board board) {
		boardDao.delete(board);
	}
	
	
	@Override
	public void writeComment(Comments comments, int boardNo) {
		boardDao.insertComment(comments, boardNo);
	}
	
	
	@Override
	public void updateComment(Board board) {
		boardDao.updateComment(board);
	}
	
	
	@Override
	public void deleteComment(Board board) {
		boardDao.deleteComment(board);
	}

}
