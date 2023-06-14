package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.controller.BoardController;
import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Comments;
import web.dto.Files;
import web.dto.Likes;
import web.dto.PackLike;
import web.dto.Tag;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired BoardDao boardDao;
	@Autowired private ServletContext context;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Override
	public Paging getPaging(Paging paging, String keyword, String categoryType) {
		
		Paging page = null;
		
		//총 게시글 수 조회
		if( keyword == null ) {
			int totalCount = boardDao.selectCntAll();
			page = new Paging(totalCount, paging.getCurPage());			//페이징 계산
		} else {
			int totalCount = boardDao.selectCntAllByKeyword(keyword);
			page = new Paging(totalCount, paging.getCurPage());			//페이징 계산
		}
		return page;
	}
	
	@Override
	public List<Board> boardList(Paging page,String userId, String keyword, String categoryType) {	
		
		List<Board> boardList;
		int totalCount;
	    Paging paging = new Paging(page.getTotalCount(), page.getCurPage());
		    
		    if (keyword == null || keyword.isEmpty()) {
		        if (categoryType == null || categoryType.equals("all")) {
		            totalCount = boardDao.selectCntAll();
		            boardList = boardDao.selectAllBoardList(paging);
		            
		        } else if (categoryType.equals("free")) {
		            totalCount = boardDao.selectCntFree();
		            boardList = boardDao.selectFreeBoardList(paging);
		            
		        } else if (categoryType.equals("qna")) {
		            totalCount = boardDao.selectCntQna();
		            boardList = boardDao.selectQnaBoardList(paging);
		            
		        } else {
		            totalCount = 0; // 예시로 0으로 처리
		            boardList = Collections.emptyList(); // 예시로 빈 리스트 반환
		        }
		    } else {
		        if (categoryType == null || categoryType.equals("all")) {
		            totalCount = boardDao.selectCntAllByKeyword(keyword);
		            boardList = boardDao.selectAllBoardListByKeyword(paging, keyword);
		            
		        } else if (categoryType.equals("free")) {
		            totalCount = boardDao.selectCntFreeByKeyword(keyword);
		            boardList = boardDao.selectFreeBoardListByKeyword(paging, keyword);
		            
		        } else if (categoryType.equals("qna")) {
		            totalCount = boardDao.selectCntQnaByKeyword(keyword);
		            boardList = boardDao.selectQnaBoardListByKeyword(paging, keyword);
		            
		        } else {
		            totalCount = 0; // 예시로 0으로 처리
		            boardList = Collections.emptyList(); // 예시로 빈 리스트 반환
		        }
		    }
		    
		    page.setTotalCount(totalCount);
		    return boardList;
		}


//		List<Board> boardList;
//		Paging paging = null;
//		
//		if (keyword == null) {
//		    int totalCount;
//		    if (categoryType == null || categoryType.equals("all")) {
//		        totalCount = boardDao.selectCntAll();
//		    } else if (categoryType.equals("free")) {
//		        totalCount = boardDao.selectCntFree();
//		    } else if (categoryType.equals("qna")) {
//		        totalCount = boardDao.selectCntQna();
//		    } else {
//		        // Handle invalid categoryType or return an appropriate count
//		        totalCount = 0; // 예시로 0으로 처리
//		    }
//
//		    paging = new Paging(totalCount, page.getCurPage());
//
//		    if (categoryType == null || categoryType.equals("all")) {
//		        boardList = boardDao.selectAllBoardList(paging);
//		        
//		    } else if (categoryType.equals("free")) {
//		        boardList = boardDao.selectFreeBoardList(paging);
//		        
//		    } else if (categoryType.equals("qna")) {
//		        if (keyword != null) {
//		            totalCount = boardDao.selectCntAllByKeyword(keyword);
//		            paging = new Paging(totalCount, page.getCurPage());
//		            boardList = boardDao.selectAllBoardListByKeyword(paging, keyword);
//		            
//		        } else {
//		            boardList = boardDao.selectQnaBoardList(paging);
//		        }
//		    } else {
//		        boardList = Collections.emptyList(); // 예시로 빈 리스트 반환
//		    }
//		} else {
//			
//		    int totalCount;
//		    if (categoryType == null || categoryType.equals("all")) {
//		        totalCount = boardDao.selectCntAllByKeyword(keyword);
//		    } else if (categoryType.equals("free")) {
//		        totalCount = boardDao.selectCntFreeByKeyword(keyword);
//		    } else if (categoryType.equals("qna")) {
//		        totalCount = boardDao.selectCntQnaByKeyword(keyword);
//		    } else {
//		        // Handle invalid categoryType or return an appropriate count
//		        totalCount = 0; // 예시로 0으로 처리
//		    }
//
//		    paging = new Paging(totalCount, page.getCurPage());
//
//		    if (categoryType == null || categoryType.equals("all")) {
//		        boardList = boardDao.selectAllBoardListByKeyword(paging, keyword);
//		    } else if (categoryType.equals("free")) {
//		        boardList = boardDao.selectFreeBoardListByKeyword(paging, keyword);
//		    } else if (categoryType.equals("qna")) {
//		        boardList = boardDao.selectQnaBoardListByKeyword(paging, keyword);
//		    } else {
//		        boardList = Collections.emptyList(); // 예시로 빈 리스트 반환
//		    }
//		}
//		return boardList = boardDao.selectAllBoardList(paging);
//	}
		
	
	
