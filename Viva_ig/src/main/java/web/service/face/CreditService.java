package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import web.dto.Credit;
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
	 */
	public void deleteDeal(Credit deal);

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


}
