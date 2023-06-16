package web.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	 * 전체 QnA 수를 조회한다
	 * @return 총 QnA 수
	 */
	public int selectQnACnt();
	
	/**
	 * qProcess가 답변대기일때 , 답변완료일때의 count수를 구하기
	 * @param qProcess
	 * @return
	 */
	public int selectQnACnt(String qProcess);


	/**
	 * 페이징을 적용하여 QnA 목록 조회
	 * 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param Process - 답변대기,답변완료 따로검색하도록 
	 * @return 페이징이 적용된 QnA 목록
	 */
	public List<UserQuestion> selectQnAList(@Param(value = "paging") Paging paging,@Param(value = "qProcess") String qProcess);
	
	/**
	 * keyword로 검색한것만 나오게하기 
	 * @param keyword - 검색 키워드
	 * @return
	 */
	public List<UserQuestion> selectQnAListByKeyword(@Param(value = "paging")Paging paging,@Param(value = "keyword") String keyword);


	/**
	 * list 불러올때 세션에서 가져온 userno인 애들만 불러오기
	 * @param attribute
	 * @return
	 */
	public List<UserQuestion> selectUserQnAList(int attribute);
	
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

	/**
	 * 전체 회원 수를 조회한다
	 * @return 총 회원수
	 */
	public int selectUserCnt();

	/**
	 * 키워드가 포함된 회원수 조회
	 * @param keyword
	 * @return
	 */
	public int selectUserCnt(String keyword);
	
	/**
	 * 페이징을 적용하여 회원 목록 조회 
	 * 	paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Users> selectUserList(Paging paging);
	
	/**
	 * check된 애들 Grade update 시키기 
	 * @param users
	 */
	public void updateUserGrade(Users users);

	/**
	 * keyword로 검색된 애들 보여주는 리스트
	 * @param keyword
	 * @return 
	 */
	public List<Users> selectUserListByKeyword(@Param(value = "paging")Paging paging,@Param(value="keyword") String keyword);













	
	




}
