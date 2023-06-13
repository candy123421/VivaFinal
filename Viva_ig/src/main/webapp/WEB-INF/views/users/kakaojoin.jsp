<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- <script src="/resources/join/join.js" type="text/javascript"></script> -->

<script type="text/javascript">

//1. 처음 포커스 벗어났을 경우 메시지 띄우기
$(function(){
	
 	//아이디에 포커스
	$("#userId").focus()
	
	//아이디를 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userId").blur(function(){
		if($("#userId").val()==''){
			$("#userid_msg").html("필수정보입니다")
		}else{
			$("#userid_msg").html("")
		}
	})
	
	//비밀번호를 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userPw").blur(function(){
		if($("#userPw").val()==''){
			$("#userpw_msg").html("필수정보입니다")
		}else{
			$("#userpw_msg").html("")
		}
	})
	
	//tab으로 다음칸으로 넘어갔을 경우  -- blur function
	////비밀번호입력과 비밀번호 재확인입력이 동일하지않을 경우 메시지
	$("#userpw_check").blur(function(){	
		
		if($("#userPw").val() != $("#userpw_check").val()){
			$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_error").html("비밀번호가 일치합니다")
		}
	})
	
	//비밀번호 재확인칸을 클릭했을 경우 -- click function
	//비밀번호입력과 비밀번호 재확인입력이 동일하지않을 경우 메시지
	$("#userpw_check").click(function(){	
		
		if($("#userPw").val() != $("#userpw_check").val()){
			$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_error").html("비밀번호가 일치합니다")
		}
	})
	
	//이름을 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userName").blur(function(){
		if($("#userName").val()==''){
			$("#username_msg").html("필수정보입니다")
		}else{
			$("#username_msg").html("")
		}
	})
	
})
//----------------------------------------------------------------------------------------

//2. 버튼 클릭했을 경우 아이디,비밀번호,이름,생년월일 정규화가 맞지않으면 메시지 띄우기
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 아이디,비밀번호 : 정규화 
		if(!validate()){
			return false
		}
		
		return true;
	})
	
	//아이디 입력란 클릭시 밑에 메시지 없애기
	$("#userId").focus(function(){
		$("#userid_msg").html("")	
	})
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
	//이름 입력란 클릭시 밑에 메시지 없애기
	$("#userName").focus(function(){
		$("#username_msg").html("")	
	})
})

//아이디,비밀번호,이름,생년월일 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//가입하기버튼 눌렀을 때 아이디 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return false
	}
	
	//아이디 정규화
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	
	if(!idReg.test($("#userId").val())){
			$("#userid_msg").html("아이디는 6자 이상, 20자 이하의 영문자,숫자만 가능합니다!")
			return false
	}
	
	//가입하기버튼 눌렀을 때 비밀번호 유효성검사
	if($('#userPw').val()==''){
		$('#userpw_msg').html("비밀번호를 입력해주세요")
		return false
	}
	
	//비밀번호 정규화
    var pwReg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		   
	if( !pwReg.test( $("#userPw").val() ) )  {
	      $("#userpw_msg").html("비밀번호는 알파벳 대소문자, 숫자, 특수기호 조합으로 8자 이상, 20자 이하로 작성하세요")
	      return false
	}
    
  	//가입하기버튼 눌렀을 때 이름 유효성검사
	if($('#userName').val()==''){
		$('#userName_msg').html("이름을 입력해주세요")
		return false
	}

  	//이름 정규화
  	var nameReg = /^[가-힣]{1,10}$/

	if( !nameReg.test( $("#userName").val() ) )  {
      $("#username_msg").html("이름은 10자이내 한글만 가능합니다!")
      return false
	}
  	return true;
  
}

//3. 버튼 클릭했을 경우 비밀번호와 비밀번호 재확인이 일치하지 않으면 메시지 띄우기
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//compare_check - 비밀번호,비밀번호재확인 일치 
		if(!compare_check()){
			return false
		}
		return true;
	})
}
)
//버튼을 클릭했을 경우 비밀번호와 비밀번호재확인이 일치하지않으면 버튼푸시 실패
//비밀번호와 비밀번호 재확인 입력 유효성검사
function compare_check(){
	
	//가입하기버튼 눌렀을 때 비밀번호 확인 유효성 검사
	if($("#userPw").val() != $("#userpw_check").val()){
		$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		return false;
	}
	return true
}

//아이디 중복 검사
$(function(){
		//아이디 중복체크를 하지않으면 false
		var isIdCheck = false;
		//닉네임 중복체크를 하지않으면 false
		var isNickCheck = false;

	//아이디 중복체크 버튼을 누르면
	$(".id_input").on("click", function(){
		
		var userId = $("#userId").val();
		var data = {userId : userId}

		if(userId == ''){
			$('#userid_msg').html("아이디를 입력해주세요")
			return
		}
		//회원가입시 아이디 중복검사
		$.ajax({
			type:"get",
			url: " /users/userIdChk",
			data : data,
			success: function(result){
				//
				if(result != "fail"){
					isIdCheck=true;
					//중복아이디가 없어서 사용가능한 아이디입니다
					$(".id_input1").css("display","inline-block");
					//span input2는 안보이게
					$(".id_input2").css("display","none");
				}else{
					isIdCheck=false;
					//중복아이디이므로 '아이디가 이미 존재합니다' 띄우기
					$(".id_input1").css("display","none");
					$(".id_input2").css("display","inline-block");
				}
				
			}
		})
		
	})
	
	//닉네임 중복 검사
	$(".nick_input").on("click", function(){
	//console.log("keyup 테스트");
	
		var userNick = $("#userNick").val();
		var data = {userNick : userNick}

		if(userNick == ''){
			$('#usernick_msg').html("닉네임을 입력해주세요")
			return
		}
		
		$.ajax({
			type:"get",
			url: " /users/userNickChk",
			data : data,
			success: function(result){
				//
				if(result != "fail"){
					isNickCheck=true;					
					//중복닉네임 없어서 사용가능한 닉네임입니다
					$(".nick_input1").css("display","inline-block");
					//span input2는 안보이게
					$(".nick_input2").css("display","none");
				}else{
					isNickCheck=false;					
					//중복닉네임이므로 '닉네임 이미 존재합니다' 띄우기
					$(".nick_input1").css("display","none");
					$(".nick_input2").css("display","inline-block");
				}
				
			}
		})
	})
	
	//아이디 ,닉네임 중복이면 submit불가
	 $('#btn').click(function() {
	     if(!isIdCheck){
	         alert('아이디 중복검사를 확인해주세요.');
	         return false;
	      }else{
	         return true;
	      }

	})
	//아이디 ,닉네임 중복이면 submit불가
	 $('#btn').click(function() {
	     if(!isNickCheck){
	         alert('닉네임 중복검사를 확인해주세요.');
	         return false;
	      }else{
	         return true;
	      }

	})
})
</script>
<style type="text/css">

