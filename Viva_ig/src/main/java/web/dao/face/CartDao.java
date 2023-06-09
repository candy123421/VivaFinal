package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.Users;

public interface CartDao {

	/**
	 * userno 을 이용하여 cart 전체 조회하기
	 * 
	 * @param userno
	 * @return cart 항목 전체 
	 */
	public List<Map<String, Object>> selectCartByUserno(Cart userNo);

//=========================================================================	
	/**
	 * cartNo을 이용하여 cart 항목 삭제하기
	 * 
	 * @param cartNo, userNo
	 * @return 성공하면 true, 아니면 false
	 */
	public boolean deleteCartByCartNo(Cart cartNo);

//=========================================================================	
	/**
	 * cart의 중복여부 확인하기. 
	 * 
	 * @param add - userNo, sourceNo
	 * @return 중복이면 1, 아니면 0
	 */
	public int selectDuplicatedCartByUserNo(Cart add);

	/**
	 * 중복 결과 후, 중복이 아닐때는 장바구니 담기 진행하기
	 * 
	 * @param add - userNo, sourceNo
	 */
	public void insertCartItem(Cart add);

//=========================================================================	
	/**
	 * 회원자격 확인 중, userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param user
	 * @return 크레딧 총계 구하기
	 */
	public int selectCreditAcc(int user);
	
	/**
	 * 회원자격 확인 중, 선택한 sourceNo 을 통해 sourcePrice 합계 알아내기
	 * 
	 * @param cart
	 * @return 구매원하는 source 총계 
	 */
	public int selectSourceAmount(int[] cart);
	
	/**
	 * credit TB에 삽입할 정보(회원번호, 금액)를 이용하여 내역 insert 하기
	 * 트랜잭션 중, credit TB에 삽입할 정보(회원번호, 금액)를 이용하여 내역 insert 하기
	 * 
	 * @param credit - userNo, amount
	 */
	public void expenditureCredit(Credit credit);

	/**
	 * 트랜잭션 중, Cart TB에서 해당 cartNo 항목을 delete 하기
	 * 
	 * @param cartNo - cartNo
	 * 작성자 : 지선
	 */
	public void deletePurchasedCartItem(Cart cartNo);

	/**
	 * 트랜잭션 중, SourceDown TB 에 해당 source 항목 다운로드 내역을 insert 하기
	 * 
	 * @param downSource - userNo, sourceNo
	 * 작성자 : 지선
	 */
	public void addSourceToDownList(SourceDown downSource);

	/**
	 * 트랜잭션 중, 나의음원정보 TB에 기입을 위해
	 * 구매하려는 음원 정보를 가져온다
	 * 
	 * @param sourceNo - 구매하려는 음원소스정보
	 * @return - 구매음원소스정보 전체
	 */
	public Source selectSourceBySourceNo(int sourceNo);
	
	/**
	 * 트랜잭션 중, 사용자가 구매한 음원 정보를 MySource(내가가진음원소스) TB
	 * 에 추가한다
	 * 
	 * @param source - 사용자가 구매한 음원정보
	 */
	public void insertMySource(MySource source);
	
	/**
	 * 트랜잭션 중, Credit TB에 구매할 음원의 업로더의 수익금 내역 insert 하기
	 * 
	 * @param uploaderInc - userNo, category, amount
	 */
	public void uploaderIncomeCredit(Credit uploaderInc);

	/**
	 * pack 의 source 를 cart TB에 삽입한다.
	 * 
	 * @param cart - userNo, sourceNo
	 */
	public void insertPack(Cart cart);

}
