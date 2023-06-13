<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

//1. 처음 포커스 벗어났을 경우 메시지 띄우기
$(function(){
	
 	//비밀번호에 포커스
	$("#userPw").focus()
	
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
			$("#userpwcheck_msg").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_msg").html("비밀번호가 일치합니다")
		}
	})
	
	//비밀번호 재확인칸을 클릭했을 경우 -- click function
	//비밀번호입력과 비밀번호 재확인입력이 동일하지않을 경우 메시지
	$("#userpw_check").click(function(){	
		
		if($("#userPw").val() != $("#userpw_check").val()){
			$("#userpwcheck_msg").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_msg").html("비밀번호가 일치합니다")
		}
	})
})

// 2. 버튼 클릭했을 경우 비밀번호 정규화가 맞지않으면 메시지 띄우기
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 비밀번호 : 정규화 
		if(!validate()){
			return false
		}
		return true;
	})
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
	
})

// 비밀번호 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//비밀번호 변경버튼 눌렀을 때 비밀번호 유효성검사
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
})
//버튼을 클릭했을 경우 비밀번호와 비밀번호재확인이 일치하지않으면 버튼푸시 실패
//비밀번호와 비밀번호 재확인 입력 유효성검사
function compare_check(){
	
	//가입하기버튼 눌렀을 때 비밀번호 확인 유효성 검사
	if($("#userPw").val() != $("#userpw_check").val()){
		$("#userpwcheck_msg").html("비밀번호가 일치하지않습니다")
		return false;
	}
	return true
}

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
 	width: 300px;
 	margin: 35px;
}

.select input[type=text]{
	width: 300px;
	height: 35px;

} 
.select input[type=password]{
	width: 300px;
	height: 35px;

} 

.msg{
	color:red;
}

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 300px;
	height: 35px;
}

.noline{
	 text-decoration-line: none;
	 color:wheat;
}
/*  viva 로고 부분 */
#login_wrap_logo {
    margin: 0 auto;
    width: 250px;
}
#login_wrap_logo img {
    width: 250px;
}
input::placeholder {
 	 color:black;
}
</style>

</head>
<body>
<div id="login_wrap">
	<div id="login_wrap_logo"><a href="/"><img class="layout_logo" src="/resources/icon/viva_icon_final.svg"></a></div><br>
	
	<div class="login_wrap_part" id="login_input">
		<form action="./pwchange" method="post">
			<input type="hidden" name="userNo" value="${userNo}">
		
			<div class="select">
<!-- 				<label for="userPw">변경할 비밀번호</label> -->
				<input type="text"  id="userPw" name="userPw" placeholder="변경할 비밀번호">
				<span id="userpw_msg" class="msg"></span>
			</div>
			
			<div class="select">
<!-- 				<label for="userpw_check">비밀번호 재확인</label> -->
				<input type="text"  id="userpw_check" name="userpw_check" placeholder="비밀번호 재확인">
				<span id="userpwcheck_msg" class="msg"></span>
			</div>
			
			<div class="select">
				<button id="btn">변경하기</button>
			</div>
			
			<div class="select" style="font-size:12px; color:white;">아이디를 찾으시겠습니까?
				<a href="./idcheck" class="noline">아이디 찾기 | </a>
				<a href="./login" class="noline">뒤로가기</a>
			</div>
			
		</form>
	</div>
</div>
</body>
</html>