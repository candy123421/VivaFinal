package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.Credit;
import web.dto.MySource;
import web.dto.Pack;
import web.dto.PackLike;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.CreditService;
import web.service.face.OrderService;
import web.service.face.SourceService;

@Controller
public class SourceController {


private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;
	@Autowired CreditService creditService;
	@Autowired OrderService orderService;
	
	@GetMapping("/source/sound")
	public void sound(Model model, HttpSession session) {
		logger.info("Sound 화면 확인");
		
		// 최신 업로드 List 조회
		List<Map<String, Object>> list = sourceService.getPack();
		
		// 최다 좋아요별 List 조회
		List<Map<String, Object>> likelist = sourceService.getLikePack();
		
		logger.info("++ likelist 확인 : {}", likelist);
		
		model.addAttribute("list", list);
		model.addAttribute("likelist", likelist);
	}
	
	
	@GetMapping("/source/genre")
	public void genre(Tag genre, Model model, String msg, HttpSession session) {
		logger.info("Genre별 Source 접근 [GET]");
		logger.info("장르별 카테고리 {}",genre.getGenre());
		
		model.addAttribute("genre", genre.getGenre());
		
		// 회원정보 전달
		model.addAttribute("userNo", session.getAttribute("userNo"));
		
		logger.info("Tag 정보 ++++++ : {}",genre);
		
		// 태그 조회
		List<Tag> instrument = sourceService.getTag(genre);
		List<Tag> scape = sourceService.getTagScape(genre);
		List<Tag> detail = sourceService.getTagDetail(genre);
		List<Tag> fx = sourceService.getTagFx(genre);
		
		model.addAttribute("inst", instrument);
		model.addAttribute("scape", scape);
		model.addAttribute("dscape", genre.getScape());
		model.addAttribute("detail", detail);
		model.addAttribute("ddetail", genre.getDetail());
		model.addAttribute("fx", fx);
		model.addAttribute("dfx", genre.getFx());
		
		logger.info("Tag : {}" , genre);
		
		
		// 음원소스 조회
		List<Map<String, Object>> list = sourceService.getSourceByGenre(genre, session);
		
		// 구매이력이 있는 경우 메시지 반환
		if( msg != null && msg.equals("already")) {
			msg = msg.replace("already", "해당 음원을 구매하셨거나, 크레딧이 부족합니다! 확인해주세요!");
			logger.info(msg);
			model.addAttribute("msg", msg);
		}
		
		// logger.info("장르별 음원소스 조회 : {}", list);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/source/genre/like")
	public void genreLike(SourceLike like, Writer out) {
		logger.info("AJAX 좋아요 테스트 중");
		logger.info("좋아요 정보 : {}",like);
		
		boolean chk = sourceService.chkLike(like);
		
		logger.info("chk 확인 : {}",chk);
		
		if (chk == false) {
			sourceService.sourceLike(like);
			try {
				out.write("{\"result\":true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if (chk == true) {
			sourceService.sourceDestLike(like); 
			try {
				out.write("{\"result\":false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	@GetMapping("/source/genre/buy")
	public String buy(SourceFileInfo down, Model model) {
		logger.info("/genre/buy 접속 테스트");
		logger.info("down 요청 : {}", down);
		
		SourceFileInfo downFile = sourceService.getFile(down);
		
		logger.info("다운로드 요청 파일 정보 : {}",downFile);
		
		model.addAttribute("down", downFile);
		
		return "down";
	}
	
	
	
	
	@GetMapping("/source/inst")
	public void inst(Tag instrument, Model model, String msg, HttpSession session) {
//		logger.info("instrument Source 접근 [GET]");
		logger.info("카테고리 {}",instrument);
		
		model.addAttribute("userNo", session.getAttribute("userNo"));
		
		// 세부 카테고리를 선택한 경우 악기 값이 자동으로 들어가게 해야한다
		// 세부 카테고리의 경우 inst는 찾아내 등록, 나머지는 검색
		// 음원소스조회 역시 따로 진행한다
		
		if(instrument.getInstrument() == null) {
			
			logger.info("1번 실행");
			
			Tag res = sourceService.getInst(instrument);
			logger.info("res : {}",res);
			model.addAttribute("det", res.getDetail());
			model.addAttribute("dinst", res.getInstrument());
			
			List<Tag> genre = sourceService.getTagGenre(res);
			List<Tag> scape = sourceService.getTagScapeforInst(res);
			List<Tag> fx = sourceService.getTagFxforInst(res);
			
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", instrument.getGenre());
			
			model.addAttribute("scape", scape);
			model.addAttribute("cscape", instrument.getScape());
			
			model.addAttribute("fx", fx);
			model.addAttribute("cfx", instrument.getFx());
			
			res.setFx(instrument.getFx());
			res.setScape(instrument.getScape());
			res.setGenre(instrument.getGenre());
			
			// 음원소스 조회 [ inst, detail ] 포함
			List<Map<String, Object>> list = sourceService.getSourceByInstDetail(res, session);
			
			model.addAttribute("list", list);
			
		} else if(instrument.getInstrument() != null && instrument.getDetail() == null) {
			
			logger.info("2번 실행");
			
			// 태그 조회
			List<Tag> genre = sourceService.getTagGenre(instrument);
			List<Tag> scape = sourceService.getTagScapeforInst(instrument);
			List<Tag> fx = sourceService.getTagFxforInst(instrument);
			List<Tag> detail = sourceService.getTagDetailforInst(instrument);
			
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", instrument.getGenre());
			
			model.addAttribute("inst", instrument.getInstrument());
			
			model.addAttribute("scape", scape);
			model.addAttribute("cscape", instrument.getScape());
			
			model.addAttribute("fx", fx);
			model.addAttribute("cfx", instrument.getFx());
			
			model.addAttribute("detail", detail);
			model.addAttribute("cdetail", instrument.getDetail());
			
			// 음원소스 조회 [ inst ]만 포함
			List<Map<String, Object>> list = sourceService.getSourceByInstDetail(instrument, session);
			
			model.addAttribute("list", list);
			
		} else if(instrument.getInstrument() != null && instrument.getDetail() != null) {
			
			logger.info("3번 실행");
			
			// 태그 조회
			List<Tag> genre = sourceService.getTagGenre(instrument);
			List<Tag> scape = sourceService.getTagScapeforInst(instrument);
			List<Tag> fx = sourceService.getTagFxforInst(instrument);
			
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", instrument.getGenre());
			
			model.addAttribute("det", instrument.getDetail());
			
			model.addAttribute("scape", scape);
			model.addAttribute("cscape", instrument.getScape());
			
			model.addAttribute("fx", fx);
			model.addAttribute("cfx", instrument.getFx());
			
			
			// inst / detail 포함 조회
			List<Map<String, Object>> list = sourceService.getSourceByInstDetail(instrument, session);
			
			model.addAttribute("list", list);
		}
		
		// 구매이력이 있는 경우 메시지 반환
		if( msg != null && msg.equals("already")) {
			msg = msg.replace("already", "해당 음원을 구매하셨거나, 크레딧이 부족합니다! 마이페이지에서 확인해주세요!");
			logger.info(msg);
			model.addAttribute("msg", msg);
		}
		
		
	}
	
	
	@GetMapping("/source/pack")
	public void pack(Model model, Pack pack, Tag tag, String msg, HttpSession session, PackLike like) {
		logger.info("pack 세부 페이지 [Get]");
		
		// 회원정보 전달
		model.addAttribute("userNo", session.getAttribute("userNo"));
		
		// 팩 정보 조회 ( 이름, 설명, 사진 )
		Map<String, Object> info = sourceService.getPackInfo(pack.getPackNo());
		
		// 팩 태그 조회
		List<Map<String, Object>> genre = sourceService.getTagGenreForPack(pack.getPackNo());
		List<Map<String, Object>> inst = sourceService.getTagInstForPack(pack.getPackNo());
		List<Map<String, Object>> detail = sourceService.getTagDetailForPack(pack.getPackNo());
		List<Map<String, Object>> scape = sourceService.getTagScapeForPack(pack.getPackNo());
		List<Map<String, Object>> fx = sourceService.getTagFxForPack(pack.getPackNo());
		
		model.addAttribute("genre", genre);
		model.addAttribute("inst", inst);
		model.addAttribute("detail", detail);
		model.addAttribute("scape", scape);
		model.addAttribute("fx", fx);
		model.addAttribute("packNo", pack.getPackNo());
		model.addAttribute("pack", "pack");
		
		// 팩 음원소스 세부조회 ( 음원 )
		List<Map<String, Object>> list = sourceService.getPackByPackNo(pack.getPackNo(), tag);
		
		model.addAttribute("info",info);
		model.addAttribute("list", list);
		model.addAttribute("single", pack.getPackNo());
		
		//좋아요 수 조회
		int cnt = sourceService.getPackLikeCnt(like);
		model.addAttribute("like", cnt);
		
		// 좋아요 이력 조회
		boolean pLike = sourceService.tracePackLike(session, pack);
		if (pLike == true) {
			model.addAttribute("pLike", pLike);
		} else if ( pLike == false) {
			model.addAttribute("pLike", pLike);
		}
		
		
		// 구매이력이 있는 경우 메시지 반환
		if( msg != null && msg.equals("already")) {
			msg = msg.replace("already", "해당 음원을 구매하셨거나, 크레딧이 부족합니다! 마이페이지에서 확인해주세요!");
			logger.info(msg);
			model.addAttribute("msg", msg);
		}
		
	}
	
	
	@GetMapping("/source/pack/like")
	public void packlike(PackLike like, Writer out) {
		logger.info("ajax TEST");
		
		boolean chk = sourceService.chkPackLike(like);
		
		if( chk == true ) {
			// 이력이 있음, 기존 이력 삭제
			sourceService.packDestLike(like);
			
			// 좋아요 수 조회
			int cnt = sourceService.getPackLikeCnt(like);
			
			try {
				out.write("{\"result\":false, \"cnt\": \"" + cnt + "\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if( chk == false) {
			// 이력이 없음, 새로운 이력 추가
			sourceService.packLike(like);
			
			// 좋아요 수 조회
			int cnt = sourceService.getPackLikeCnt(like);
			try {
				out.write("{\"result\":true, \"cnt\": \"" + cnt + "\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	//CartController에서 진행할 메소드!
//	@GetMapping("/source/all")
//	public void cartAll(int userNo, @RequestParam(value="sourceNo[]") int[] sourceNo) {
//		logger.info("통신 확인");
//		
//		logger.info("cart 장바구니 : {}", userNo);
//		logger.info("int배열 : {}", sourceNo);
//	}
	
	
	@GetMapping("/pack/genre")
	public void sourcepack(Tag tag, Model model) {
//		logger.info("접속 테스트");
//		logger.info("genre QS 테스트 : {} ", tag);
		
		// Pack 조회
		List<Map<String, Object>> list = sourceService.getPackInfos(tag);
		
		// Tag 조회
		List<Tag> inst = sourceService.getPackTag(tag);
//		logger.info("악기 태그 확인",inst);
//		logger.info("list 확인 : {} ", list);
		
		model.addAttribute("list", list);
		model.addAttribute("inst", inst);
		model.addAttribute("genre", tag.getGenre());
		model.addAttribute("cinst", tag.getInstrument());
		model.addAttribute("pack", "Pack");
		
	}
	
	
	@GetMapping("/pack/inst")
	public void sourcepackinst(Tag tag, Model model, HttpSession session) {
		logger.info("팩 악기 접속 확인");
		logger.info("tag : {}",tag);
		// 회원정보 전달
		model.addAttribute("userNo", session.getAttribute("userNo"));
		
		if(tag.getInstrument() == null || tag.getDetail() != null) {
			
			logger.info(" 1번으로 온다");
			
			Tag res = sourceService.getInst(tag);
			logger.info("res : {}",res);
			model.addAttribute("det", res.getDetail());
			model.addAttribute("dinst", res.getInstrument());
			
			List<Tag> genre = sourceService.getTagGenre(tag);
			
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", tag.getGenre());
			model.addAttribute("inst", tag.getInstrument());
			model.addAttribute("detail", tag.getDetail());
			
			// Pack 조회 [ inst, detail ] 포함
			List<Map<String, Object>> list = sourceService.getPackInfos(tag);
			model.addAttribute("list", list);
		}
		
		if(tag.getInstrument() != null && tag.getDetail() == null) {
			
			logger.info(" 2번으로 온다");
			
			// Pack 조회 - 악기만 있는 것
			List<Map<String, Object>> list = sourceService.getPackInfos(tag);
			
			// Tag 조회
			List<Tag> genre = sourceService.getPackInfosInst(tag);
			
			model.addAttribute("list", list);
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", tag.getGenre());
			model.addAttribute("inst", tag.getInstrument());
			model.addAttribute("pack", "Pack");
		
		}
		
		// inst, genre, detail 다 있는 경우
		if(tag.getInstrument() != null && tag.getGenre() != null && tag.getDetail() != null) {
			logger.info(" 3번으로 온다");
			// Pack 조회 
			List<Map<String, Object>> list = sourceService.getPackInfos(tag);
			
			// Tag 조회
			List<Tag> genre = sourceService.getPackInfosInst(tag);
			
			model.addAttribute("list", list);
			model.addAttribute("genre", genre);
			model.addAttribute("cgenre", tag.getGenre());
			model.addAttribute("inst", tag.getInstrument());
			model.addAttribute("pack", "Pack");
		}
		
	}
	
	@GetMapping("/sound/genre")
	public void soundsource(Model model) {
		logger.info("/sound/genre 확인");
		
		model.addAttribute("genre", "genre");
		
	}
	
	
	@GetMapping("/sound/inst")
	public void soundpack(Model model) {
		logger.info("/sound/inst 확인");
		model.addAttribute("inst", "inst");
		
	}
	
	
	@GetMapping("/source/credit")
	public void sourecredit(Credit trace, Writer out, HttpSession session, MySource so) {
		logger.info("들어옴? : {}", trace.getUserNo());
		
		Users user = new Users();
		user.setUserNo((int)session.getAttribute("userNo"));
		so.setUserNo((int)session.getAttribute("userNo"));
		
		logger.info("구매 시도중 User : {}", user);
		
		// 크레딧 조회
		int credit = creditService.selectCreditAcc(trace);
		
		// 기존 음원 있는 지 조회
		boolean chk = orderService.checkSource(so, user);
		
		logger.info("chk 확인 : {}", chk);
		
		// 응답
		if ( chk == true || credit < 30) {
			
			logger.info("음원 구매 안되야함");
			
			// 다운 불가
			session.setAttribute("headerCredit", credit);
			try {
				out.write("{\"result\":true, \"credit\": \"" + credit + "\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else if ( chk == false && credit >= 30) {
			
			logger.info("음원 구매 중");
			// 다운 가능
			credit = credit-30;
			session.setAttribute("headerCredit", credit);
			
			try {
				out.write("{\"result\":false, \"credit\": \"" + credit + "\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
}