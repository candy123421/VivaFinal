<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

//아이디 중복 검사
$(function(){
	
	//닉네임 입력란 클릭시 밑에 메시지 없애기
	$("#userNick").focus(function(){
		$("#usernick_msg").html("")	
	})
	//이메일 입력란 클릭시 밑에 메시지 없애기
	$("#userEmail").focus(function(){
		$("#useremail_msg").html("")	
	})
	
	$("#id_check").on("click", function(){
		
		var userNick = $("#userNick").val();
		var userEmail = $("#userEmail").val();
		
		if( userNick == '' ) {
			$('#usernick_msg').html("닉네임을 입력해주세요")
			return
		}
		
		if( userEmail == '' ) {
			$('#useremail_msg').html("이메일을 입력해주세요")
			return
		}
		
		console.log(userNick)
		console.log(userEmail)
		
		//아이디 찾기시 이름과 이메일 존재여부 확인
		$.ajax({
			type:"get",
			url: " /users/checkIdPw",
			data : {
				"userNick":userNick,
				"userEmail":userEmail
			},
			dataType : "json",
			success:function(res){
				
				//result가 DB에 이름과 닉네임 존재하면 success을 리턴
				if(res.result == true){
					alert("당신의 아이디는 : "+res.userId)
				}
			}, error: function() {
				console.log("ajax 실패")
				alert("닉네임, 이메일이 일치하지않습니다")
				location.href="./idcheck"
			}
		})
	})
})

</script>

<style type="text/css">

html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background-color:#FFD0AF; 
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

#id_check{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 300px;
	height: 35px;
}

.noline{
	 text-decoration-line: none;
}
.msg{
	color:red;
}
</style>

</head>
<body>

	<h3 style="text-align:center; font-size:30px; color:#E57733;">Viva</h3><br>
	
	
	<div class="select">
		<label for="userNick" >닉네임</label>
		<input type="text" id="userNick" name="userNick">
		<span id="usernick_msg" class="msg"></span>
		
	</div>
		
	<div class="select">
		<label for="userEmail">이메일</label>
		<input type="text" id="userEmail" name="userEmail">
		<span id="useremail_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<button id="id_check">아이디 찾기</button>
	</div>
	
	<div class="select" style=font-size:12px;>비밀번호를 찾으시겠습니까?
	<a href="./pwcheck" class="noline">비밀번호 찾기 | </a>
	<a href="./login" class="noline">뒤로가기</a> 
	</div>

</body>
</html>