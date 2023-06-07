package web.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Admin;
import web.dto.AdminAnswer;
import web.dto.UserQuestion;
import web.dto.Users;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;
	//파일업로드에 필요한 context
	@Autowired ServletContext context;

	
	@Override
	public boolean adminLogin(Admin admin) {
		
		int res = adminDao.selectCntByAdminIdPw(admin);
		
		if(res > 0) {
			return true;
		}
		
		return false;
	}


	@Override
	public Admin getAdminNo(Admin admin) {
		return adminDao.selectAdminNo(admin);
		
	}
	
	@Override
	public List<UserQuestion> qnalist() {
		return adminDao.selectQnAList();
	}


	@Override
	public UserQuestion getQNo(UserQuestion userQuestion) {
		return adminDao.selectQnAView(userQuestion);
	}
	
	@Override
	public void answerSingUp(UserQuestion userQuestion, AdminAnswer adminAnswer,Admin admin , Users users) {
		//답변등록
		adminDao.insertAdminAnswer(adminAnswer);
		adminAnswer.setAdminNo(admin.getAdminNo());
		adminAnswer.setqNo(userQuestion.getqNo());
		//답변등록시 Process 변경되기 
		adminDao.updateQProcess(userQuestion);
		
	}

	

}
