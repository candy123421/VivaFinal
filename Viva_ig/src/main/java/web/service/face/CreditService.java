package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import web.dto.Credit;
import web.dto.ExchangeInfo;
import web.dto.TossApi;
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
	 * 카테고리 클릭했을 때의 크레딧 내역
	 * 
	 * @param userNo - userNo
	 * @param state - "구매, 충전, 수익, 환전 " 에 대한 분류
	 * @return 해당되는 카테고리의 Credit 내역 전체
	 */
	public List<Credit> clickCategoryList(Credit userNo, String state);
	
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

	/**
	 * 크레딧 내역 삭제 (hidden 으로 변경)
	 * 
	 * @param deal - userNo, dealNo
	 * @return 성공시 true
	 */
	public boolean deleteDeal(Credit deal);

	/**
	 *  결제 정보를 DB에 insert하기
	 * 
	 * @param session - userNo
	 * @param jsonObject - 결제 정보 여러가지 
	 * @return 승인된 결제 정보
	 */
	public int addPurchaseInfo(HttpSession session, JSONObject jsonObject);

	/**
	 * 결제가 완료된 정보 
	 * 
	 * @param dealNo
	 * @return HashMap 형태의 조회된 정보
	 */
	public Map<String, Object> viewChargeOkInfo(int dealNo);

	/**
	 * 크레딧 TB에 환정 정보 생성하기
	 * 환전 정보 DB에 입력하기
	 * 
	 * @param exCredit - 크레딧 액수
	 * @param exchange - userNo, 예금주, 은행, 계좌, 금액
	 * @return 환전 정보 입력 완료된 정보 
	 */
	public ExchangeInfo addExchangeInfo(int exCredit, ExchangeInfo exchange);

	/**
	 * 주문서 작성을 위해 userNo 을 이용하여 email과 회원 이름 조회하기
	 * 
	 * @param userNo
	 * @return	<Map> email, name
	 */
	public Map<String, Object> getUserInfo(int userNo);



}
