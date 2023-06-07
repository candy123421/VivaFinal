package web.dao.face;

import java.util.List;
import java.util.Map;

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

	/**
	 * 크레딧 내역 삭제 (hidden 으로 변경)
	 * 
	 * @param deal - userNo, dealNo
	 */
	public void deleteDeal(Credit deal);

	/**
	 * 결제 정보를 DB에 insert하기
	 * 
	 * @param tossData - 결제 정보 여러가지
	 */
	public void insertTossData(Map<String, Object> tossData);


}
