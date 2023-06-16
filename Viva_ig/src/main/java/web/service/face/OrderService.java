package web.service.face;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.dto.Users;

public interface OrderService {

	//음원페이지에서 진행하는 메소드
	/**
	 * sourceNo에 따른 음원소스 파일 정보를 가져온다
	 * 
	 * 
	 * @param sourceNo - 요청 음원소스번호
	 * @return - 요청된 음원소스 파일 정보
	 * 작성자 : 채원
	 */
	public SourceFileInfo getFile(int sourceNo);

	/**
	 * 사용자가 다운로드한 이력이 있는지 확인한다
	 * @param user 
	 * 
	 * @param userno - 사용자 정보
	 * @param sourceNo - 사용자가 다운로드할 음원소스번호
	 * @return - true : 가지고 있음, false : 가지고 있지 않음
	 * 작성자 : 채원
	 */
	public boolean checkSource(MySource source, Users user);

	/**
	 * 음원소스를 구매할 크레딧이 있는지 검사
	 * 
	 * @param user - 구매 요청이 온 회원
	 * @return - true: 구매가능, false: 구매불가
	 * 작성자 : 채원
	 */
	public boolean checkCredit(Users user);


	/**
	 * 구매(다운로드) 음원에 대해 나의 음원 소스 테이블에 정보를 추가한다
	 * 
	 * @param source - 음원소스번호, 사용자번호가 담긴 객체
	 */
	public void intoMySource(MySource source);

	/**
	 * 구매(다운로드) 음원에 대해 음원소스 다운로드 정보 TB에 이력을 추가한다
	 * @param source - 구매(다운로드)된 음원
	 */
	public void intoSourceDown(MySource source);

	/**
	 * 구매(다운로드)로 인한 크레딧 지출, 수입의 기록을
	 * 구매한 음원소스파일 정보를 이용해 등록한다
	 * 
	 * @param source - 구매한 음원소스파일 정보
	 */
	public void intoCredit(MySource source);

	/**
	 * 구매 실패 시 같은 장르의 음원소스페이지로 리다이렉트를 위한
	 * 장르를 조회한다
	 * @param i - 음원구매 실패한 정보
	 * @return - 구매 실패한 음원소스의 장르
	 */
	public Tag getGenre(int i);

	/**
	 * 구매 실패 시 같은 악기의 음원소스페이지로 리다이렉트를 위한
	 * 악기를 조회한다
	 * @param sourceNo - 음원구매 실패한 정보
	 * @return - 구매 실패한 음원소스의 악기
	 */
	public Tag getInstrument(int sourceNo);

	/**
	 * 장바구니 페이지가 아닌 다른 곳에서 구매(다운로드)를 했을 때
	 * 기존 장바구니에 해당 음원소스가 담겨있는 경우 삭제한다
	 * 
	 * @param source - 구매(다운)할 음원소스 정보
	 * @param user - 구매할 사용자 정보
	 */
	public void checkCart(MySource source, Users user);



}
