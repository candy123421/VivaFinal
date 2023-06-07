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
	 * QnA 상세보기 view
	 * @param userQuestion
	 * @return
	 */
	public UserQuestion getQNo(UserQuestion userQuestion);

	/**
	 * 답변등록 answer post
	 * @param userQuestion
	 * @param adminAnswer
	 */
	public void answerSingUp(UserQuestion userQuestion, AdminAnswer adminAnswer,Admin admin,Users users);





}
