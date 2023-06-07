package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CreditDao;
import web.dto.Credit;
import web.dto.Users;
import web.service.face.CreditService;

@Service
public class CreditServiceImpl implements CreditService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CreditDao creditDao;
	
	@Override
	public List<Credit> getCreditList(Credit userNo) {
		logger.info("getCreditList()");
		
		//credit 전체 내역 뽑아오기
		return creditDao.selectAllCreditList(userNo);
	}

	@Override
	public String chkUserGrade(Users user) {
		logger.info("chkUserGrade()");
		return creditDao.selectUserGrade(user);
	}
	
	@Override
	public int selectCreditAcc(Credit userNo) {
		logger.info("selectCreditAcc()");
		
		return creditDao.selectCreditAcc(userNo);
	}
}
