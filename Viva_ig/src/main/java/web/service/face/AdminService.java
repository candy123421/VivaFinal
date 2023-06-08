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
	 * QnA List
	 * @param paging
	 * @return
	 */
	public List<UserQuestion> qnalist();

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
	











}
