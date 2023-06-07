package web.service.face;

import java.util.List;

import web.dto.Credit;
import web.dto.Users;

public interface CreditService {

	/**
	 * 회원의 크레딧 사용 내역 전체 조회하기
	 * 
	 * @param userNo - userNo
	 * @return Credit 내역 전체
	 */
	public List<Credit> getCreditList(Credit userNo);

	/**
	 * userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param userNo
	 * @return 크레딧 총계
	 */
	public int selectCreditAcc(Credit userNo);

	/** 회원 등급 확인하기
	 * 
	 * @param user - userNo
	 * @return (0:일반회원, 1 : 업로더)
	 */
	public String chkUserGrade(Users user);


}
