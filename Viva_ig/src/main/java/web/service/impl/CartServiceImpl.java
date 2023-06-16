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
import web.dto.SourceFileInfo;
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
	//음원페이지에서 장바구니로 담기 전에, 구매이력 먼저 확인하여 장바구니 접근 제한하기
	@Override
	public int checkMySource(int sourceNo, int userNo) {
		logger.info("checkMySource ()");
		logger.info("매개변수 확인 : {}, {}", sourceNo, userNo);
		
		return cartDao.selectMySourceByUserNoAndSourceNo(sourceNo, userNo);
	}
	
	
	
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
//=================== get Pack ===================================================
	
	//팩 페이지에서 장바구니로 담기 전에, 구매이력 먼저 확인하여 장바구니 접근 제한하기
	// + /cart/buy 했을 때 중복 검사하기
	@Override
	public int checkMySourceToPack(int[] source, int userNo) {
		logger.info("checkMySourceToPack()");
		
		//중복되는 행의 수
		int sum = 0;
		
		//mapper.xml 에서 parameterType 에 int[] 와 int 를 다 넣는 방법을 찾을 수가 없기에
		//할수 없이 서비스 임플에서 for문을 돌려 찾아볼까한다..ㅠ
		MySource mySource = new MySource();
		mySource.setUserNo(userNo);
		
		for(int i=0; i<source.length; i++) {
			
			mySource.setSourceNo(source[i]);
			int row = cartDao.selectMySourceByUserNoAndPackSource(mySource);
			logger.info("row는 0또는 1이 나와야해! {} ", row);
			sum += row;
		}
		logger.info("팩 중 구매이력 수: {} ", sum);
		
		return sum;
	}
	
	//getPack 을 한 뒤, 팩 전체 구매이력이 있는 팩을 제외하고, 일부 구매나 구매 이력 없는 팩에 한하여
	//장바구니 중복 검사 진행 후, 장바구니에 집어넣을거다.
	@Override
	public boolean addSomePack(int userNo, int[] source) {
		logger.info("addSomePack()");
		
		//******************** get Pack 의 규칙 *****************************
		// B. 팩 일부 구매했을 경우 + 팩 구매 이력 없을 경우   
			// B-a. 나머지 팩-음원 전체 장바구니 있을 경우  => (서비스에서 false 반환) -> 반환 값 없음.
			// B-b. 나머지 팩-음원 일부 장바구니 있을 경우  => true 반환
			// B-c. 나머지 팩-음원 전체 장바구니 없을 경우 	=> true 반환
		//*******************************************************************
		
		//B. Cart DTO 를 통해 중복 검사하기
		//중복되는 행의 수
		int sum = 0;
		
		Cart myCart = new Cart();
		myCart.setUserNo(userNo);
		
		for(int i = 0; i<source.length; i++) {
			
			myCart.setSourceNo(source[i]);
			int row = cartDao.selectDuplicatedCartByUserNo(myCart);
			
			sum += row;
			
				//row 가 0 인 경우 -> 
				//B-b, B-c : 장바구니에 insert 한다.
				if (row >0 ) {
					logger.info("이미 장바구니에 담긴 항목은 다시 넣을 수 없다 : {}", myCart);
				
				} else {
					logger.info("장바구니에 집어넣기");
					
					cartDao.insertCartItem(myCart);
					logger.info("장바구니 담았숩니당 : {} ", myCart);
				}
				// if 문 END : 이미 담겨있든 새로 담든 어쨌든 장바구니에 존재할 것이다.
			
		}
		logger.info("팩 중 장바구니 중복 수: {} ", sum);
		
		if(sum == source.length) {
			
			logger.info("이 팩 전체는 원래부터 장바구니에 있었다.");
			return false;
		}
		
		//어쨌든 전부 원래부터 장바구니에 있는 경우 제외하고, 어쨌든 장바구니에 모두 존재할 것이기에 true 값 반환!
		return true;
	}

//======================================================================================================
	
	//음원 소스의 총계를 전역변수로 지정해서 다른 메소드에서도 쓸수 있게 선언했다.
	int price = 0;
//	private Credit credit;
	
	
	//장바구니에 이미 담겨있는 항목 중 구매이력있음을 확인하고 지워줌..
	@Override
	public void duplicatedItemToTrash(int[] cart, int user) {
		logger.info("duplicatedItemToTrash ()");
		
		Cart delete = new Cart();
		delete.setUserNo(user);
		
		for(int i : cart) {
			delete.setSourceNo(i);
			
			cartDao.deleteCartByUserNoAndSourceNo(delete);
			logger.info("싹 지움");
		}
	}
	
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
    
		//0. MySource TB에서 구매이력 확인하기
		//
		
		
		
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
  
	@Override
	public SourceFileInfo getFile(int[] sourceNo) {
		logger.info("getFile()");
		return cartDao.selectSourceFileBysourceNo(sourceNo);
	}

}
