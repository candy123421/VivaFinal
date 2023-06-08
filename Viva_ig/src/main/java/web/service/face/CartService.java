package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;
import web.dto.Source;
import web.dto.Users;

public interface CartService {

	/**
	 * userno 으로 cart 내역 조회하기
	 * 
	 * @param userno
	 * @return 장바구니 전체 내역 
	 */
	public List<Map<String, Object>> getCartList(Cart userNo);

	/**
	 * cartNo를 통해 CART TB에서 해당 항목 삭제하기
	 * 
	 * @param cartNo, userNo
	 * @return 성공 여부에 따라 true/false
	 */
	public boolean deleteCartItem(Cart cartNo);


	/**
	 * userNo, sourceNo 을 통해 장바구니 중복 검사 후 장바구니 담기
	 * 
	 * @param add - userNo, sourceNo
	 * @return 성공 : true, 실패 : false
	 */
	public boolean addCartItem(Cart add);


		
	/**
	 * userNo을 통해 크레딧 TB 의 총 계 확인하여 구매 가능여부 확인하기
	 * 
	 * @param userNo, sourceNo
	 * @return 구매 가능 여부
	 */
	public boolean chkCreditAcc(Users userNo, Source sourceNo);
	
	/**
	 * 크레딧 지출, 장바구니항목 삭제, 다운로드 정보 생성, 내 음원내역 추가, 업로더의 크레딧 수입 생성
	 * 
	 * @param userNo - 본인 회원번호
	 * @param sourceNo - 선택한 음원 항목
	 * @param cartNo - 해당 장바구니 항목
	 * @return 구매 완료 여부
	 */
	public boolean purchaseCartItem(Users userNo, Source sourceNo, Cart cartNo);

	/**
	 * 배열과 userNo 을 foreach 문을 통해 Map으로 지정해준다.
	 * 
	 * @param userNo
	 * @param source - sourceNo 배열
	 * @throws Exception 
	 */
	public void addPack(int userNo, int[] source) throws Exception;



}
