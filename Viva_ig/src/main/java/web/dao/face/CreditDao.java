package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Credit;
import web.dto.ExchangeInfo;
import web.dto.TossApi;
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
	 * 카테고리별 크레딧 내역
	 * 
	 * @param userNo - userNo, dealCategory
	 * @return 필터링된 Credit 테이블 전체내역
	 */
	public List<Credit> selectCategoryList(Credit userNo);

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
	 * @return 성공시 true
	 */
	public boolean deleteDeal(Credit deal);

	/**
	 * seq.nextval()을 통해서 dealNo 미리 select해오기
	 * 
	 * @return deal_no
	 */
	public int selectNextDealNo();

	/**
	 * 트랜잭션 중, 
	 * 크레딧 tb에 정보 insert하기
	 * 
	 * @param credit - deal_no, userNo, deal_date, deal_category, amount
	 */
	public void insertcharge(Credit credit);

	/**
	 * 트랜잭션 중, 
	 * 결제 정보를 DB에 insert하기
	 * 
	 * @param toss - 결제 정보 여러가지
	 */
	public void insertTossData(TossApi toss);

	/**
	 * 결제완료된 정보 일부 추출 
	 * 
	 * @param dealNo
	 * @return HashMap - key : credit 총계, 결제방식, 결제시간, 실제 금액
	 */
	public Map<String, Object> selectOkInfo(int dealNo);

	/**
	 * dual TB에서 시퀀스로 dealNo 받아오기!
	 * 
	 * @return dealNo 
	 */
	public int selectNextExNo();
	
	/**
	 * 환전 정보 DB에 입력하기
	 * 
	 * @param exchange - exNo, userNo, 예금주, 은행, 계좌, 금액exchange
	 */
	public void insertExchangeInfo(ExchangeInfo exchange);

	/**
	 * 환전 신청 완료된 정보 받아오기
	 * 
	 * @param exchange - exNo, userNo, 예금주, 은행, 계좌, 금액exchange, 신청시간
	 * @return ExchangeInfo DTO
	 */
	public ExchangeInfo selectExchangeInfo(ExchangeInfo exchange);

	/**
	 * 크레딧 TB에 우선 환전정보 생성하기
	 * 
	 * @param credit - dealNo, 카테고리, 액수, userNo
	 */
	public void insertExchangeCredit(Credit credit);

	/**
	 * 주문서 작성을 위해 userNo 을 이용하여 email과 회원 이름 조회하기
	 * 
	 * @param userNo
	 * @return	<Map> email, name
	 */
	public Map<String, Object> selectUserInfo(int userNo);


}
