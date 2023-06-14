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
	$("#userPw").focus(function(){
		$("#userpw_msg2").html("")	
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
/*  지선 수정*/
	background: linear-gradient(166.25deg, #514C9C 9.17%, #653A99 30.43%, #78377F 51.28%, #881E51 84.23%);
}

/*  viva 로고 부분 */
.login_wrap_part {
	width : 606px;
	height: 638px;
	background: linear-gradient(360deg, #FFFFFF 0%, rgba(255, 255, 255, 0.89) 136.89%);
	border-radius: 10px;

}
/*  내용 적는 흰 박스 부분 */
form {
	width : 530px;
	margin: 0 auto;
  	padding-top: 100px;
}

input {
  	border:none;  
 	background: transparent; 
	border-bottom: 1px solid black;
}
input:focus {
	outline:none;
}

#login_wrap_logo {
    margin: 0 auto;
    width: 250px;
}
#login_wrap_logo img {
    width: 250px;
}
/*  form 내부 각 요소 한줄씩에 대한 설정 */
.select{
	margin : 0 auto;
	padding-bottom : 30px;
}

.select img {
	width : 532px;
	height : 53px;
	cursor : pointer;
}
 
.select input[type=text]{
	width: 380px;
	height: 22px;
	float : right;

} 
.select input[type=password]{
	width: 380px;
	height: 22px;
	float : right;

} 

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 310px;
	height: 50px;
}

.noline{
	 text-decoration-line: none;
	 color: #575555;
}
/*  아이디 찾기 + 비밀번호 찾기 줄 */
#find_id_pw {
	width : 208px;
	margin : 0 auto;

}

/*  체크박스 + 아이디 저장 줄 */
#auto_id_save { 
	width : 115px;
    margin-right: 274px;
    margin-bottom: 45px;
}
button {
 	border : none;
 	background : transparent;
 	
}

#loginbtns{
	width:520px;
}
#userid_msg{
	float:right;
	margin-right:218px;
}
#userpw_msg{
	float:right;
	margin-right:204px;
}
#userpw_msg2{
	float:right;
	margin-right:147px;
}
</style>

</head>
<body>
<div id="login_wrap">
	<div id="login_wrap_logo"><a href="/"><img class="layout_logo" src="/resources/icon/viva_icon_final.svg"></a></div><br>
	
	<div class="login_wrap_part" id="login_input">
		<form action="./login" method="post">
		
			<div class="select">
			
				<label for="userId" >ID</label>
				<input type="text" class="boxcolor" id="userId" name="userId" value="${cookie.id.value}" placeholder="아이디">
				<div>
					<span id="userid_msg" class="msg" style="color:red"></span>
				</div>
			</div>
				
			<div class="select">
				<label for="userPw" >PASSWORD</label>
				<input type="password" class="boxcolor" id="userPw" name="userPw" placeholder="비밀번호">
				<div>
					<span id="userpw_msg" class="msg" style="color:red"></span>
					<span id="userpw_msg2" class="msg" style="color:red">${msg }</span>
				</div>
			</div>
			
			<div class="select" id="auto_id_save">
				 <label for="rememberId"></label>
		        <input type="checkbox" name="rememberId" id="rememberId" ${empty cookie.id.value ? "":"checked" }/>
				아이디 저장
			</div>
					
			<div class="select click_button"> <!--  일반 로그인 버튼 -->
<!-- 				<button id="btn">로그인</button> -->
				<button><img id="loginbtns" src="/resources/icon/new_login_btn.svg"></button>
			</div>
			
			<div class="select click_button"> <!--  카카오 로그인 버튼 -->
		        <a href="https://kauth.kakao.com/oauth/authorize?client_id=709641586592b61e7e148fb086efd03f&redirect_uri=http://localhost:8888/users/kakaologin&response_type=code">
		<!-- 			<img id="kakao" src="/resources/img/kakao_login_medium_wide.png"> -->
					<img id="kakao" src="/resources/icon/new_kakao_login_btn.svg">
		        </a>
		   </div>
			<div class="select click_button"> <!--  회원가입 버튼 -->
				<a href="./join" class="noline"><img src="/resources/icon/new_join_us_btn.svg"></a>
				
		   </div>
			<div class="select" id="find_id_pw">
				<a href="./idcheck" class="noline">아이디 찾기 | </a>
				<a href="./pwcheck" class="noline">비밀번호 찾기</a>
			</div>
		
		</form>
	</div>
</div>
</body>
</html>
