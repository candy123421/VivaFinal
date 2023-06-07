package web.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	
	@Override
	public void deleteDeal(Credit deal) {
		logger.info("deleteDeal()");
		
		creditDao.deleteDeal(deal);
		
	}
	
	@Override
	public void addPurchaseInfo(JSONObject jsonObject) {
		logger.info("addPurchaseInfo()");
		
		//JSONObject 는 mybatis 에서 인식이 안되므로, 
		//HashMap 으로 지정해서 보내줘야한다!
		//null로 초기화를 해줘야하는게 맞을지 모르겠다.
		Map<String, Object> tossData = null;
		
	    try {
	    	tossData = new ObjectMapper().readValue(jsonObject.toString(), Map.class);
	     } catch (JsonParseException e) {
	         e.printStackTrace();
	     } catch (JsonMappingException e) {
	         e.printStackTrace();
	     } catch (IOException e) {
	         e.printStackTrace();
	     }

	    //잘 담겨진걸 알 수 있다.
	    logger.info("{}",tossData);
	    
		creditDao.insertTossData(tossData);
		
		
	}
}
