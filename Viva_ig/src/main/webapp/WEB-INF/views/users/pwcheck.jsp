<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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
 	position: relative;
}

.select input[type=text]{
	width: 300px;
	height: 35px;

} 
.select input[type=password]{
	width: 300px;
	height: 35px;

} 

#pw_check{
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

/* 이메일 @.com 뒤에꺼 버튼 */
.form-controll{
	position: absolute;
	top: 9px;
 	right:  -133px; 
}

.btn-btn-primary{
	position: absolute;
	top: 48px;
	right:18px;
	border-radius:7px;
}

.mail-check-input{
	margin-top:10px;
}

#mail-check-warn , #userid_msg{
	color:red;
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

<script type="text/javascript">

//비밀번호찾기 이메일인증(ajax) 
$(function(){

	//아이디 입력란 클릭시 밑에 메시지 없애기
	$("#userId").focus(function(){
		$("#userid_msg").html("")	
	})
	
	$('#mail-Check-Btn').click(function() {
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		var userEmail = $("#userEmail1").val();
		
		if( userEmail == '' ) {
			$('#mail-check-warn').html("이메일을 입력해주세요")
			return
		}
		
		$.ajax({
			type : 'get',
			url : '/users/mailCheck?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				if(data){
				checkInput.attr('disabled',false);
				alert('인증번호가 전송되었습니다.')
				}
			}
			,error : function() {
				console.log("실패!")
			}
		}); // end ajax
	}); // end send email
	
	var code = ""; // 인증번호 저장을 위한 코드
	var isCertification = false; // 인증 여부 변수
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		//사용자가 입력한 인증번호를 비교하는 AJAX
		$.ajax({
			type : 'POST',
			data: {inputCode: inputCode},
			url : '/users/mailCheck'
			,success : function (data) {
				console.log("data : " +  data);
				if(data){
					isCertification = true;
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color','green');
					$('#mail-Check-Btn').attr('disabled',true);
					$('#pw_check').attr('disabled',false);
					$('#userEmail1').attr('readonly',true);
					$('#userEmail2').attr('readonly',true);
					$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
			        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				} else{
					isCertification = false;
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					$resultMsg.css('color','red');
				}
				
			}
			,error : function() {
				console.log("실패!")
			}
		}); // end ajax
	})
	
// 	인증번호가 다르면 sumit 안되게
    $('#pw_check').click(function() {
        	 console.log("zmffl")
    	
        if(!isCertification){
            alert('인증이 완료되지 않았습니다.');
            return false;
         }else{
        	 console.log("인증 성공!")
            return true;
         }
    })
    
    //이메일 입력란 클릭시 밑에 메시지 없애기
	$("#userEmail").focus(function(){
		$("#mail-check-warn").html("")	
	})
    
    //비밀번호 찾기를 눌렀을 때 ajax를 이용하여 DB에 아이디, 이메일이 존재하면 pwchange 페이지로 넘기기
	$("#pw_check").on("click", function(){
		var userId = $("#userId").val();
		var Email1 = $("#userEmail1").val();
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일2 : ' + email); // 이메일 오는지 확인
		
		console.log(userId)
		console.log(email)
		
		if( userId == '' ) {
			$('#userid_msg').html("아이디를 입력해주세요")
			return
		}
		
		if( Email1 == '' ) {
			$('#mail-check-warn').html("이메일을 입력해주세요")
			return
		}
		
		//비밀번호 찾기시 아이디과 이메일 존재여부 확인
		$.ajax({
			type:"get",
			url: " /users/checkIdEmail",
			data : {
				"userId":userId,
				"userEmail":email
			},
			dataType : "json",
			success:function(res){
				
				//result가 DB에 이름과 닉네임 존재하면 success을 리턴
				if(res.result == true){
// 					alert("당신의 아이디는 : "+res.userId)
					location.href="./pwchange?userNo="+res.userNo
				}
			}, error: function() {
				console.log("ajax 실패")
				alert("아이디, 이메일이 일치하지않습니다")
				location.href="./pwcheck"
			}
		})
	})
})	


</script>

</head>
<body>

<div id="login_wrap">
	<div id="login_wrap_logo"><a href="/"><img class="layout_logo" src="/resources/icon/viva_icon_final.svg"></a></div><br>
	
	<div class="login_wrap_part" id="login_input">	
<!-- 	<input type="hidden" id="compare" value="0"> -->
	
		<div class="select">
<!-- 			<label for="userId">아이디</label> -->
			<input type="text"  id="userId" name="userId" class="name_bord2" placeholder="아이디">
			<span id="userid_msg" class="msg"></span>
		</div>
		
		<div class="select">
<!-- 			<label for="userEmail">이메일</label> -->
			<input class="userEmail" type="text"  id="userEmail1" name="userEmail1" placeholder="이메일 인증을 해주세요">
			<select class="form-controll" id="userEmail2" name="userEmail2">
				<option>@naver.com</option>
				<option>@daum.net</option>
				<option>@gmail.com</option>
				<option>@hanmail.com</option>
				<option>@yahoo.co.kr</option>
			</select>
			<input type="hidden" id="userEmail" name="userEmail">
			
			<div class="mail-check-box">
				<input class="mail-check-input" placeholder="인증번호 6자리 입력!" disabled="disabled" maxlength="6">
			</div>
			
			<div class="input-group-addon">
				<button type="button" class="btn-btn-primary" id="mail-Check-Btn">인증코드전송</button>
			</div>
			
			<div>
				<span id="mail-check-warn" class="msg"></span>
			</div>
		</div>
		
		<div class="select">
			<button id="pw_check" class="auth" disabled="disabled">비밀번호 변경하기</button>
		</div>
			
		<div class="select" style="font-size:12px; color:white;">아이디를 찾으시겠습니까?
			<a href="./idcheck" class="noline">아이디 찾기 | </a>
			<a href="./login" class="noline">뒤로가기</a>
		</div>
		
	</div>
</div>	
</body>
</html>