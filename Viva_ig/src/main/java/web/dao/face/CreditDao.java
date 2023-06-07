package web.dao.face;

import java.util.List;

import web.dto.Credit;
import web.dto.Users;

public interface CreditDao {

	/**
	 * 해당 회원의 크레딧 전체 내역 조회하기
	 * 
	 * @param userNo
	 * @return Credit 테이블 전체내역
	 */
	public List<Credit> selectAllCreditList(Credit userNo);

	/**
	 * 회원 등급 조회하기 
	 * 
	 * @param user - userNo
	 * @return (0:일반회원, 1 : 업로더)
	 */
	public String selectUserGrade(Users user);

	/**
	 * userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param userNo
	 * @return 크레딧 총계 구하기
	 */
	public int selectCreditAcc(Credit userNo);


}
