package web.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.dao.face.CartDao;
import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.Users;
import web.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CartDao cartDao;
	
//======================================================================================================
	@Override
	public List<Map<String,Object>> getCartList(Cart userNo) {
		logger.info("getList()");
		  
		  
		return cartDao.selectCartByUserno(userNo);
	}
	
//======================================================================================================
	@Override
	public boolean deleteCartItem(Cart cartNo) {
		logger.info("deleteCartItem()");
		
		
		return cartDao.deleteCartByCartNo(cartNo);
	}
	
//======================================================================================================
	@Override
	public boolean addCartItem(Cart add) {
		logger.info("addCartItem()");
		
		//장바구니 항목 중복 검사하기
		int res = 0;
		res = cartDao.selectDuplicatedCartByUserNo(add);
		logger.info("중복여부 : {}", res);
		
		if(res==0) {
			logger.info("중복아님 :{}", res);
			cartDao.insertCartItem(add);
			logger.info("장바구니 담았숩니당");
			return true;
		}
		//중복일 경우... false 만이 존재한다.
		logger.info("중복이다 : {}", res);
		return false;
	}
	
//======================================================================================================
	//여기서 int 배열을 하나씩 꺼내어 userNo과 짝지어준다.
	@Override
	public void addPack(int userNo, int[] source) throws Exception {
		logger.info("addPack()");
		logger.info("userNo:{}", userNo);
	    logger.info("source[]: {}", source);
	    
		//성공적으로 끝날지에 대한 결과값
		int result = 0;
		Cart cart = new Cart();
		
		//배열로 담아온 source를 하나씩 꺼내어 Cart TB에 set 해주기
		//추후, 세션 종료 여부를 위해 if 문으로 걸러주는거임. 
		if(cart !=null) {

			for(int s : source) {
				
				//int형 배열로 받아온 sourceNo값을 하나씩 꺼내어 cart DTO에 set해준다.
				cart.setSourceNo(s);
				cart.setUserNo(userNo);
				logger.info("잘 담김? :{}", cart );
				
				//메소드를 반복해준다. (foreach문 밖을 나가면, 메소드는 반복되지 않음)
				cartDao.insertPack(cart);
			}
			logger.info("insertPack 성공");
			result = 1;
		}
		logger.info("pack 장바구니 추가 성공!");
	}
//======================================================================================================
	
	//음원 소스의 총계를 전역변수로 지정해서 다른 메소드에서도 쓸수 있게 선언했다.
	int price = 0;
