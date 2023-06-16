package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import web.dto.Cart;
import web.dto.Source;
import web.dto.SourceFileInfo;
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
	 * 회원번호와 음원페이지의 음원소스 번호를 통해 나의 구매이력 확인하기
	 * 
	 * @param sourceNo
	 * @param userNo
	 * @return count (*) 수
	 */
	public int checkMySource(int sourceNo, int userNo);
	
	
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
	 * @param user - userNo
	 * @param cart - sourceNo
	 * @return 구매 가능 여부
	 */
	public boolean chkCreditAcc(int user, int[] cart);
	
	/**
	 * 크레딧 지출, 장바구니항목 삭제, 다운로드 정보 생성, 내 음원내역 추가, 업로더의 크레딧 수입 생성
	 * 트랜잭션으로 진행할 생각
	 * 
	 * @param user - 본인 회원번호
	 * @param cart - 선택한 음원 항목
	 * @return 구매 완료 여부
	 */
	public boolean purchaseCartItem(int user, int[] cart);

	/**
	 * 다운로드 구현 중....... int 배열로 받아온 sourceNo을 통해 fileinfo를 알아내어 반환하기
	 * 
	 * @param sourceNo
	 * @return fileinfo
	 */
	public SourceFileInfo getFile(int[] sourceNo);

	/**
	 * sourceNo이 담긴 int[] 과 userno을 통해서 mysource TB에서 구매이력 확인하기
	 * 
	 * @param source - 팩 단위로 묶인 sourceNo
	 * @param userNo - 회원번호
	 * @return 구매이력이 있는 소스의 수
	 */
	public int checkMySourceToPack(int[] source, int userNo);

	/**
	 * 소스 일부만 구매했거나, 구매한적 없는 팩에 한해서, 장바구니 중복 검사 후에 집어넣으려고 함.
	 * 
	 * @param userNo
	 * @param source - sourceNo []
	 * @return 어쨌든 true 임..
	 */
	public boolean addSomePack(int userNo, int[] source);

	/**
	 * 장바구니에서 구매하기를 눌렀을때, 혹시 이전에 구매이력이 있다면 그냥 장바구니 TB에서 지워주기
	 * 
	 * @param cart -sourceNo []
	 * @param user - userNo
	 */
	public void duplicatedItemToTrash(int[] cart, int user);






}
