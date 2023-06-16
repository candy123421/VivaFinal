package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.BoardNotice;
import web.dto.UserQuestion;
import web.dto.Users;
import web.util.Paging;

public interface AdminService {

	/**
	 * admin 로그인 id , pw일치하는지 
	 * @param admin
	 * @return
	 */
	public boolean adminLogin(Admin admin);

	/**
	 * admin 번호 알아오기
	 * @param admin
	 * @return 
	 */
	public Admin getAdminNo(Admin admin);

	/**
	 * QNA 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData- curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paramData , String qProcess,String keyword);

	/**
	 * 페이징이 적용된 QnA 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param Process - 답변대기,답변완료 따로검색하도록 
	 * @return 페이징이 적용된 QnA 목록
	 */
	public List<UserQuestion> qnalist(Paging paging,String qProcess,String keyword);
	
	/**
	 * list 불러올때 세션에서 가져온 userno인 애들만 불러오기
	 * @param attribute
	 * @return
	 */
	public List<UserQuestion> userQnA(int attribute);
	
	

	/**
	 * QnA 상세보기 view  답변이 달렸을경우 답변 보여주기
	 * @param userQuestion
	 * @return
	 */
	public UserQuestion getQNo(UserQuestion userQuestion);

	/**
	 * QnA 상세보기 view 답변이 달렸을경우 답변 보여주기
	 * @param adminAnswer
	 * @return
	 */
	public AdminAnswer getANo(AdminAnswer adminAnswer);
	
	/**
	 * 세션에 있는 userno로 회원 정보 불러오기 
	 * @param users
	 */
	public Users getUserInfo(int attribute);
	
	/**
	 * userQuestion 문의 등록
	 * @param userQuestion
	 */
	public void writeQuestion(UserQuestion userQuestion);
	
	/**
	 * 세션에 있는 adminno로 admin정보 불러오기
	 * @param attribute
	 * @return
	 */
	public Admin getAdminInfo(int attribute);
	
	/**
	 * 답변등록 answer post
	 * @param userQuestion
	 * @param adminAnswer
	 */
	public void answerSingUp(UserQuestion userQuestion, AdminAnswer adminAnswer,Admin admin,Users users);


	/**
	 * userQuesction의 userno로 user정보 알아오기
	 * @param setUserNo
	 * @return
	 */
	public Users getUsersInfo(Users users);

	/**
	 * 처리상황이 답변완료인걸 int값으로 받기
	 * @param userQuestion
	 * @return
	 */
	public int getProcess(UserQuestion userQuestion);


	/**
	 * adminno로 admin id 가져오기
	 * @param admin
	 * @return
	 */
	public Admin getAdminId(Admin admin);

	/**
	 * 회원 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 객체의 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 회원 수)
	 * 
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paramData - curPage를 저장하고있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getUserPaging(Paging paramData,String keyword);

	/**
	 * 페이징이 적용될 회원 목록 조회 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Users> userlist(Paging paging,String keyword);

	/**
	 * 체크박스 여러개 선택가능
	 * @param check
	 */
	public void checkUser(int[] check);

	



	











}
