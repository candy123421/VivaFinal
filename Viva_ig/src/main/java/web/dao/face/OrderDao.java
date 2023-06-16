package web.dao.face;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.dto.Users;

public interface OrderDao {

	/**
	 * 음원소스 번호를 가지고 요청된 파일 정보를 반환
	 * 
	 * @param source - 요청된 음원소스 번호
	 * @return - 요청된 파일 정보
	 */
	public SourceFileInfo selectSourceFileBysourceNo(int source);

	/**
	 * 사용자 번호, 음원소스 번호를 이용해 
	 * 현재 사용자가 음원소스를 가지고 있는 지 확인한다
	 * 
	 * @param userNo
	 * @param sourceNo
	 * @return
	 */
	public int selectSourceChkByUsernoSourceNo(MySource source);
  
	/**
	 * 사용자의 모든 크레딧 카테고리별 합계를 가져온다
	 * 
	 * @param userNo - 크레딧 조회 대상 사용자
	 * @return - 충전, 지출, 수입, 환전의 크레딧 정보 배열
	 */
	public int[] selectCreditByUserNo(int userNo);
	
	/**
	 * 나의음원정보 TB에 기입을 위해
	 * 구매하려는 음원 정보를 가져온다
	 * 
	 * @param sourceNo - 구매하려는 음원소스정보
	 * @return - 구매음원소스정보 전체
	 */
	public Source selectSourceBySourceNo(int sourceNo);

	/**
	 * 사용자가 구매한 음원 정보를 MySource(내가가진음원소스) TB
	 * 에 추가한다
	 * 
	 * @param source - 사용자가 구매한 음원정보
	 */
	public void insertMySource(MySource source);

	/**
	 * 사용자가 다운르도 한 내역을 SourceDown TB에 추가한다
	 * 
	 * @param down - 음원소스 다운로드 정보
	 */
	public void insertSourceDown(SourceDown down);

	/**
	 * 사용자가 구매한 음원소스에 대한 지출을 기록한다
	 * 
	 * @param pay - 지출된 크레딧 정보
	 */
	public void insertCreditPay(Credit pay);

	/**
	 * 사용자가 구매한 음원소스 크레딧을 
	 * 업로더에게 수입으로 기록한다
	 * 
	 * @param income - 업로더에게 들어가는 크레딧 정보
	 */
	public void insertCreditIncome(Credit income);

	/**
	 * 구매(다운로드)실패 시 같은 장르의 상세 페이지 이동을 위한
	 * 음원소스의 장르 조회
	 *
	 * @param tagNo - 구매(다운로드) 실패 한 음원의 음원소스번호
	 * @return - 음원 소스 전체 정보
	 */
	public Source selectSource(int sourceNo);

	/**
	 * 음원소스번호에 맞는 태그 조회
	 * @param tagNo - 태그 번호
	 * @return
	 */
	public Tag selectTagBySourceNo(int tagNo);
	
	/**
	 * 회원자격 확인 중, userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param userNo
	 * @return 크레딧 총계 구하기
	 */
	public int selectCreditAcc(Users userNo);

	/**
	 * 장바구니 페이지가 아닌 다른 곳에서 구매(다운로드)를 할 때
	 * 기존 장바구니에 해당 음원소스가 담겨있는 지 조회한다
	 * 
	 * @param cart - 조회하려는 장바구니 정보
	 * @return 0 = 장바구니에 없음, 1 = 장바구니에 있음
	 */
	public int selectCartBySourceNoUserNo(Cart cart);

	/**
	 * 장바구니 페이지가 아닌 다른 곳에서 구매(다운로드)를 할 때
	 * 해당 음원소스가 기존 장바구니에 있는 경우 삭제한다
	 * @param cart - 삭제하려는 장바구니 정보
	 */
	public void deleteCartBySourceNoUserNo(Cart cart);


}
