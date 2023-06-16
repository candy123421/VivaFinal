package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.dao.face.OrderDao;
import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.OrderService;

@Service
public class OrderServiceImpl implements OrderService { 
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired OrderDao orderDao;

	//채원의 코드
	@Override
	public SourceFileInfo getFile(int sourceNo) {
		return orderDao.selectSourceFileBysourceNo(sourceNo);
	}
	
	@Override
	public boolean checkSource(MySource source, Users user) {
		
		logger.info("sourceNo : {}", source);
		source.setUserNo(user.getUserNo());
		
		int chk = orderDao.selectSourceChkByUsernoSourceNo(source);
		
		logger.info("chk 숫자 확인 : {}", chk);
		
		if (chk > 0) {return true;} 
		
		return false;
	
  }
  
	@Override
	public void intoMySource(MySource source) {
		
		//음원소스번호, 회원번호를 이용한다
		Source buySource = orderDao.selectSourceBySourceNo(source.getSourceNo());
		
		try {
			source.setBpm(buySource.getBpm());
			source.setKey(buySource.getKey());
			source.setPackNo(buySource.getPackNo());
			source.setSourceName(buySource.getSourceName());
			source.setTagNo(buySource.getTagNo());
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		logger.info("사려는 음원 {}", source);
		
		orderDao.insertMySource(source);
		
	}

	@Override
	public void intoSourceDown(MySource source) {
		
		SourceDown down = new SourceDown();
		down.setSourceNo(source.getSourceNo());
		down.setUserNo(source.getUserNo());
		
		logger.info("다운로드 정보 : {}", down);
	
		orderDao.insertSourceDown(down);
		
	}

	@Override
	public void intoCredit(MySource source) {
		
		// 지출 크레딧 삽입
		Credit pay = new Credit();
		pay.setUserNo(source.getUserNo());
		pay.setAmount(30);
		pay.setDealCategory(2);
		
		orderDao.insertCreditPay(pay);
		logger.info("pay : {}", pay);
		
		// 수입 크레딧 삽입
		Credit income = new Credit();
		
		// 수입 업로더 정보 조회
		Source insource = orderDao.selectSourceBySourceNo(source.getSourceNo());
		
		logger.info("+++ 수입 업로더 정보 확인 : {} ", insource);
		
		income.setAmount(27);
		income.setDealCategory(3);
		
		// 업로드한 회원 입력
		income.setUserNo(insource.getUserNo());
		
		orderDao.insertCreditIncome(income);
		logger.info("income : {}", income);
	}

	@Override
	public Tag getGenre(int source) {
		
		Source get = orderDao.selectSource(source);
		
		Tag tag = orderDao.selectTagBySourceNo(get.getTagNo());
		
		return tag;
	}

	@Override
	public Tag getInstrument(int sourceNo) {
		
		Source get = orderDao.selectSource(sourceNo);
		
		Tag tag = orderDao.selectTagBySourceNo(get.getTagNo());
		
		return tag;
	}
  
  @Override
	public boolean checkCredit(Users userNo) {
		
		logger.info("userNo 확인 {}",userNo);
		
		int credit = orderDao.selectCreditAcc(userNo);
		
		logger.info("credit : {}", credit);

		if( credit > 30 ) {
			return true;
		}
		return false;
	}

	@Override
	public void checkCart(MySource source, Users user) {
		
		logger.info("구매(다운) 요청 확인 {}, {}", source, user);
		
		Cart cart = new Cart();
		cart.setUserNo(user.getUserNo());
		cart.setSourceNo(source.getSourceNo());
		
		// 조회 한 후 1이상인 경우 모두 삭제
		int cnt = orderDao.selectCartBySourceNoUserNo(cart);
		
		// 조회된 행이 있을 경우 삭제 아니면 Return 종료
		if( cnt > 0 ) {
			orderDao.deleteCartBySourceNoUserNo(cart);
		} else if ( cnt <= 0 ) {
			return;
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
