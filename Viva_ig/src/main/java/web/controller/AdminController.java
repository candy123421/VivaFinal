package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Admin;
import web.service.face.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService adminService;
	
	@GetMapping("/login")
	public void adminloginget() {
		logger.info("/admin/login [GET]");
	}
	
	@PostMapping("/login")
	public String adminlogin(Admin admin , HttpSession session) {
		
		boolean adminlogin = adminService.adminLogin(admin);
		logger.info("adminloginparam 값 : {}",admin);
		
		if(adminlogin) {
			//관리자 번호 가져오기 
			Admin adminNo= adminService.getAdminNo(admin);
			session.setAttribute("adminlogin", true);
			session.setAttribute("adminloginid", admin.getAdminId());
			session.setAttribute("adminNo", adminNo.getAdminNo());
		} else {
			session.invalidate();
		}
		
		
		return "redirect:./main";
		
	}
	
	@RequestMapping("/main")
	public void main() {
		logger.info("/admin/main [GET]");
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("/admin/logout [GET]");
		session.invalidate();
		
		return "redirect:./main";
		
	}

}