//		//키워드 검색
//		if( keyword == null ) {
//			int totalCount = boardDao.selectCntAll();
//			paging = new Paging(totalCount, page.getCurPage() );
//			
//			return boardDao.selectBoardList(paging);
//			
//		} else {
//			int totalCount = boardDao.selectCntAllByKeyword(keyword);
//			paging = new Paging(totalCount, page.getCurPage());
//
//			return boardDao.selectBoardListByKeword(paging, keyword);
//		}
		

	@Override
	public Board view(Board viewBoard) {
		
		//조회수 증가
		boardDao.hit( viewBoard );
		
		//상세보기 조회 결과 리턴
		return boardDao.select(viewBoard);
	}
	
	
	@Override
	public void write(Board writeBoard, List<MultipartFile> file) {
		
		writeBoard.setUserNo(writeBoard.getUserNo());
		
		if("".equals( writeBoard.getBoardTitle() ) ) {
			writeBoard.setBoardTitle("제목 없음");
		}
		
		boardDao.insertBoard( writeBoard );
		
		logger.info("BoardServiceImpl - board {}", writeBoard);
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
				boardFile.setBoardNo( writeBoard.getBoardNo() );
				boardFile.setFilesize( file.size());
				boardFile.setOriginname(originName);
				boardFile.setStoredname(storedName);
				boardFile.setFileDate(writeBoard.getBoardDate());
				
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
	public void update(Board updateBoard, List<MultipartFile> file) {
		
		logger.info("uuuuuuuuuuuuuuuuuuuuuuuupdateBoard {}", updateBoard);
		logger.info(";;;;;;;;;;;;;;;;;;;;;;;updateBoard - boardNo {}", updateBoard.getBoardNo());

		
		if( "".equals( updateBoard.getBoardTitle() ) ) {
			updateBoard.setBoardTitle("(제목없음)");
		}
		
		//게시글에 연결되어있는 기존의 모든 첨부파일 정보를 삭제한다
		boardDao.deleteFile(updateBoard);
		
		//게시글 수정
		logger.info("''''''''''''''''''''''''''''updateBoard.setBoardNo(boardNo){}", updateBoard.getBoardNo() );
		int boardNo;
		logger.info("uuuuuuuuuuuuuuuuUPDATE BOARD {}", updateBoard);
		boardDao.update(updateBoard);
		
		logger.info("~~~~~~~~~~boardServiceImpl {}", updateBoard);
		
		//-------------------------------------------------------
		

		//빈 파일인 경우
		//파일이 없을 때 파일 삽입하는 메소드 처리되지 않도록 
//		if (file == null || file.isEmpty()) {
//	        logger.info("파일이 null이거나 비어있습니다. 처리 중단");
//	        continue;
//	    }
		for (MultipartFile mpf : file) {
		    if (mpf.getSize() <= 0) {
		        logger.info("파일의 크기가 0보다 작습니다");
		        continue;
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
				if (file.get(i) == null || file.get(i).isEmpty()) {
					logger.info("파일이 null이거나 비어있습니다.");
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
							
						logger.info("++++++++++++++++BoardServiceImpl {}", file);	
						//DB에 기록할 정보 객체
					      
					    //첨부한 파일 삽입(파일 정보)
						Files boardFile = new Files();
						boardFile.setBoardNo( updateBoard.getBoardNo() );
//						boardFile.setFilesize( file.size());
						fileList.size();
						boardFile.setOriginname(originName);
						boardFile.setStoredname(storedName);
						boardFile.setFileDate(updateBoard.getBoardDate());
						
						fileList.add(boardFile);
//						boardDao.insertFile(fileList);
						}		
					logger.info("%%%%%%%%%%%%%%%%boardServiceImpl {}", file);
						
	
//					for( Files files : fileList ) {
//							
//						}
					for (Files files : fileList) {
					    boardDao.insertFile(files);
					}

						
					logger.info("^^^^^^^^^^^^^^^^boardServiceImpl {}", file);
	}


	@Override
	public void delete(Board board) {
		logger.info("delete - ServiceImpl ❤️도착❤️");
		
		//Comments 객체 생성 및 데이터 설정
	    Comments comment = new Comments();
		
	    //게시글 댓글 삭제 (댓글 있는 게시글 삭제 시, 게시글 댓글 먼저 삭제를 위함)
		boardDao.deleteComment(comment);

		//게시글 파일 삭제
		boardDao.deleteFile(board);
		
		//게시글 삭제
		boardDao.delete(board);	
	}
	
	//보현
	@Override
	public void deleteBoard(Board board) {
		boardDao.delete(board);
	}
	
	
	@Override
	public boolean likeCheck(Likes like) {
		logger.info("serviceImpl - checkLike ⭐도착⭐");
		
		//좋아요 상황 조회 (0이면 좋아요 안 한 상황, 1이면 좋아요 한 상황)
		int result = boardDao.selectByLikeCheck(like);
		
		if( result > 0 ) {
			return true;
		}
		return false;
	}
	
	@Override
	public void boardLike(Likes like) {
		boardDao.insertBoardLike(like);
	}
	
	@Override
	public void boardDislike(Likes like) {
		boardDao.deleteBoardLike(like);
	}
	
	@Override
	public int getBoardLikeCount(Likes like) {
		
		//특정 사용자의 좋아요 상태를 확인하고 해당 사용자의 좋아요 수를 반환
		return boardDao.selectBoardLikeCount(like);
	}
	
	@Override
	public int getBoardTotalLikeCount(int boardNo) {
		
		//게시글의 총 좋아요 수
		return boardDao.selectBoardTotalLikeCount(boardNo);
	}
	
	@Override
	public int incrementBoardLikeCount(int boardNo) {
		
		//게시글의 총 좋아요 수 확인(count)
		int likeCount = boardDao.selectBoardTotalLikeCount(boardNo);
		likeCount++;
		
		Board board = new Board();
	    board.setBoardNo(boardNo);
	    
	    //좋아요 수 조회 및 증가 로직
	    board.setLikeCount(likeCount);
	    boardDao.updateBoardLikeCount(board);
	    
	    //좋아요 업데이트 후 다시 조회하여 업데이트가 정상적으로 이루어졌는지 확인
	    int updateLikeCount = boardDao.selectBoardTotalLikeCount(boardNo);
	    
	    return updateLikeCount;
	}
	
	@Override
	public int decrementBoardLikeCount(int boardNo) {
		
		//게시글의 총 좋아요 수 확인 (count)
	    int likeCount = boardDao.selectBoardTotalLikeCount(boardNo);
	    likeCount--;

	    Board board = new Board();
	    board.setBoardNo(boardNo);
	    
	    //좋아요 수 조회 및 감소 로직
	    board.setLikeCount(likeCount);
	    boardDao.updateBoardLikeCount(board);

	    //좋아요 업데이트 후 다시 조회하여 업데이트가 정상적으로 이루어졌는지 확인
	    int updateLikeCount = boardDao.selectBoardTotalLikeCount(boardNo);

	    return updateLikeCount;
	}
	
	@Override
	public boolean viewCheckLike(HttpSession session, Board viewBoard) {
		logger.info("ServiceImpl - viewCheckLike()  ⭐도착⭐ {}");
		
		Likes like = new Likes();
		like.setUserNo((int)session.getAttribute("userNo"));
		like.setBoardNo(viewBoard.getBoardNo());
		
		int result = boardDao.selectByViewBoardLike(like);
		logger.info("result 결과 값 {}",result);
		
		if(result <= 0) {
			return false;
		} else if(result > 0) {
			return true;
		}
		return false;
	}
	
	 
	@Override
	public List<Comments> viewComment(Comments comments) {
		return boardDao.selectComment(comments);
	}
	
	@Override
	public void writeComment(Comments comments) {
		boardDao.insertComment(comments);
	}
	
	@Override
	public void updateComment(Comments comments) {
		boardDao.updateComment(comments);
	}
	
	@Override
	public void deleteComment(Comments comments) {
		boardDao.deleteComment(comments);
	}
	
	@Override
	public void deleteCheckBoard(int[] check) {
		//보현작성부분
		for(int i=0; i<check.length; i++ ) {
			Board board = new Board();
			board.setBoardNo(check[i]);
			boardDao.deleteCommentAll(board);
			boardDao.deleteFile(board);
			boardDao.delete(board);
		}
		
	}


}
