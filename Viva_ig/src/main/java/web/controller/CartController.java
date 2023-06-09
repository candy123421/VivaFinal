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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Cart;
import web.dto.Source;
import web.dto.Users;
import web.service.face.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private CartService cartService;

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
	@GetMapping("/add")
	public void add(HttpSession session, Cart add, Writer out) {
		logger.info("cart/add - add()");

		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		add.setUserNo((int) session.getAttribute("userNo"));
		
		logger.info("장바구니 담을 대상: {} ", add);
		
		//장바구니 담기(중복검사는 서비스에서 해주려고함)
		boolean success = cartService.addCartItem(add);
		 
		logger.info("장바구니 담기 어쨌든 성공 : {}",success );
		
	    //장바구니 아이콘 누르면 어쨌든 담길거임. 
		//다만, 중복 여부에 따라 true false로 반환되지만, 
		//jsp에는 true 값일 경우에만 값을 보내게 해주려고 함.
		if(success) {
			try {
				out.write("{\"result\": " + success + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			logger.info("jsp로 true 값일 때만 전송 완료!");
		}
		
	}
	
	//--------------------------------------------------------------------
	//source 페이지에서 pack 단위로 장바구니 넣어야할 때 
	//지금까지 했던 방식과 다르게, 배열을 값을 serviceImpl까지 끌고가서 map 으로 userno과 짝지어줄것임. 
	//컨트롤러에서 for each 문을 쓰니 성능 낭비가 있을것 같음(물론 우리의 데이터는 적지만!)
	@GetMapping("/addPack")
	public void addPack(HttpSession session, @RequestParam(value="sourceNo[]") int[] source) throws Exception {
		logger.info("/cart/addPack - addPack()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		int userno = (int) session.getAttribute("userNo");
		
		logger.info("int배열 : {}", source);
		
		//수행해야할 코드는 서비스로 넘기기
		cartService.addPack(userno, source);
		
		logger.info("addPack 완전히 성공확인!");
	}
	
	//--------------------------------------------------------------------
	//장바구니에서 항목 구매시 처리할 메소드
	@RequestMapping("/buy")
	public void cartBuy(HttpSession session, @RequestParam(value = "chbox[]") int[] cart, Writer out) {
		logger.info("/cart/buy -  cartBuy()");
		logger.info("세션userNo : {}", session.getAttribute("userNo"));
		logger.info("배열:{}", cart);
		
		int user = (int) session.getAttribute("userNo");
		
		//회원의 구매가능 잔고 확인 
		//구매할 소스의 총계 구하기
		//비교해서 구매가능한지(true, false 로 반환)
		boolean purchase = cartService.chkCreditAcc(user, cart);
		logger.info("구매가능여부 : {}", purchase);
		
		if(purchase) {
			logger.info("선택사항 구매가능!");
			//본격적인 구매 진행
			//service 에서 트랜잭션 진행할 생각!
			//필요한거? 회원번호, cart[] 이거면 된다. (원래는 cartNo 까지 같이 갈려고 했으나, 굳이 ? 라는 생각이 들어 뺐다.)
			boolean success = cartService.purchaseCartItem(user, cart);
			//만약 트랜잭션이 잘 됐다면...true 가 나오겠지.. 
			logger.info("{}", success);
//		
//			//try~catch 구문을 써주긴 해야할지 모르겠다...
			try {
				out.write("{\"result\": " + success + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			logger.info("선택사항 구매 불가능!");
			//크레딧이 부족해서 그런건지
			//source가 이미 구매해서 그런건지
			//source가 더이상 구매 불가능해서 그런건지 등등 
			//그에 따른 반환값을 정해줘야할 듯 함... 
			//아직은 모르겠음 ㅠ
		}
	}
	
}