html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background: linear-gradient(166.25deg, #514C9C 9.17%, #653A99 30.43%, #78377F 51.28%, #881E51 84.23%);
}

input{ 
	border:2px solid; 
	border-radius: 5px;
 }

.select{
 	width: 420px;
 	margin: 15px;
 	position:relative;
}

/* 로그인창으로(뒤로가기)  */
.hre{
	position: fixed;
	bottom: 40px;
    text-decoration-line: none;
    margin-left:480px;
    margin-bottom:110px;
    color:white;
}
 
.select input[type=text]{
	width: 420px;
	height: 35px;

} 
.select input[type=password]{
	width: 420px;
	height: 35px;
} 
.select input[type=email]{
	width: 420px;
	height: 35px;
} 

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 430px;
	height: 35px;
}

.msg, #mail-check-warn{
	color:red;
}
#chk_btn{
	padding:0px 0px 0px 0px;
}

* {
    font-size: 16px;
    font-family: Consolas, sans-serif;
}
/* 중복아이디 존재하지 않으면 */
.id_input1{
	color:green;
	display:none;
}

/* 중복아이디 존재한다면 */
.id_input2{
	color:red;
	display:none;
}
/* 중복닉네임 존재하지 않으면 */
.nick_input1{
	color:green;
	display:none;
}

/* 중복닉네임 존재한다면 */
.nick_input2{
	color:red;
	display:none;
}
/* 아이디중복확인 버튼 */
.id_input{
	position: absolute;
	top: 30px;
	right: -120px;
	border-radius:7px;
}
/*  viva 로고 부분 */
#login_wrap_logo {
    margin: 0 auto;
    width: 250px;
}
#login_wrap_logo img {
    width: 250px;
}
/* 닉네임중복확인 버튼 */
.nick_input{
	position: absolute;
	top: 27px;
	right: -145px;
	border-radius:7px;
}

</style>

</head>
<body>

<div id="login_wrap">
	<div id="login_wrap_logo"><a href="/"><img class="layout_logo" src="/resources/icon/viva_icon_final.svg"></a></div><br>
	
	<div class="login_wrap_part" id="login_input">
		<form action="./kakaojoin" method="post">
		
			<div class="select">
				<label for="userId" style="color:white;" >아이디</label><br>
				<input type="text"  id="userId" name="userId"  placeholder="6자 이상, 20자 이하의 영문자,숫자만 가능">
				<span id="userid_msg" class="msg"></span>
				<button type="button" value="ID중복확인" class="id_input">ID중복확인</button>
				<span class="id_input1">사용 가능한 아이디입니다.</span>
				<span class="id_input2">아이디가 이미 존재합니다.</span>
			</div>
				
			<div class="select">
				<label for="userPw" style="color:white;">비밀번호</label>
				<input type="text"  id="userPw" name="userPw" placeholder="알파벳 대소문자, 숫자, 특수기호 조합으로 8~20자">
				<span id="userpw_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<label for="userpw_check" style="color:white;">비밀번호 재확인</label>
				<input type="text"  id="userpw_check" name="userpw_check" >
				<span id="userpwcheck_error" class="msg"></span>
			</div>
			
			<div class="select">
				<label for="userName" style="color:white;">이름</label>
				<input type="text"  id="userName" name="userName">
				<span id="username_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<label for="userBirth" style="color:white;">생년월일</label>
				 <input type="date"  id="userBirth" name="userBirth" required="required">
		<!-- 			<input type="text" name="userBirth" placeholder="YYYY/MM/DD" > -->
				<span id="userbirth_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<label for="userNick" style="color:white;">닉네임</label>
				<input type="text"  id="userNick" name="userNick" required="required">
				<span id="usernick_msg" class="msg"></span>
				<button type="button" value="닉네임중복확인" class="nick_input">닉네임중복확인</button>
				<span class="nick_input1">사용 가능한 닉네임입니다.</span>
				<span class="nick_input2">닉네임이 이미 존재합니다.</span>
			</div>
			
			<div class="select">
				<label for="userEmail" style="color:white;">이메일</label>
				<input class="useremail" type="email"  id="userEmail" name="userEmail" required="required">
				<span id="useremail_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<label for="userMobile" style="color:white;">휴대전화</label>
				<input type="text"  id="userMobile" name="userMobile" pattern="[0-9]+" placeholder="ex)01099999999" required="required">
				<span id="usermobile_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<button id="btn">가입하기</button>
			</div>
			
			<a href="./login" class="hre">뒤로가기</a>
		
		</form>
	</div>
</div>
</body>
</html>