//	private Credit credit;
	
	@Override
	public boolean chkCreditAcc(int user, int[] cart) {
		logger.info("chkCreditAcc()");
		
		//회원 크레딧 잔액 구하기 (null 일 경우 0 으로 반환)
		int res = 0; 
		res = cartDao.selectCreditAcc(user);
		logger.info("credit rest : {}", res);
		
		//비교대상 : 구매할 음원의 총계 select 하기 
		//(null 일 경우(source가 삭제되거나 유효하지 못한 경우가 됐을때) 0 으로 반환)
		price = cartDao.selectSourceAmount(cart);
		logger.info("total sourceAmount : {}", price);
		
		//sourceNo 이 없는 경우 null 은 0 이 뜨므로 아래 코드가 검증이 안되는 경우가 생김.
		//sourceNo 여러개가 넘어왔을때, 각 sourceNo의 유효성을 검증하는 코드를 하나 써놔야함.
		
		
		//크레딧잔액 ><= 비교대상 크고 작기에 대한 결과 구하기
		if(res>0 && res>price) {
			logger.info("1. 금액 비교 가능&구매항목보다 잔고가 있을때");
			return true;
			
		} else if (res>0 && res==price) {
			logger.info("2. 금액 비교 가능&구매항목에 딱 맞게 잔고가 있을때");
			return true;

		} else {
			logger.info("3. 크레딧 잔고 부족 or 소스 구매 불가");
			return false;
		}
	}
	
  @Transactional
  @Override
	public boolean purchaseCartItem(int user, int[] cart) {
		logger.info("purchaseCartItem()");
    
		//1. 구매자 크레딧 지출하기
		//크레딧DTO 초기화
		Credit credit = new Credit();
		//지출내역 만들 회원, 금액 설정
		credit.setUserNo(user);
		//지출 카테고리 = 2번
		credit.setDealCategory(2);
		//위에 메소드에서 이미 전역변수 price에 담아놓은 값을 들고왔다. 
		credit.setAmount(price);
		
		logger.info("지출 내용 : {}", credit);
  
		cartDao.expenditureCredit(credit);
		logger.info("크레딧 삭감");

		//2. 장바구니에서 해당 항목 삭제하기 - int[] 그대로 들고가서 진행하기
		cartDao.deletePurchasedCartItem(cart);
		logger.info("Cart 구매항목 삭제 : {}", cart);
		
		
		//3. 음원 다운로드 정보 생성하기
		//parameterType 을 두개를 쓸 수 없으므로, 여기서 int[] 배열을 하나씩 꺼내어 넣어주는수밖에 없다?!...ㅠㅠ
		SourceDown downSource = new SourceDown();	//소스 자체의 다운로드 정보임
		downSource.setUserNo(user);	//다운받은 사람의 정보
		
		Source source = new Source();	//음원 소스 개개별의 정보임
		
		MySource mySourceList = new MySource();	//내가 다운받은 음원목록임
		mySourceList.setUserNo(user);	//누구의 목록인지를
		
			//배열로 담아온 source를 하나씩 꺼내어 SourceDown TB에 set 해주기
			if(downSource !=null) {

				for(int i : cart) {
					
					//3-1. SourceDown 에 다운로드 정보 추가해주기
					downSource.setSourceNo(i);
					logger.info("userNo, sourceNo 담김 :{}", downSource );
					cartDao.addSourceToDownList(downSource);
					
					//4. 나의 음원 구매내역에 추가하기 (MySource)
					
					//4-1. 우선 음원번호로 음원 정보 부르기 (Source)
					source = cartDao.selectSourceBySourceNo(i);
					logger.info("여기까지 음원 정보 불러오기 완료");
					
					//4-2. 조회된 음원정보를 내 음원목록에 추가해주기 (MySource) 
					mySourceList.setSourceNo(i);
					try {
						mySourceList.setBpm(source.getBpm());
						mySourceList.setKey(source.getKey());  
						mySourceList.setPackNo(source.getPackNo());
						mySourceList.setSourceName(source.getSourceName());
						mySourceList.setTagNo(source.getTagNo());
					} catch (NullPointerException e) {
						e.printStackTrace();
					}
					logger.info("내 목록에 추가될 음원 {}", mySourceList);
					
					
					//4-3. 내 음원목록에 추가하기 메소드
					cartDao.insertMySource(mySourceList);
					logger.info("내 음원 목록에 추가 완료");
					
					
					//5. 사운드 디자이너에게 수익금 분배
					//구매할 음원 총계 - 10% = 업로더 수입 크레딧 내역
//					int revenue = (int) (price * 0.9);
					int revenue = source.getSourcePrice();
					revenue = (int) (revenue * 0.9);
					logger.info("업로더에게 전달될 수입 : {}", revenue);
					
					Credit uploaderInc = new Credit();
					//업로더의 회원번호 : 구매할 sourceNo의 Source Tb에 있는 user_no 으로 검색
					uploaderInc.setUserNo(source.getUserNo());
					uploaderInc.setDealCategory(3);
					uploaderInc.setAmount(revenue);
					
					cartDao.uploaderIncomeCredit(uploaderInc);
					logger.info("========여기까지 한차례 정보 업데이트 완료=====");
					
				}
			}
			
			logger.info("트랜잭션 5단계 거쳤는데.. 과연 결과는?");
		
		return true;
  }

}
