package web.service.impl;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.UsersController;
import web.dao.face.UsersDao;
import web.dto.Users;
import web.service.face.UsersService;


@Service
public class UsersServiceImpl implements UsersService {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	@Autowired UsersDao usersDao;
	
	@Override
	public boolean login(Users users) {
		int loginChk = usersDao.selectCntMember(users);
		
		if( loginChk > 0 )	return true;
		return false;
	}

	@Override
	public String getNick(Users users) {
		return usersDao.selectNickByMember(users);
	}
	
	@Override
	public boolean join(Users users) {
		
		//중복된 ID인지 확인
		if ( usersDao.selectCntById(users) > 0 ) {
			return false;
		}
		
		//회원 가입(삽입)
		usersDao.insert(users);
		
		//회원가입 결과 확인
		if( usersDao.selectCntById(users) > 0 ) {
			return true;
		}
		
		return false;
	}
	
	@Override
		public Users getNo(Users users) {
			return usersDao.getUserNo(users);
		}
	
	@Override
	public boolean getkakaoId(Users users) {

		//중복된 kakaoId인지 확인
		if(usersDao.selectByKakaoId(users)>0) {
			logger.info("카카오로 로그인한적이 있다");
			return true;
		} else {
			logger.info("카카오로 로그인한적이 없다");
			return false;
		}
		
	}

	@Override
	public void kakaojoin(Users users) {

		usersDao.insertkakao(users);
	}
	
	@Override
	public int idCheck(Users users) {
		
		return usersDao.checkUserId(users);
	}
	
	@Override
	public int nickCheck(Users users) {

		return usersDao.checkUserNick(users);
	}
	
	@Override
	public int selectAll(Users users) {
		return usersDao.selectAllInfo(users);
	}

	@Override
	public Users nameEmailCheck(Users users) {
		return usersDao.checkUserNameEmail(users);
	}

	@Override
	public Users idEmailCheck(Users users) {
		return usersDao.checkUserIdEmail(users);
	}
	
	@Override
	public void update(Users users) {
		usersDao.updatePw(users);
	}
	@Override
	public Users selectAllInfo(int userNo) {
		return usersDao.selectUserAll(userNo);
	}
	
}
