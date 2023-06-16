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
import web.util.Paging;

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
	public Paging getPaging(Paging paramData , String qProcess ,String keyword) {
		
		//총 게시글 수 조회
		int totalCount = 0;
		totalCount = adminDao.selectQnACnt();
		
		if(qProcess != null && keyword ==null ) {
			totalCount= adminDao.selectQnACnt(qProcess);
		} 
		
		if(keyword != null) {
			totalCount = adminDao.selectQnACnt(keyword);
		}
		
		//페이징 계산
		Paging paging = new Paging ( totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	
	@Override
	public List<UserQuestion> qnalist(Paging paging,String qProcess,String keyword) {
		
		if(keyword == null) {
			
			return adminDao.selectQnAList(paging,qProcess);
		} else {
			return adminDao.selectQnAListByKeyword(paging,keyword);
		}
		
	}

	@Override
	public List<UserQuestion> userQnA(int attribute) {
		return adminDao.selectUserQnAList(attribute);
	}

	@Override
	public UserQuestion getQNo(UserQuestion userQuestion) {
		return adminDao.selectQnAViewQuestion(userQuestion);
	}
	
	@Override
	public AdminAnswer getANo(AdminAnswer adminAnswer) {
		return adminDao.selectQnAViewAnswer(adminAnswer);
	}
	
	@Override
	public Users getUserInfo(int attribute) {
		return adminDao.selectUserInfo(attribute);
	}
	
	@Override
	public void writeQuestion(UserQuestion userQuestion) {
		//문의등록
		adminDao.insertUserQuestion(userQuestion);
	}
	
	@Override
	public Admin getAdminInfo(int attribute) {
		//세션에있는 adminno로 admin정보 알아오기
		return adminDao.selectAdminInfo(attribute);
	}
	
	@Override
	public Users getUsersInfo(Users users) {
		return adminDao.selectUsersInfo(users);
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
	@Override
	public int getProcess(UserQuestion userQuestion) {
		return adminDao.selectQProcess(userQuestion);
	}
	
	@Override
	public Admin getAdminId(Admin admin) {
		return adminDao.selectAdminNick(admin);
	}
	
	@Override
	public Paging getUserPaging(Paging paramData,String keyword) {
		
		int totalCount = 0;
		totalCount = adminDao.selectUserCnt();
		
		if(keyword !=null ) {
		totalCount = adminDao.selectUserCnt(keyword);
		}
		
		//페이징 게산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Users> userlist(Paging paging,String keyword) {
		if(keyword == null) {
			return adminDao.selectUserList(paging);
			
		} else {
			return adminDao.selectUserListByKeyword(paging,keyword);
		}
		
	}
	
	@Override
	public void checkUser(int[] check) {
		
		for(int i=0; i<check.length; i++) {
			
			Users users = new Users();
			users.setUserNo(check[i]);
			adminDao.updateUserGrade(users);
		}
		
	}
}
