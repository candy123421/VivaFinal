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
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/list")
	public void list(Credit userNo, Model model) {
		logger.info("credit/list - list()");
		
		//추후, 세션값으로 회원 정보 가져올때 코드 작성해야함
		
		//회원번호 임시로 지정(44)
		userNo.setUserNo(44);
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
	
	
	@RequestMapping("/success")
	public void success(HttpServletRequest request) {
		logger.info("credit/charge - 결제 완료()");

		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = "test_sk_P24xLea5zVAqyEqG6P6VQAMYNwW6:";

		logger.info(orderId);
		logger.info(paymentKey);
		logger.info(amount);
		logger.info(secretKey);

		Encoder encoder = Base64.getEncoder(); 
		byte[] encodedBytes;
		HttpURLConnection connection = null;
		int code = 0;
		
		JSONObject jsonObject = null;
		
		try {
			encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
			String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);

			paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

			URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("Authorization", authorizations);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);

			JSONObject obj = new JSONObject();
			obj.put("paymentKey", paymentKey);
			obj.put("orderId", orderId);
			obj.put("amount", amount);

			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(obj.toString().getBytes("UTF-8"));

			code = connection.getResponseCode();
			boolean isSuccess = code == 200 ? true : false;

			InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();

			Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
			JSONParser parser = new JSONParser();
			jsonObject = (JSONObject) parser.parse(reader);

			logger.info("{}", jsonObject);
			
			responseStream.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		creditService.addPurchaseInfo(jsonObject);

//		return "redirect:/credit/chargeOk";
	}
	
	@RequestMapping("/chargeOk")
	public void chargeOk() {
		logger.info("credit/chargeOk - 결제 완료");
	}
//	@ResponseBody
//	@RequestMapping("/success")
//	public String success(HttpServletRequest request, Writer out) {
//		logger.info("credit/charge - 결제 완료()");
//		
//		//url 로 넘어온 데이터를 추출하기
//		
//		String orderId = request.getParameter("orderId");
//		String paymentKey = request.getParameter("paymentKey");
//		String amount = request.getParameter("amount");
//		String secretKey = "test_sk_P24xLea5zVAqyEqG6P6VQAMYNwW6:";
//		
//		logger.info(orderId);
//		logger.info(paymentKey);
//		logger.info(amount);
//		logger.info(secretKey);
//		
//		HttpRequest req = HttpRequest.newBuilder()
//				//토스 결제 승인하는 url
//				.uri(URI.create("https://api.tosspayments.com/v1/payments/confirm"))
//				
//				//토스와 계약 전 사용하는 시크릿 키를 base64로 인코딩한거!
//				.header("Authorization", "Basic dGVzdF9za19QMjR4TGVhNXpWQXF5RXFHNlA2VlFBTVlOd1c2Og==")
//				.header("Content-Type", "application/json")
////				.method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\"{paymentKey}\",\"amount\":15000,\"orderId\":\"{orderId}\"}"))
//				.build();
//		
//		HttpResponse<String> resp = null;
//		
//		try {
//			resp = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
//			out.write("{\"resp\": " + resp + "}");
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		}
//		logger.info("{}",resp.body());
//		
//		return "redirect:/credit/charge";
//	}
	
	@RequestMapping("/fail")
	public void fail(Credit userNo, Model model) {
		logger.info("credit/charge - charge()");
		logger.info("userno: {} ", userNo);
		
	}
	

	@RequestMapping("/exchange")
	public void exchange(Credit userNo, Model model) {
		logger.info("credit/exchange - exchange()");
		logger.info("userno: {} ", userNo);
	}

	
//-----------------------------------------------------------------------------
	//크레딧 내역에서 X표 눌러서 한 항목씩 삭제하는 url
	@ResponseBody
	@RequestMapping("/delete")
	//스프링 반환값을 int 로 준적은 처음인데... 이렇게 해도 되는걸까? 확신없음..ㅠ
	public int delete(
			//ajax로 넘어온 chbox[] 배열을 List<String> 에 담겠다는거임.
			//만약 앞에 @RequestParam(value = "chbox[]") 를 생략하면, 
			//No primary or single public constructor found for interface java.util.List - and no default constructor found either 
			//에러가 뜸!!!
			//이유는 원래 스프링이 알아서 바인딩 해주는 아이이나, 기본 생성자가 없는 모델객체인 List<String> 에는 자동으로 바인딩해줄 조건이 없는거임.
			@RequestParam(value = "chbox[]") List<String> chArr, Credit deal
			) throws Exception {
			
		logger.info("credit/delete - delete()");
		logger.info("삭제요청항목 : {}", chArr);
		
		//추후, 세션값으로 회원 정보 가져올때 코드 작성해야함
		
		//회원번호 임시로 지정(44)
		deal.setUserNo(44);
		
		//성공적으로 끝날지에 대한 결과값
		int result = 0;
		
		//dealNo 선언과 동시에 초기화
		int dealNo = 0;
		
		//배열로 담아온 dealNo를 하나씩 꺼내어 Credit TB에 set 해주기
		//추후, 세션 종료 여부를 위해 if 문으로 걸러주는거임. 근데 현재는 그냥 44를 담아놓은 Credit deal 로 써놓음
		if(deal !=null) {
			logger.info("세션유지중(추후 개발)");

			for(String i : chArr) {
				//setDealNo을 하려면, int 형으로 넣어야하는데 우리는 String 값으로 받아왔으니,
				//위에서 만들어주 int dealNo 이라는 그릇에다가 parseInt한 값을 담아서 한번에 set을 해줘야한다.
				dealNo = Integer.parseInt(i);
				deal.setDealNo(dealNo);
				logger.info("잘 담김? :{}", deal );
				//하나씩 출력되면서 잘 담긴것을 확인할 수 있음
				//하지만 for each 문 밖에서 확인하면, 단 하나의 항목만 출력된것을 확인할 수 있음.
				//그러므로, 출력도, service로 넘길 메소드도 for each 문 안에서 하나씩 진행될수 있도록 넣어줘야함.
				creditService.deleteDeal(deal);
			}
			logger.info("성공적으로 update");
			//위의 구문이 성공적으로 끝날 시에...
			//로그인이 안되었거나 세션이 만료되어 자동 로그아웃된 경우 작동하기 않게 하기 위함
			//물론 이 코드가 없더라도 카트가 삭제되지 않고 에이젝스의 error를 이용해 구분할 수 있지만, 
			//컨트롤러보다 더 깊은 Service와 DAO를 거쳐 쿼리문이 실행되는걸 막을 수 있습니다.
			//뭔말이야? 이해안됨
			result = 1;
			
		}
		return result;
	}
	
}
