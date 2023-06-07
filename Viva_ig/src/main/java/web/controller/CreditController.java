package web.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Credit;
import web.dto.Users;
import web.service.face.CreditService;

@Controller
@RequestMapping("/credit")
public class CreditController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CreditService creditService;
	
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
	@RequestMapping("/test")
	public String test() {
		logger.info("credit/list - test()");
		
		return "/credit/test";
	}

	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, 크레딧 목록 부르는 페이지
	@PostMapping("/list")
	public void list(Credit userNo, Model model) {
		logger.info("credit/list - list()");
		logger.info("userno: {} ", userNo);
		
		
		//1. 크레딧 전체 내역(default) 조회하기
		List<Credit> creditList = new ArrayList<>(); 
		creditList = creditService.getCreditList(userNo);
		logger.info("조회내역:{}", creditList);
		model.addAttribute("list", creditList);
		
		//2.크레딧 총계 보내주기
		//회원 크레딧 잔액 구하기 (DB 조회 결과 null 일 경우 0 으로 반환)
		int res = 0; 
		res = creditService.selectCreditAcc(userNo);
		logger.info("크레딧잔액:{}", res);
		
		model.addAttribute("creditAcc", res);
		
		//3. 회원등급 보내주기
		//회원등급 확인하기 (0:일반회원, 1 : 업로더)
		Users user = new Users();
		user.setUserNo(userNo.getUserNo());
		String grade = "";
		grade = creditService.chkUserGrade(user);
		logger.info("회원등급 : {}", grade);
		
		model.addAttribute("grade", grade);
		logger.info("전송할 회원등급:{}", model.getAttribute("grade"));
		//문제는 이런 방식으로는 (String은 view로 전달 안되는가? Object 타입만 전달이 가능한가?) null 이 들어가 있어서 해결이 안된다,,,ㅠ
		//=> model.getAttribute()괄호 안에 따옴표까지 포함해서 써야 출력이 되는거다!!!!
		
		
		
	}
	
	@RequestMapping("/charge")
	public void charge(Credit userNo, Model model) {
		logger.info("credit/charge - charge()");
		logger.info("userno: {} ", userNo);
	}

	@RequestMapping("/exchange")
	public void exchange(Credit userNo, Model model) {
		logger.info("credit/exchange - exchange()");
		logger.info("userno: {} ", userNo);
	}
}
