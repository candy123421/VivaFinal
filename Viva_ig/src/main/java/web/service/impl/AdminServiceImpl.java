package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Admin;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;

	
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
	

}
