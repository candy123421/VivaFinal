package web.controller;


import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.multipart.MultipartFile;

import web.dto.Credit;
import web.dto.Users;
import web.service.face.CreditService;
import web.service.face.KakaoService;
import web.service.face.MailSendService;
import web.service.face.SourceService;
import web.service.face.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired UsersService usersService;
	@Autowired KakaoService kakaoService; 
	@Autowired MailSendService mailService;
	@Autowired SourceService sourceService;
	@Autowired CreditService creditService;
	
	@GetMapping("/login")
	public void login(Model model, String msg) {
		logger.info("/login [GET]");
		logger.info("msg : {}", msg);
		
		if( msg != null ) {
			msg = msg.replace("Not", "로그인 정보가 일치하지 않습니다");
			model.addAttribute("msg", msg);
			logger.info("msg Replace 확인 : {}", msg);
		}
		
	}
	
	@GetMapping("/kakaologin")
	   public String kakaoLogin(
	         @RequestParam("code")String code
			   , HttpSession session, Users users) {
	      
	      logger.info("/kakaologin [GET]");
	      logger.info("code: {}", code);
	      //카카오 인가코드로 access_token 요청후 저장
	      String access_Token = kakaoService.getAccessToken(code);
	      logger.info("controller access_token : {}" + access_Token);
	      
	      // 액세스 토큰으로 읽어온 사용자 정보
	      HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	      logger.info("Info {}", userInfo);

	      
	      // 파라미터에 kakao에서 읽어온 고유ID를 입력
	      users.setKakaoId((String)userInfo.get("id"));
	      
	      //카카오 ID가 Db에 있는지 확인해서 true, false 반환
	      boolean kakaoIdCheck = usersService.getkakaoId(users);
	      logger.info("users{}",users.getKakaoId());
	      
		  

           if(kakaoIdCheck) {
        	   //카카오ID가 Db에 있다면 세션에s id,email저장 후 로그인 성공!
        	   logger.info("회원 정보 조회 여부 : {}",kakaoIdCheck);

        	   session.setAttribute("login", true);
        	   session.setAttribute("loginCheck", true);
        	   //카카오 아이디로 회원 번호 저장
        	   int num = usersService.selectAll(users);
        	   logger.info("유저번호 : {}",num);
        	   session.setAttribute("userNo", num);
        	   
        	   //카카오 유저번호로 프로필사진 가져오기
        	   String storedname = usersService.selectStoredName(num);
   			   session.setAttribute("userProfile", storedname);
   			
   			   logger.info("storedname : {}" , storedname);
        	   
	          return "redirect:/";
           }else {
        	   //카카오 ID가 DB에 없으면 로그인처음이므로 카카오 회원가입으로 보내서 추가회원정보 받기
        	   logger.info("회원 정보 조회 여부 : {}",kakaoIdCheck);

        	   session.setAttribute("kakaoId", userInfo.get("id"));
        	   session.setAttribute("userNo", users.getUserNo());
        	   logger.info("userNo : {} ", users.getUserNo());
        	   
        	   return "/users/kakaojoin";
           }
	           
    }
	
	//credit 총계도 보여주기 위해서 credit Sevice 를 임포트할게요! - 지선
	@PostMapping("/login")
	public String loginProcess(Users users, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response
			,boolean rememberId
			,Model model
			){
		logger.info("{}", users);

		//일반 로그인시 유저 아이디와 비밀번호 일치하면 true,false
		boolean loginResult = usersService.login(users);
		
		// true값 받아와서 로그인 성공시
		if( loginResult ) {
			logger.info("로그인 성공");
			//유저 번호 가져오기
			Users getUserNo = usersService.getNo(users);
			
			String storedname = usersService.selectStoredName(getUserNo.getUserNo());
			session.setAttribute("userProfile", storedname);
			
			logger.info("storedname : {}" , storedname);
			
			//세션에 true값 저장
			session.setAttribute("login", loginResult);
			session.setAttribute("loginCheck", true);
			
			//***************아이디 저장하기********************
			session.setAttribute("id", users.getUserId());
			session.setAttribute("nick", usersService.getNick(users));
			session.setAttribute("userNo", getUserNo.getUserNo());
			
			
			//***************크레딧 잔액 저장하기******************** (지선 작성)
			Credit creditAcc = new Credit();
			creditAcc.setUserNo(getUserNo.getUserNo());
			session.setAttribute("headerCredit", creditService.selectCreditAcc(creditAcc));
			
			//rememberId는 체크박스 name이다
			//아이디 저장 체크박스가 체크되어있으면 쿠키저장
			if(rememberId(rememberId)) {
				Cookie cookie = new Cookie("id", users.getUserId());
				response.addCookie(cookie);
			}else {
				//아이디 저장 체크박스가 체크되어있지않으면 cookie삭제
				Cookie cookie = new Cookie("id", users.getUserId());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			return "redirect:/";
			
		} else {	//로그인 실패시
			logger.info("로그인 실패");
			
			session.invalidate();
			
			//로그인시 아이디, 비밀번호가 일치하지 않으면 "로그인 정보가 일치하지 않습니다"
			//span으로 띄우기
			String msg = "Not";
			model.addAttribute("msg", msg);
			return "redirect:./login?";
		}
		
	}
	
	//아이디 저장 체크박스 눌렀으면 true 가져오기
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}

	// 발급받은 토큰을 만료시켜 로그아웃 시킨다
   // 리턴은 메인페이지로
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	
    	if(session.getAttribute("access_Token") != null) {
    		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
    	}
        
    	// 세션 삭제
        session.invalidate();
        logger.info("logout() - 로그아웃 성공");
        return "redirect:/";
    }


	@GetMapping("/join")
	public void join() {}
	
	//회원가입, 비밀번호 찾기시 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public boolean mailCheck(String email, HttpSession session) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		session.setAttribute("code", mailService.joinEmail(email));
		//인증 코드 유효 시간 -> 세션 시간을 변경했기에 로그인시 세션이 30분이 유지되는지 
		//확인 필요, 만약 30분 유지 못하고 3분으로 고정된다면 로그인시에 세션시간을 30분으로 변경하는
		//코드가 필요하다고 생각됨
		session.setMaxInactiveInterval(3*60);
		return true;
	}
	
	//회원가입시 이메일 인증
	@PostMapping("/mailCheck")
	@ResponseBody
	public boolean mailUserCheck(int inputCode, HttpSession session) {
		System.out.println("이메일 인증 요청이 들어옴!");

		
		//인증 코드 유효 시간 -> 세션 시간을 변경했기에 로그인시 세션이 30분이 유지되는지 
		//확인 필요, 만약 30분 유지 못하고 3분으로 고정된다면 로그인시에 세션시간을 30분으로 변경하는
		//코드가 필요하다고 생각됨
		
		logger.info("userCode: {}, session Code: {}", inputCode, (Integer)session.getAttribute("code"));
		
		if(inputCode == (Integer)session.getAttribute("code")) {
			return true;
		}
	
		return false;
	}
	
	@PostMapping("/join")
	public String joinProcess(Users users, Model model) {
		
		
		boolean joinResult = usersService.join(users);
				
			if(joinResult) {
				logger.info("회원가입 성공");
				return "redirect:./login";			
			} else {
				logger.info("회원가입 실패");
				return "redirect:./join";
			}
			
		}
		
	@GetMapping("/kakaojoin")
	public void kakaojoin() {
	
	}
	
	@PostMapping("/kakaojoin")
	public String kakaojoinProc(Users users,HttpSession session) {
		
		String kakao = (String)session.getAttribute("kakaoId");
		
		users.setKakaoId(kakao);
		logger.info("users : {}",users);
		
		usersService.kakaojoin(users);
		
		return "redirect:./login";
	}

	//아이디 중복 검사
	@RequestMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(Users users) {
		
		logger.info("userIdChk입니다");
		
		int result = usersService.idCheck(users);
		
		logger.info("결과값 {} " , result);
		
		//result가 1이면 DB에 아이디 존재
		if(result != 0) {
			return "fail";	//중복 아이디 존재
		}else {
			return "success";	//중복 아이디 없음
		}
	}
	//닉네임 중복 검사
	@RequestMapping("/userNickChk")
	@ResponseBody
	public String userNickChk(Users users) {
		
		logger.info("userNickChk입니다");
		
		int result = usersService.nickCheck(users);
		
		logger.info("결과값 {} " , result);
		
		//result가 1이면 DB에 닉네임 존재
		if(result != 0) {
			return "fail";	//중복 닉네임 존재
		}else {
			return "success";	//중복 닉네임 없음
		}
	}
	//회원정보 수정 - 닉네임 중복검사
	@RequestMapping("/userNickChk2")
	@ResponseBody
	public String userNickChk2(Users users, HttpSession session ) {
		
		logger.info("userNickChk입니다");
		users.setUserNo((int)session.getAttribute("userNo"));
		
		boolean result = usersService.updateNickCheck(users);
		
		logger.info("결과값 {} " , result);
		
		//result가 1이면 DB에 닉네임 존재
		if(!result) {
			return "fail";	//중복 닉네임 존재
		}else {
			return "success";	//중복 닉네임 없음
		}
	}
	
	//아이디찾기에서 이름과 이메일 존재여부 ajax
	@RequestMapping("/checkIdPw")
	@ResponseBody
	public void nameEmailfind(Users users, Model model, Writer out) {
		
		logger.info("userNameEmailChk입니다 : {}", users);
		
		Users result = usersService.nameEmailCheck(users);
		
		logger.info("결과값 {} " , result);
		
		String input = users.getUserNick();
		
		logger.info("입력한 닉네임 {}",input);
		logger.info("조회한 아이디 {} ",result.getUserId());
		
			if( result != null && input.equals(result.getUserNick())){
			
			String id = result.getUserId();
			
			try {
				out.write("{\"userId\": \"" + id + "\", \"result\": true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
	//비밀번호찾기에서 아이디과 이메일 존재여부 ajax
	@RequestMapping("/checkIdEmail")
	@ResponseBody
	public void idEmailfind(Users users, Model model, Writer out) {
		
		logger.info("userIdEmailChk입니다 : {}", users);
		//아이디와 이메일이 DB에 존재하면 사용자 모든정보를 result에 저장
		Users result = usersService.idEmailCheck(users);
		
		logger.info("결과값 {} " , result);
		
		String input = users.getUserId();
		
		logger.info("입력한 아이디 {}",input);
		//아이디와 이메일이 DB에 존재하면 pwcheck ajax로 사용자아이디,번호, true값 보내기
		if( result != null && input.equals(result.getUserId())){
			
			String id = result.getUserId();
			
			try {
				out.write("{\"userId\": \"" + id +	 "\", \"result\": true,\"userNo\": \"" + result.getUserNo() + "\" }");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//아이디찾기
	@RequestMapping("/idcheck")
	public void idcheck(Users users) {
		logger.info("/users/idcheck");
	}

	//비밀번호 찾기
	@GetMapping("/pwcheck")
	public void pwfind(Users users) {
		logger.info("/users/pwcheck");
	}
	
	//비밀번호 찾기 - 새로운 비밀번호 설정하기
	@GetMapping("/pwchange")
	public void pwchange(Users users, Model model) {
		logger.info("/users/pwchange");
		
		//비밀번호찾기 창에서 유저번호 저장
		model.addAttribute("userNo", users.getUserNo());
	}
	
	//비밀번호 찾기 - 새로운 비밀번호 설정하기
	@PostMapping("/pwchange")
	public String pwchangeProc(Users users) {
		logger.info("/users/pwchange");
		
		//사용자 새로운 비밀번호 설정하기
		usersService.update(users);
		
		return "redirect:./login";
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public void userInfo(Users users, HttpSession session , Model model) {
		logger.info("/users/mypage[GET]");
		
		//로그인했을 때 유저 번호 세션에 저장한거 userNo에 저장
		int userNo = (int)session.getAttribute("userNo");
		logger.info("마이페이지 : {}" , users.getUserNo());
		
		users.setUserNo(userNo);
		//로그인시 해당 유저 번호에 대한 유저 모든 정보 저장
		Users userInfo = usersService.selectAllInfo(userNo);
		logger.info("userInfo:{}", userInfo);
		
		model.addAttribute("userInfo",userInfo);
		session.setAttribute("grade", userInfo.getUserGrade());
		session.getAttribute("userProfile");
	}
	
	//마이페이지
	@PostMapping("/mypage")
	public void userInfoProc(Users users, HttpSession session , Model model) {
		logger.info("/users/mypage[POST]");
		
		session.getAttribute("userProfile");

	}

	//회원정보수정 페이지
	@GetMapping("/update")
	public void userupdate(Users users, HttpSession session , Model model) {
		logger.info("/users/update[GET]");
		
		//로그인했을 때 유저 번호 세션에 저장한거 userNo라는 변수에 저장
		int userNo = (int)session.getAttribute("userNo");
		logger.info("마이페이지 : {}" , users.getUserNo());
		
		Users userInfo = usersService.selectAllInfo(userNo);
		logger.info("userInfo:{}", userInfo);
		
		users.setUserNo(userNo);
		
		session.setAttribute("userInfo", userInfo);
		session.getAttribute("userProfile");

		logger.info("userprofile:{}", session.getAttribute("userProfile"));
	}
	
	//회원정보수정 페이지
	@PostMapping("/update")
	public String userupdateProc(Users users, HttpSession session,Model model, MultipartFile profile) {
		logger.info("/users/update[POST]");

		//userno 가져오기
		int userNo = (int)session.getAttribute("userNo");
		users.setUserNo(userNo);
		
		//회원정보 수정 (update)
		logger.info("프로필 정보 : {}", profile);
		logger.info("수정하는 사람 : {}", users);
		
		//유저넘버에 대한 프로필 테이블 행개수 가져오기
		boolean isProfileNo = usersService.selectFileNo(users);
		logger.info("isProfileNo:{}", isProfileNo);
		
		//회원정보수정하기전에 fileno가 DB에 존재하면 삭제하고 업데이트/DB에 없으면 insert 시키기
		//true를 받아서 DB에 fileno가 존재하므로 프로필사진 수정(update)
		if(isProfileNo == true && profile.getSize() > 0) {
			logger.info("프로필사진 올린적있음");
			//회원프로필 삭제 
//			usersService.deleteProfile(users,profile);
			
			//회원정보 수정한거 삽입
			usersService.updateProfile(users,profile);

			// 프로필 조회해서 가져오기
			String storedName = usersService.selectStoredName(userNo);
			session.setAttribute("userProfile", storedName);
			
			return "redirect:./mypage";
		
		}else if (isProfileNo == true && profile.getSize() <= 0) {
			logger.info("정보만 수정하려는 쪽");
			usersService.updateIdPw(users,profile);
			
			// false를 받아서 회원프로필사진 삽입(insert)
		} else if(isProfileNo == false) {
			logger.info("프로필사진 올린적없음");
			usersService.insertProfile(users,profile);
			
			// 새로 올린 프로필을 조회해서 다시 세션에 등록 시킨다
			String storedName = usersService.selectStoredName(userNo);
			session.setAttribute("userProfile", storedName);
			
			return "redirect:./mypage";
		}
		
		return "redirect:./mypage";
	}
	
	
	@GetMapping("/delete")
	    public void delete() {}
	
	@PostMapping("/delete")
	public String deleteProc(HttpSession session) {
		
		int userno = (int)session.getAttribute("userNo");
		logger.info("delete : userNo:{}" , userno);
		
		usersService.deleteInfo(userno);
		
		return "redirect:./login";
	}
	
	@GetMapping("/mysource")
	public void mysource(HttpSession session, Model model) {
		logger.info("내가 가진 음원 소스");
		
		// 내가 가진 음원소스 조회
		// 로그인 된 회원의 정보를 통해서 가져온다
		List<Map<String, Object>> list = sourceService.getMySource((int)session.getAttribute("userNo"));
		
		model.addAttribute("list", list);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
