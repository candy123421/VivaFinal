package web.controller;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Users;
import web.service.face.CartService;
import web.service.face.CreditService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private CartService cartService;
	
	//장바구니 구매에 따라서 크레딧 잔액 변화를 위해서 import 함.
	@Autowired private CreditService creditService;

	//장바구니 세션구현 완료^_^
	
	//----------------------------------------------------------------------------------------
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
//	@GetMapping("/test")
//	public String list1() {
//		logger.info("cart/list - test()");
//		
//		return "/cart/test";
//		
//	}
	
	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, cart 목록 부르는 페이지
	@RequestMapping("/list")
	public void list(HttpSession session, Cart user, Model model) {
		logger.info("cart/list - list()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		
		//세션에 있는 userNo을  cart DTO에 지정하여 진행
		session.getAttribute("userNo");
		user.setUserNo((int)session.getAttribute("userNo"));
		logger.info("userNo : {}", user.getUserNo());
		  
		//userNo을 통해 리스트 확인하기
		List<Map<String,Object>> cartList = cartService.getCartList(user);
		logger.info("리스트출력 : {}", cartList);
		
		model.addAttribute("list", cartList);
		
	}
	
	//----------------------------------------------------------------------------------------
	//항목 삭제 요청 받은 이후 페이지
	//credit 페이지와 다르게 요청 url 을 delete 와 deleteChk 로 받을거다. 
	//컨트롤러부분만 두개로 나뉘면서 다를뿐, 서비스 이후 로직은 비슷함!
	@RequestMapping("/delete")
	public void delete(@RequestParam("cartNo") int cartNo, HttpSession session, Writer out) {
	    logger.info("/cart/delete - delete()");
	    logger.info("세션userNo : {}", session.getAttribute("userNo"));
	    logger.info("삭제항목: {}", cartNo);
	    
	    Cart cart = new Cart();
	    cart.setCartNo(cartNo);
	    
	    //세션에 있는 userNo을  cart DTO에 지정하여 진행		
	    cart.setUserNo((int) session.getAttribute("userNo"));
		logger.info("삭제대상 : {}", cart);
		
	    // cartNo를 기반으로 장바구니 항목 삭제 로직 수행
	    boolean success = cartService.deleteCartItem(cart);
	    logger.info("{}", success);
	    
	    // 삭제 성공 여부에 따라 응답 데이터 설정
	    try {
	        out.write("{\"result\": " + success + "}");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}

	@ResponseBody
	@RequestMapping("/deleteChk")
	public void deleteChkBox(@RequestParam(value = "chbox[]") List<String> chArr, HttpSession session, Writer out) throws Exception {
		logger.info("/cart/deleteChk - deleteChkBox()");
	    logger.info("세션userNo : {}", session.getAttribute("userNo"));
	    logger.info("삭제항목: {}", chArr);
	    
	    //cart DTO에 지정하기
		Cart cart = new Cart();
		cart.setUserNo((int) session.getAttribute("userNo"));
		logger.info("userNo : {}", cart.getUserNo());

		int cartNo = 0;				//그릇
		boolean success = false;	//삭제성공여부

		if(cart != null) {

			for(String i : chArr) {  
				
				//int형 변수(cartNo)에다가 배열의 요소를 parseInt하여 하나씩 담기
				cartNo = Integer.parseInt(i);
				logger.info("{}", cartNo);

				cart.setCartNo(cartNo);
				logger.info("담겨진 cart정보:{}", cart);
				
				//삭제여부에 따라서 boolean 값 반환(default 는 false 임)
				success = cartService.deleteCartItem(cart);
				logger.info("삭제결과 : {}", success);
			}   
		}  

		// 삭제 성공 여부에 따라 응답 데이터 설정
		try {
			out.write("{\"result\": " + success + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		 
	//----------------------------------------------------------------------------------------
	//음원 페이지에서 장바구니 담으면 오는 메소드
	//여기서 중복 확인해서 장바구니 중복 리턴해줘야함 (하지만 true든 false 든 장바구니에서 다시 빠져나가게는 안할거임 -> 수익창출을 위해)
	//하지만 MySource TB에서 중복검사를 해서 구매이력이 있으면, 장바구니에 못 담게 해야함.
	@ResponseBody	//ResponseBody 와 Writer out 을 같이 쓰면 충돌로 인해 에러가 난다!!! 꼭 염두하자!
	@RequestMapping("/add")
	public boolean add(HttpSession session, Cart add) throws Exception {
		logger.info("cart/add - add()");

		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		add.setUserNo((int) session.getAttribute("userNo"));
		
		logger.info("장바구니 담을 대상: {} ", add);
		
		//1. 구매이력 확인하기 (구매했던 이력 있음 장바구니 접근도 못하게 만들기!!!)
		//My Source TB에서 userNo, sourceNo 으로 대조하기
		int history = 0;
		history = cartService.checkMySource(add.getSourceNo(), (int) session.getAttribute("userNo"));
		
		logger.info("구매이력 확인 : {} ",history);
		//0 이면 구매가능. 1 이상이면, 이미 구매이력이 있으므로, 무조건 return false

		//구매이력 있을 경우
		if(history > 0 ) {
			logger.info("장바구니에 담지도 못해!");
			return false;
			
			
		//구매이력 없을 경우
		} else {
			logger.info("예선통과. 이제 본선 진출. 현재 장바구니 중복 검사 실시!");

			//2. 장바구니 담기(중복검사는 서비스에서 해주려고함)
			boolean success = cartService.addCartItem(add);
			 
			logger.info("장바구니 담기 어쨌든 성공 : {}",success );
			
		    //장바구니 아이콘 누르면 어쨌든 담길거임. 
			//다만, 중복 여부에 따라 true false로 반환되지만, 
			//jsp에는 true 값일 경우에만 값을 보내게 해주려고 함.
			if(success) {
				logger.info("jsp로 true 값일 때만 전송 완료!");
			}
			return true;
			
			//결론적으로, 해당 jsp 에는 총 3개의 선택반환값이 넘어가는거임. 
		}
	}
	
	//--------------------------------------------------------------------
	//source 페이지에서 pack 단위로 장바구니 넣어야할 때 
	//지금까지 했던 방식과 다르게, 배열을 값을 serviceImpl까지 끌고가서 map 으로 userno과 짝지어줄것임. 
	//컨트롤러에서 for each 문을 쓰니 성능 낭비가 있을것 같음(물론 우리의 데이터는 적지만!)
	@ResponseBody
	@RequestMapping("/addPack")
	public boolean addPack(HttpSession session, @RequestParam(value="sourceNo[]") int[] source) throws Exception {
		logger.info("/cart/addPack - addPack()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		int userNo = (int) session.getAttribute("userNo");
		
		logger.info("int배열 : {}", source);
		logger.info("int배열길이? : {}", source.length);
		
		
		//******************** get Pack 의 규칙 *****************************
		// A. 팩 전체가 이미 구매이력이 있을 경우에만  => false 를 반환.
		// B. 팩 일부 구매했을 경우 + 팩 구매 이력 없을 경우   
			// B-a. 나머지 팩-음원 전체 장바구니 있을 경우  => true 반환.
			// B-b. 나머지 팩-음원 일부 장바구니 있을 경우  => true 반환
			// B-c. 나머지 팩-음원 전체 장바구니 없을 경우 	=> true 반환
		// C. 어쨌든 이 이외의 상황 ? => false 를 반환.
		//*******************************************************************
		

		//1. 구매이력 확인하기 
		//My Source TB에서 userNo, sourceNo 으로 대조하기
		//** 근데 만약, pack 의 일부는 구매를 했고, 일부는 구매하지 않았다면, 
		//구매한 것만 제외하고 장바구니에 넣는걸 진행해볼수 있을까? => 서비스에서 꺼내어서 확인해보자
		//int getPackItem 은 총 담겨진 소스의 수를 반환..?
		int alreadyGot = 0;
		alreadyGot = cartService.checkMySourceToPack(source, userNo);
		
		logger.info("구매한 소스/팩의 소스 : {} / {} ",alreadyGot, source.length );
		//0 이면 구매가능. 1 이상이면, 이미 구매이력이 있다는거.
		//하지만 전체 팩 중 구매한 소스 제외 구매이력 없는 소스는 장바구니에 넣을 준비를 하려고 함. 
		//일단 이미 구매한 소스의 수를 알려주고 함. 
		
		
		//경우 A. 이미 팩의 소스를 구매 다 한 경우
		if(alreadyGot >= source.length) {
			logger.info("소스를 이미 다 구매한 팩이다.");
			
			return false;
			
		//경우 B. 팩의 일부를 구매한 경우 + 팩 구매 이력이 없을 경우
		} else if ( alreadyGot < source.length) {
			logger.info("팩의 일부 소스를 구매한 적 있거나 or 아예 구매한 적 없는 소스일 경우");
			
			// 이미 장바구니에 들어가있는 소스를 제외하고 장바구니에 집어넣자.
			//근데 이미 구매한 소스를 제외하고 걸러내서 넣는 방법은..? 서비스에서 for 문을 통해 진행하자
			
			//나머지 소스의 구매이력 걸러내어 중복 검사를 진행한다.
			boolean success = cartService.addSomePack(userNo, source);
			logger.info("장바구니 잘 담궜지? : {}", success);
			//장바구니 중복결과와 상관없이 장바구니에 해당 팩 소스는 존재할 것임. 이미 구매한 애들 제외하고.
			//====================== 그래서 어쨌든 장바구니에 다 담궜을 거야. 이미 전체 소스가 담긴 경우에는 반환값 안줄거임!
			return true;
		} else {
			return false;
			
		}
	}
	
	//--------------------------------------------------------------------
	//장바구니에서 항목 구매시 처리할 메소드
	@ResponseBody
	@RequestMapping("/buy")
	public int cartBuy(HttpSession session, @RequestParam(value = "chbox[]") int[] cart, HttpServletResponse response) throws IOException {
		logger.info("/cart/buy -  cartBuy()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("배열:{}", cart);
		
		int user = (int) session.getAttribute("userNo");

		// A. cart[] 전부 다 구매이력 있는 경우 = > result : 나의 소스 redirect 
		// B. cart[] 일부 구매이력 있거나, 구매이력이 전혀 없는 경우 (각 항목별로 적용한 개념임)
			// B-a. 이미 구매이력 있는 소스는 cart TB에서 delete 해준다.
			// B-b. 구매이력이 전혀 없는 소스는 아래의 5단계 트랜잭션을 진행해준다.
		// 어쨌든, buy를 요청한 항목은 cart 페이지에서 사라지게 될 거임. cart TB에서도.

		
		
		//** 사실 cart 에 담기 전부터 구매이력을 확인 후 담지못하게 할거지만, 혹시라도 장바구니에 이미 있는 경우에는
		//어쨌든 이러한 과정을 거쳐야 하는건 맞는거다..

		//0. 나의 구매이력에서 우선 확인 후, 구매하지 않은 소스를 구매할 조건이 되는지를 확인하기
		//매개변수 : userNo, sourceNo
		//필요한 return 값 : count(*) 수. / cart.length (배열의 길이)
		//여기서 추가로 더 확인해야할 사항 -> 구매하지 않은 소스의 수량 만큼 credit 보유가 있는지 + 소스의 총 합계
		int already = cartService.checkMySourceToPack(cart, user);
		//addPack 메소드에서 쓰던걸 재활용!
		
		logger.info("구매 중복확인 : {}/{}", already, cart.length);
		
		
		int result=0;	//jsp에서 1~ n까지 에 따른 경우의 수 달라짐
		
		
		if(already >= cart.length) {
			logger.info("아이고 다 구매하셨던건데, 장바구니에 또 있는거였네요? 다 삭제");
			
			//장바구니 TB에서 전부 지워주기
			cartService.duplicatedItemToTrash(cart, user);
			
			result = 1;
			
		} else if (already == 0 ){
			logger.info("아주 깨끗하게 산적 없는 소스들만 선택했군요!");
			
			//1. 회원의 잔고 확인 후 소스가격과 비교해서 구매가능한지 알려주기 
			boolean purchase = cartService.chkCreditAcc(user, cart);
			logger.info("구매가능여부 : {}", purchase);
			//-----------------------------------------------
			
			//2. 본격 구매 시작.
			if(purchase) {
				logger.info("선택사항 구매가능!");
				//본격적인 구매 진행
				//service 에서 트랜잭션 진행할 생각!
				//필요한거? 회원번호, cart[] 이거면 된다. (원래는 cartNo 까지 같이 갈려고 했으나, 굳이 ? 라는 생각이 들어 뺐다.)
				boolean success = cartService.purchaseCartItem(user, cart);
				
				//만약 트랜잭션이 잘 됐다면...true 가 나오겠지.. 
				logger.info("{}", success);
//			
				
				//***************크레딧 잔액 리로드 하기******************** 
				//CreditService 임포트 필수!
				Credit creditAcc = new Credit();
				creditAcc.setUserNo((int)session.getAttribute("userNo"));
				session.setAttribute("headerCredit", creditService.selectCreditAcc(creditAcc));
				
				result = 2;
				
			} else {
				logger.info("잔액부족하네 너!");
				result = 3;
			
			}
		
		}
		logger.info("jsp에게 보내질 최종 숫자 : {} ", result);
		return result;
	}
	@RequestMapping("/filedown")
	public String filedown(HttpSession session, Cart user, Model model) {
		logger.info("cart/filedown - list()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		
		//세션에 있는 userNo을  cart DTO에 지정하여 진행
		session.getAttribute("userNo");
		user.setUserNo((int)session.getAttribute("userNo"));
		logger.info("userNo : {}", user.getUserNo());
		  
		//userNo을 통해 리스트 확인하기
		List<Map<String,Object>> cartList = cartService.getCartList(user);
		logger.info("리스트출력 : {}", cartList);
		
		model.addAttribute("list", cartList);
		
		return "down";
		
	}
	
	
	@Autowired ServletContext context;
	
	@ResponseBody
	@RequestMapping("/fileDownloadProc")
	public boolean fileDownloadProc(
			HttpSession session , int[] sourceNo,
			Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("/cart/fileDownloadProc -  fileDownloadProc()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("sourceNo : {}", sourceNo);
		logger.info("응답 테스트..............");
		
		
		SourceFileInfo down = cartService.getFile(sourceNo);
		logger.info("소스의 정보?? : {}", down);
		
		
		// 저장된 파일의 폴더 (upload) 
		String path = context.getRealPath("upload");
		logger.info("저장된 파일의 폴더 : {} ", path);
		
		// 실제 업로드된 파일 이름 ( Stored Name )
		String sourceName = down.getFileStoredname();
		logger.info("실제 업로드된 파일 이름 : {} ", sourceName);
		
		// 실제 파일 객체
		File download = new File(path, sourceName);
		logger.info("실제 파일 객체 : {} ", download);
		logger.info("존재확인 :{}", download.exists());
		
		// 파일 전송 Content Type 지정
		response.setContentType("application/octet-stream");
		
		// 응답 데이터 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		// 브라우저에서 다운로드할 파일이름
		String downloadName = URLEncoder.encode(down.getFileOriginname(),"UTF-8");
		logger.info("브라우저에서 다운로드할 파일이름 : {}", downloadName);
		
		downloadName = downloadName.replace("+","%20");
		downloadName = downloadName+".wav";
		logger.info("브라우저에서 다운로드할 파일이름 최종 : {}", downloadName);
		
		response.setHeader("Content-Disposition","attachment; filename=\"" + downloadName + "\"");
		
		logger.info("setHeader해줌 : {}", response);
		// --- 응답 메시지의 BODY 영역 설정
		// 서버 File -> FileInputStream 입력 -> HTTP Response OutputStream 출력
		
		// 서버 파일 입력 스트림
//		FileInputStream in = new FileInputStream(download);
//		logger.info("서버 파일 입력 스트림 : {}", in);
//		
//		// 클라이언트 응답 출력 스트림
//		OutputStream out = response.getOutputStream();
//		logger.info("클라이언트 응답 출력 스트림 : {}", out);
//		
//		// 서버 -> 클라이언트 파일 복사
//		FileCopyUtils.copy(in, out);
		
		
//		String fileName = request.getParameter("fileName");
//		String saveFolder = "upload";
//		
		int user = (int) session.getAttribute("userNo");
		//1. 회원의 잔고 확인 후 소스가격과 비교해서 구매가능한지 알려주기 
		boolean purchase = cartService.chkCreditAcc(user, sourceNo);
		logger.info("구매가능여부 : {}", purchase);
		
		//2. Mysource TB에 존재하는지 한번 더 확인. 
		//구매이력이 있으면 -> Mysource 페이지로 리다이렉트 메시지 보여주기
		
		
		
		
		//-----------------------------------------------
		//3. 본격 구매 시작.
		if(purchase) {
			logger.info("선택사항 구매가능!");
			//본격적인 구매 진행
			//service 에서 트랜잭션 진행할 생각!
			//필요한거? 회원번호, cart[] 이거면 된다. (원래는 cartNo 까지 같이 갈려고 했으나, 굳이 ? 라는 생각이 들어 뺐다.)
			boolean success = cartService.purchaseCartItem(user, sourceNo);
			
			//만약 트랜잭션이 잘 됐다면...true 가 나오겠지.. 
			logger.info("{}", success);
//		
			
			//***************크레딧 잔액 리로드 하기******************** 
			//CreditService 임포트 필수!
			Credit creditAcc = new Credit();
			creditAcc.setUserNo((int)session.getAttribute("userNo"));
			session.setAttribute("headerCredit", creditService.selectCreditAcc(creditAcc));
			
			return true;

			
		} else {
			logger.info("선택사항 구매 불가능!");
			return false;
			//크레딧이 부족해서 그런건지
			//source가 이미 구매해서 그런건지
			//source가 더이상 구매 불가능해서 그런건지 등등 
			//그에 따른 반환값을 정해줘야할 듯 함... 
			//아직은 모르겠음 ㅠ
		}
	}
	
}
