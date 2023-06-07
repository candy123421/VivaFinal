package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.face.SourceService;

@Controller
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;
	
	@RequestMapping("/")
	public String home(Model model) {
		logger.info("왜 abc가");
		
		// 추천 수 상위 10개 Pack 조회
		List<Map<String, Object>> rank = sourceService.getLikePack();
		
		model.addAttribute("rank", rank);
		
		return "/home";
	}
	
}
