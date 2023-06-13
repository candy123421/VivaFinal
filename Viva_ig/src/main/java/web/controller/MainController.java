package web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Users;
import web.service.face.SourceService;
import web.service.face.UsersService;

@Controller
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;
	@Autowired UsersService usersService;
	
	@RequestMapping("/")
	public String home(Users users, Model model , HttpSession session) {
		logger.info("main controller");
		
		session.getAttribute("userProfile");
		
		// 추천 수 상위 10개 Pack 조회
		List<Map<String, Object>> rank = sourceService.getLikePack();
		
		model.addAttribute("rank", rank);
		
		return "/home";
	}
	
}
