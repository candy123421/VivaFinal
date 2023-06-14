package web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Credit;
import web.dto.ExchangeInfo;
import web.dto.Users;
import web.service.face.CreditService;

@Controller
@RequestMapping("/credit")
public class CreditController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CreditService creditService;
	
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
//	@RequestMapping("/test")
//	public String test() {
//		logger.info("credit/list - test()");
//		
//		return "/credit/test";
//	}

	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, 크레딧 목록 부르는 페이지
	@RequestMapping("/list")
	public void list(HttpSession session, Credit userNo, Model model, String state) {
		logger.info("credit/list - list()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("카테고리 클릭 시:{}", state);
		
		
		userNo.setUserNo((int) session.getAttribute("userNo"));
		logger.info("userno: {} ", userNo);
		
		//1. 크레딧 전체 내역(default) 조회하기 + state 로 
		List<Credit> creditList = new ArrayList<>(); 

		//1-1. 크레딧 전체 내역(default) -null or 다시 '전체' 클릭했을 경우
		if(state == null || "전체".equals(state)) {
			
			//Credit userNo 만 매개변수로.
			creditList = creditService.getCreditList(userNo);
			logger.info("조회내역:{}", creditList);
			model.addAttribute("list", creditList);
		
		//1-2. 크레딧 필터된 내역 
		}else if (state !=null) {
			logger.info("카테고리 클릭했다.");
			
			//Credit userNo과 카테고리까지 매개변수로
			creditList = creditService.clickCategoryList(userNo, state);
			logger.info("조회내역:{}", creditList);
			model.addAttribute("list", creditList);
		}
		
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
//----------------------------------------------------------------------------------------------------------------------
	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, 크레딧 목록 부르는 페이지
	@ResponseBody
	@RequestMapping("/category")
	public List<Credit> category(HttpSession session, Credit userNo, Model model, String state) {
		logger.info("credit/category - category()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("카테고리 클릭 시:{}", state);
		
		
		userNo.setUserNo((int) session.getAttribute("userNo"));
		logger.info("userno: {} ", userNo);
		
		//1. 크레딧 전체 내역(default) 조회하기 + state 로 
		List<Credit> creditList = new ArrayList<>(); 

		//1-1. 크레딧 전체 내역(default) -null or 다시 '전체' 클릭했을 경우
		if(state == null || "전체".equals(state)) {
			
			//Credit userNo 만 매개변수로.
			creditList = creditService.getCreditList(userNo);
			logger.info("조회내역:{}", creditList);
//			model.addAttribute("list", creditList);
			
			return creditList;
		
		//1-2. 크레딧 필터된 내역 
		}else if (state !=null) {
			logger.info("카테고리 클릭했다.");
			
			//Credit userNo과 카테고리까지 매개변수로
			creditList = creditService.clickCategoryList(userNo, state);
			logger.info("조회내역:{}", creditList);
//			model.addAttribute("list", creditList);
			return creditList;
		}
		logger.info("보내기전 마지막 결과 확인 : {}", creditList);
		return creditList;
		
		
		
	}	
	
	

//----------------------------------------------------------------------------------------------------------------------
	//토스페이먼츠 결제 페이지 이동 시 
	@RequestMapping("/charge")
	public void charge(HttpSession session, Credit userNo, Model model) {
		logger.info("credit/charge - 결제 페이지 이동");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		//orderID 로 랜덤 uuid 난수 생성하기
//		UUID uid = UUID.randomUUID();
//		logger.info("uid : {} ", uid);
//		//출력 : uid : 625a3eac-368f-4a18-b04e-1de60849a894 (매번 바뀜)
		
		//생성 시 UUID 형태이므로 String 형태로 바꿔줘야함
		String id = UUID.randomUUID().toString();
//		logger.info("id : {} ", id);
		
		//근데 너무 기니까, split 해서 전체 UUID 중 뒤에 16자리만 추출하려고 한다.
		logger.info("id: {}", "VIVA" + id.split("-")[2] + id.split("-")[3] + id.split("-")[4]);
		//출력 : ad7c7f904298e57a 잘되고 있다. 

		//orderID로 jsp에게 전달해주기
		String orderId= "VIVA" + id.split("-")[2] + id.split("-")[3] + id.split("-")[4];
		model.addAttribute("id", orderId);
		

		//충전이후의 크레딧을 보여주기 위해서 크레딧 총계 보내주기
		//회원 크레딧 잔액 구하기 (DB 조회 결과 null 일 경우 0 으로 반환)
		int myPocket = 0; 
		userNo.setUserNo((int) session.getAttribute("userNo"));
		myPocket = creditService.selectCreditAcc(userNo);
		logger.info("크레딧잔액:{}", myPocket);
		
		model.addAttribute("creditAcc", myPocket);
		
	}
	
//----------------------------------------------------------------------------------------------------------------------
	//토스페이먼츠 결제 요청 시 
	@RequestMapping("/charging")
	public String charging(HttpSession session, HttpServletRequest request, ModelAndView mav) {
		logger.info("credit/charging - 결제 요청후 결제 진행 중");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		//url에 담겨서 전달되는 4가지 요소 -> 결제 승인을 위해 사용해야함.
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = "test_sk_P24xLea5zVAqyEqG6P6VQAMYNwW6:";

		logger.info(orderId);
		logger.info(paymentKey);
		logger.info(amount);
		logger.info(secretKey);

		//secretKey 뒤에 :를 붙이고 Base64로 인코딩을 해줘야함. (그 다음에 앞에 Basic 을 붙여줘야하는거임)
		Encoder encoder = Base64.getEncoder(); 
		//Base64 인코딩을 거치면 바이트 형태로 나올것이기에, byte형태의 배열 선언해둠.
		byte[] encodedBytes;
		//결제승인 url 을 위해 선언과 동시에 초기화
		HttpURLConnection connection = null;
		//결제 승인 페이지에서 200(성공) 및 400~ 500~ 에러 코드를 받아내기 위해서 int 변수 미리 만들어두기.
		int code = 0;
		
		//결제승인을 거친 정보를 JSONObject에 담을 것이기에, 선언과 동시에 초기화 
		JSONObject jsonObject = null;
		
		//null 값도 나올 수 있기에 try~catch 로 감싸준다.
		try {
			//secretKey의 UTF-8 바이트를 인코딩한 값을 배열에 담아준다.
			encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
			//String 변수에 담아준다..(이해안됨..ㅠ)
			String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
			
			paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

			//결제 승인 페이지 . 여기를 거쳐야만 결제 요청이 완전히 승인됨!
			URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
			
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("Authorization", authorizations);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);

			//JsonObject를 다시 초기화해준다.
			JSONObject obj = new JSONObject();
			obj.put("paymentKey", paymentKey);
			obj.put("orderId", orderId);
			obj.put("amount", amount);

			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(obj.toString().getBytes("UTF-8"));

			//결제 승인에 대한 응답을 받는다. 잘됐는지 아닌지. 200 뜬건지 400이나 500 떴는지 등..
			code = connection.getResponseCode();
			//응답코드가 200일때 true 아니면 false 로 불린값 변수를 만든다.
			boolean isSuccess = code == 200 ? true : false;

			//위에서 boolean 값이 200이어서 true 일때는 getInputStream 을 InputStream 값에 대입한다.
			InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();

			//이해안되는 코드임. reader 하나보구나...
			Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
			
			//inputStream에서 받아온 정보를 JSON에 담기위해 파싱 과정을 거쳐야한다.
			JSONParser parser = new JSONParser();
			//reader에서 파싱한 데이터를 JSONObject로 변환하여 jsonObject에 담아준다.
			jsonObject = (JSONObject) parser.parse(reader);

			//잘 담겼음을 알 수 있다.
			logger.info("{}", jsonObject);
			
			//위에 url 열고 할거 다했으니, 닫아주는게 좋다. 우리 한창 connection 닫아준것처럼 
			responseStream.close();
			//null 값이 있을 수 있기에 catch 로 잡아준다. 자세한 내용은 솔직히 모르겠다..
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//위에서 안전하게 파싱한 jsonObject를 서비스로 넘긴다. 사실 위의 과정을 전부 서비스에서 해도 될 듯 하지만, 나는 아직 확신이 없기에. 일단 이대로 두기로. 
		int dealNo = creditService.addPurchaseInfo(session, jsonObject);
		
		logger.info("dealNo : {}", dealNo);

		//session 에 dealNo를 넣어둔다.
		session.setAttribute("dealNo", dealNo);
		
		//url에 결제정보가 담기지 않도록 redirect 를 해준다.
		return "redirect:/credit/chargeOk";
	}
	
//-----------------------------------------------------------------------------
	//결제 완료 시, 이동할 리다이렉트 페이지!
	@RequestMapping("/chargeOk")
	public void chargeOk(HttpSession session, @SessionAttribute(value="dealNo") int dealNo, Model model) {
		logger.info("credit/chargeOk - 결제 완료");
		
		logger.info("{}", dealNo);
		
		//결제완료된 정보 조회해오기(크레딧 총계, 결제방법, 결제승인시간, 실제 금액)
		Map<String,Object> info = creditService.viewChargeOkInfo(dealNo);
		
		
		//***************크레딧 잔액 리로드 하기******************** 
		//CreditService 임포트 필수!
		Credit creditAcc = new Credit();
		creditAcc.setUserNo((int)session.getAttribute("userNo"));
		session.setAttribute("headerCredit", creditService.selectCreditAcc(creditAcc));
		
		//확인하기
		logger.info("{}", info);
		
		model.addAttribute("info", info);
		
	}

	//결제 실패 시, 이동할 리다이렉트 페이지!
	@RequestMapping("/fail")
	public void fail(Credit userNo, Model model) {
		logger.info("credit/fail - 결제 실패");
		logger.info("userno: {} ", userNo);
		
	}
	

//-----------------------------------------------------------------------------
	@GetMapping("/exchange")
	public void exchange(HttpSession session, Credit userNo, Model model) {
		logger.info("credit/exchange - exchange()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		//1. 회원등급 확인하기 (0:일반회원, 1 : 업로더) -> 아닐 경우 알려주기
		Users user = new Users();
		user.setUserNo((int) session.getAttribute("userNo"));
		String grade = "";
		grade = creditService.chkUserGrade(user);
		logger.info("회원등급 : {}", grade);
		
		//2. 잔여 크레딧(환전 가능 액수 : 1000크레딧부터) 확인하기 -> 아닐 경우 알려주기
		Credit myPocket = new Credit();
		myPocket.setUserNo((int) session.getAttribute("userNo"));
		
		int res = 0; //잔여 크레딧 
		res = creditService.selectCreditAcc(myPocket);
		logger.info("크레딧잔액:{}", res);
		
		//크레딧 잔여가 1000 이상 일 경우에만 환전 가능!
		if (res >= 1000 ) {
			model.addAttribute("creditAcc", true);
		} else {
			model.addAttribute("creditAcc", false);
		}

		//view 에서 grade 에 따라 바로 화면 보여주거나 or alert 창이 바로 뜨면서 돌아가게 하기!
		model.addAttribute("grade", grade);
	}

	//-----------------------------------------------------------------------------
	//사용자가 입력한 환전 정보를 받아오는 곳 (post 로 전송했음)
	@RequestMapping("/exchangeOk")
	public void exchangeOk(HttpSession session, ExchangeInfo exchange, int exCredit, Model model) {
		logger.info("credit/exchangeOk - exchangeOk()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		
		logger.info("신청한 크레딧 : {}", exCredit);
		logger.info("예금주 : {}", exchange.getHolder());
		logger.info("은행명 : {}", exchange.getBank());
		logger.info("계좌번호 : {}", exchange.getAccNo());
		
		exchange.setUserNo((int)session.getAttribute("userNo"));
		exchange.setExAmount(exCredit*10);	//크레딧 액수 *10 = 실제 금액
		
		logger.info("환전요청정보 : {}", exchange);
		
		//받은 정보 DB에 입력하기
		ExchangeInfo result = creditService.addExchangeInfo(exCredit, exchange);
		
		logger.info("환전신청완료 : {} ", result);
		
		//***************크레딧 잔액 리로드 하기******************** 
		//CreditService 임포트 필수!
		Credit creditAcc = new Credit();
		creditAcc.setUserNo((int)session.getAttribute("userNo"));
		session.setAttribute("headerCredit", creditService.selectCreditAcc(creditAcc));
		
		model.addAttribute("info", result);
	}

	
//-----------------------------------------------------------------------------
	//크레딧 내역에서 X표 눌러서 삭제하는 url (선택 항목 + 개별)
	@RequestMapping("/delete")
	//스프링 반환값을 int 로 준적은 처음인데... 이렇게 해도 되는걸까? 확신없음..ㅠ => 되긴됨..
	//ajax로 넘어온 chbox[] 배열을 List<String> 에 담겠다는거임.
	//만약 앞에 @RequestParam(value = "chbox[]") 를 생략하면, 
	//No primary or single public constructor found for interface java.util.List - and no default constructor found either 
	//에러가 뜸!!!
	//이유는 원래 스프링이 알아서 바인딩 해주는 아이이나, 기본 생성자가 없는 모델객체인 List<String> 에는 자동으로 바인딩해줄 조건이 없는거임.
	public void delete(HttpSession session, @RequestParam(value = "chbox[]") int[] creditNo, Credit deal, Writer out) throws Exception {
		logger.info("credit/delete - delete()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("배열:{}", creditNo);
		
		deal.setUserNo((int) session.getAttribute("userNo"));
		
		//성공적으로 끝날지에 대한 결과값
		boolean success = false;
		
		//배열로 담아온 dealNo를 하나씩 꺼내어 Credit TB에 set 해주기
		if(deal !=null) {

			for(int i : creditNo) {
				deal.setDealNo(i);
				logger.info("잘 담김? :{}", deal );
				//하나씩 출력되면서 잘 담긴것을 확인할 수 있음
				//하지만 for each 문 밖에서 확인하면, 단 하나의 항목만 출력된것을 확인할 수 있음.
				//그러므로, 출력도, service로 넘길 메소드도 for each 문 안에서 하나씩 진행될수 있도록 넣어줘야함.
				success= creditService.deleteDeal(deal);
			}
			logger.info("성공적으로 update");
			//위의 구문이 성공적으로 끝날 시에...
			//로그인이 안되었거나 세션이 만료되어 자동 로그아웃된 경우 작동하기 않게 하기 위함
			//물론 이 코드가 없더라도 카트가 삭제되지 않고 에이젝스의 error를 이용해 구분할 수 있지만, 
			//컨트롤러보다 더 깊은 Service와 DAO를 거쳐 쿼리문이 실행되는걸 막을 수 있습니다.
			//뭔말이야? 이해안됨
			
		}
		
	    // 삭제 성공 여부에 따라 응답 데이터 설정
	    try {
	        out.write("{\"result\": " + success + "}");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
	@RequestMapping("/toss")
	@ResponseBody	//ResoponseBody 를 쓰지 않으면 view name 을 찾아간다. 왜냐면 항상 viewResolver 가 뷰네임을 찾으러 가기에.  그리고 return 값을 내가 원하는 타입으로 보내줄수 있다!
	public Map<String, Object> toss(HttpSession session, int cash,  String method) {
		logger.info("credit/toss - toss()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("결제 금액 {} ", cash);
		logger.info("결제 방식 {} ", method);
		
//		JSONObject json = new JSONObject();
//            json.put("cash", cash);
//            json.put("method", method);

			
//	    // 삭제 성공 여부에 따라 응답 데이터 설정
//	    try {
////		    out.write("{\"result\": " + cash +",\"result2\":"+ method +"}");
//		    out.write("{\"result\": " + method + "}");
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }
		
		if("card".equals(method)) {
			logger.info("카드로 변환");
			method = "카드";

		} else if("phone".equals(method)) {
			logger.info("휴대폰으로 변환");
			method = "휴대폰";
		
		} else if("transfer".equals(method)) {
			logger.info("계좌이체로 변환");
			method = "계좌이체";
			
		}
		
		Map<String, Object> paramMap = new HashMap<>();
	    
	    paramMap.put("cash", cash);
	    paramMap.put("method", method);
	    
	    //주문서 작성을 위해 회원 이름과 email 검색하기 (조건 : 회원번호)
	    Map<String, Object> info = creditService.getUserInfo((int) session.getAttribute("userNo"));
	    //HashMap으로 받아왔으면, 대문자로 DB에 입력된 컬럼값 그대로 받아와야한다.
	    logger.info("회원이메일: {}", info.get("USER_EMAIL"));
	    
	    //paramMap에다가 같이 넣어주기 
	    paramMap.put("email", (String) info.get("USER_EMAIL"));
	    paramMap.put("name", (String) info.get("USER_NAME"));
	    
	    return paramMap;
	}
	
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
	//여기서부터 관리자 관리페이지로!
//	@RequestMapping("/admin")

	
}
