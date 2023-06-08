package web.dao.face;

import java.util.List;

import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.UserQuestion;
import web.dto.Users;
import web.util.Paging;

public interface AdminDao {

	/**
	 * admin-id와 pw가 일치하는지 count로 알아내기
	 * @param admin
	 * @return
	 */
	public int selectCntByAdminIdPw(Admin admin);

	/**
	 * adminNo 알아오기
	 * @param admin
	 * @return 
	 */
	public Admin selectAdminNo(Admin admin);

	/**
	 * QnA List 
	 * @return
	 */
	public List<UserQuestion> selectQnAList();

	/**
	 * QnA 상세정보 view Question
	 * @param userQuestion
	 * @return
	 */
	public UserQuestion selectQnAViewQuestion(UserQuestion userQuestion);

	/**
	 * QnA 상세정보 view Answer
	 * @param adminAnswer
	 * @return
	 */
	public AdminAnswer selectQnAViewAnswer(AdminAnswer adminAnswer);
	
	/**
	 * 유저 번호로 유저 정보 가져오기
	 * @param users
	 */
	public Users selectUserInfo(int attribute);
	
	/**
	 * 질문등록
	 * @param userQuestion
	 */
	public void insertUserQuestion(UserQuestion userQuestion);
	
	/**
	 * adminno로 admin정보 가져오기
	 * @param attribute
	 * @return
	 */
	public Admin selectAdminInfo(int attribute);
	
	/**
	 * 답변등록
	 * @param adminAnswer
	 */
	public void insertAdminAnswer(AdminAnswer adminAnswer);

	/**
	 * 답변등록시 Process 처리상황 O로 변경
	 * @param userQuestion
	 */
	public void updateQProcess(UserQuestion userQuestion);
	
	/**
	 * userQuesction의 userno로 user정보 알아오기
	 * @param users
	 * @return
	 */
	public Users selectUsersInfo(Users users);

	/**
	 * 처리상황이 
	 * 답변완료 -1
	 * 답변대기 -0 
	 * @param userQuestion
	 * @return
	 */
	public int selectQProcess(UserQuestion userQuestion);

	/**
	 * adminno로 admin닉 알아오기
	 * @param admin
	 * @return
	 */
	public Admin selectAdminNick(Admin admin);





	
	




}
