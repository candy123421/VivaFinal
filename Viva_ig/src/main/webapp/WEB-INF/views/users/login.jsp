<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

//--------------------------------유효성검사-------------------------------
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 아이디,비밀번호 : 정규화 
		if(validate()){
			console.log("click") 
			return false
		}
		return true
	})
	
	
	//아이디 입력란 클릭시 밑에 메시지 없애기
	$("#userId").focus(function(){
		$("#userid_msg").html("")	
	})
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
})

//아이디,비밀번호 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//가입하기버튼 눌렀을 때 아이디 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return true;
	}
	
	//가입하기버튼 눌렀을 때 비밀번호 유효성검사
	if($('#userPw').val()==''){
		$('#userpw_msg').html("비밀번호를 입력해주세요")
		return true;
	}
	return false;
}

</script>

<style type="text/css">

html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background-color:#FFD0AF; 
}

/* .boxcolor{ */
/* 	border-radius: 7px; */
/* } */

input{
	border:2px solid; 
	border-radius: 5px;
}

.select{
 	width: 300px;
 	margin: 20px;
}
 
.select input[type=text]{
	width: 300px;
	height: 35px;

} 
.select input[type=password]{
	width: 300px;
	height: 35px;

} 

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 310px;
	height: 50px;
}

#kakao{
	width: 310px;
	height: 50px;
}

.noline{
	 text-decoration-line: none;
}
</style>

</head>
<body>

<form action="./login" method="post">

	<h3 style="text-align:center; font-size:30px; color:#E57733;">Viva</h3><br>
	
	
	<div class="select">
	
		<label for="userId" ></label>
		<input type="text" class="boxcolor" id="userId" name="userId" value="${cookie.id.value}" placeholder="아이디">
		<span id="userid_msg" class="msg" style="color:red"></span>
	</div>
		
	<div class="select">
		<label for="userPw" ></label>
		<input type="password" class="boxcolor" id="userPw" name="userPw" placeholder="비밀번호">
		<span id="userpw_msg" class="msg" style="color:red"></span>
	
	</div>
	
	<div class="select">
		 <label for="rememberId"></label>
        <input type="checkbox" name="rememberId" id="rememberId" ${empty cookie.id.value ? "":"checked" }/>
		아이디 저장
	</div>
			
	<div class="select">
		<button id="btn">로그인</button>
	</div>
	
	<div class="select">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=709641586592b61e7e148fb086efd03f&redirect_uri=http://localhost:8888/users/kakaologin&response_type=code">
			<img id="kakao" src="/resources/img/kakao_login_medium_wide.png">
        </a>
   </div>
		
	<div class="select">
		<a href="./idcheck" class="noline">아이디 찾기 | </a>
		<a href="./pwcheck" class="noline">비밀번호 찾기 | </a>
		<a href="./join" class="noline">회원가입</a>
	</div>

</form>

</body>
</html>

