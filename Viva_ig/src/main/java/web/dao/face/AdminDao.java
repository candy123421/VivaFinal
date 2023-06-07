package web.dao.face;

import java.util.List;

import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.UserQuestion;
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
	 * QnA 상세정보 view
	 * @param userQuestion
	 * @return
	 */
	public UserQuestion selectQnAView(UserQuestion userQuestion);

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
	
	
	




}
