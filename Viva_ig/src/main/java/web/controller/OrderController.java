package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.MySource;
import web.dto.Pack;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.CartService;
import web.service.face.OrderService;

@Controller
public class OrderController {
	
	@Autowired OrderService orderService;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/source/download")
	public String buy(MySource source, Model model, HttpSession session, String inst, Pack packNo) {
		logger.info("download링크 클릭 확인 {}");
		logger.info("source : {}",source);
		
		
		session.getAttribute("userNo");
		Users user = new Users();
		user.setUserNo((int)session.getAttribute("userNo"));
		
		// 구매 크레딧 이상 가지고 있는지 확인
		boolean chkCredit = orderService.checkCredit(user);
		
		// 기존에 가지고 있는 음원소스인지 확인
		boolean chkSource = orderService.checkSource(source, user);
		logger.info("chkSource {}", chkSource);
		
		// 장바구니 삭제
		orderService.checkCart(source, user);
		
		// 구매(다운로드) 실패 시 얻을 장르
		Tag getTag = null;
		String get = null;
		
		// 구매자 정보 입력
		
		// 추가 시작
		if( chkCredit == true && chkSource == false ) {
			
			// 30 이상의 크레딧과 기존 구매 이력이 없는 경우
			
			// Mysource, SourceDown, Credit INSERT 필요
			source.setUserNo(user.getUserNo());
			orderService.intoMySource(source);
			
			// SourceDown
			orderService.intoSourceDown(source);
			
			// CREDIT
			orderService.intoCredit(source);
			
		} else {
			
			if(inst != null && !"".equals(inst)) {
				
				logger.info("inst : {}", inst);
				
				// Instrument
				getTag = orderService.getInstrument(source.getSourceNo());
				logger.info("+++ getINST : {}", getTag);
				
				get = getTag.getInstrument();
				
				// 30 미만의 크레딧과 기존 구매 이력이 있는 경우
				return "redirect: /source/inst?msg=already&instrument="+get+"";
				
				
			}
			
			// Pack 세부 페이지에서 구매 실패 시
			if( packNo.getPackNo() > 0) {
				
				return "redirect:/source/pack?msg=already&packNo="+packNo.getPackNo()+"";
			}
			
			// GENRE
			getTag = orderService.getGenre(source.getSourceNo());
			logger.info("+++ getGenre : {}", getTag);
			
			get = getTag.getGenre();
			
			// 30 미만의 크레딧과 기존 구매 이력이 있는 경우
			return "redirect: /source/genre?msg=already&genre="+get+"";
			
		}
		
		SourceFileInfo down = orderService.getFile(source.getSourceNo());
		
		model.addAttribute("down", down);
		
		return "down";
	
	}
	
	@GetMapping("/source/redown")
	public String redown(Model model, SourceFileInfo redown) {
		logger.info("다시 다운로드 받는 쪽 확인");
		
		logger.info("소스 정보 : {}", redown.getSourceNo());
		
		SourceFileInfo down = orderService.getFile(redown.getSourceNo());
		
		model.addAttribute("down", down);
		
		return "down";
	}
	

	

	
	
	
	
	
	
	
	
	
	
	
	
}
