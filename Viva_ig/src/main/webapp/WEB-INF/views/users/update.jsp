<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript"> 

$(function(){
	//닉네임 중복 검사
	$(".nick_input").on("click", function(){
	// 		console.log("keyup 테스트");
	
		var userNick = $("#userNick").val();
		var data = {userNick : userNick}
		
		if(userNick == ''){
			$('#usernick_msg').html("닉네임을 입력해주세요")
			return
		}
		
		//닉네임 입력란 클릭시 밑에 메시지 없애기
		$("#userNick").focus(function(){
			$("#usernick_msg").html("")	
		})
		
		$.ajax({
			type:"get",
			url: " /users/userNickChk",
			data : data,
			success: function(result){
				//
				if(result != "fail"){
					//중복아이디가 없어서 사용가능한 닉네임입니다
					$(".nick_input1").html("display","inline-block");
					//span input2는 안보이게
					$(".nick_input2").css("display","none");
				}else{
					//중복닉네임이므로 '닉네임 이미 존재합니다' 띄우기
					$(".nick_input1").css("display","none");
					$(".nick_input2").css("display","inline-block");
				}
				
			}
		})
	})
	
// 	//수정하기 버튼을 누르면 ./change ajax실행 후 마이페이지로 redirect
// 	$(".change").on("click", function(){
// 		var userPw = $("#userPw").val();
// 		var userNick = $("#userNick").val();
		
// 		if( userPw == '' ) {
// 			$('#userpw_msg').html("비밀번호를 입력해주세요")
// 			return
// 		}
		
// 		if( userNick == '' ) {
// 			$('#usernick_msg').html("닉네임을 입력해주세요")
// 			return
// 		}
		
// 		console.log(userPw)
// 		console.log(userNick)
		
// 		//비밀번호 찾기시 아이디과 이메일 존재여부 확인
// 		$.ajax({
// 			type:"get",
// 			url: " /users/change",
// 			data : {
// 				"userId":userId,
// 				"userEmail":userEmail
// 			},
// 			dataType : "json",
// 			success:function(res){
				
// 				//result가 DB에 이름과 닉네임 존재하면 success을 리턴
// 				if(res.result == true){
// // 					alert("당신의 아이디는 : "+res.userId)
// 					location.href="./pwchange?userNo="+res.userNo
// 				}
// 			}, error: function() {
// 				console.log("ajax 실패")
// 				alert("아이디, 이메일이 일치하지않습니다")
// 				location.href="./pwcheck"
// 			}
// 		})
// 	})
	
})
	
</script>

<style type="text/css">
#grid{
	display: grid;
	grid-template-rows: 80px
}
#colgrid{
	display: grid;
	grid-template-columns: 300px 200px 200px 200px 200px 200px 
}
 #colgrid2{ 
 	display: grid;
 	grid-template-columns: 250px 800px 250px 
 }
 
 #colgrid3{
 	display:grid;
 	grid-template-columns: 400px 400px
 }
 
.items{
	padding: 1rem 0;
	padding-bottom: 0px;
	border-bottom: 1px solid #ccc;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    min-height: 5rem;
    font-size:20px;
}

a {
  text-decoration-line: none;
  color:black;
}
#wrap{
	padding-left: 16px;
}
.contentMiddle{
/* 	border-left: 1px solid #ccc; */
/* 	border-right: 1px solid #ccc; */
}

/* 프로필 글자 */
.contentSmalls{
	font-size:26px;
	padding:20px;
	margin:8px;
}

/* 컬럼명 글자 */
.contentSmall{
	font-size:22px;
	padding:2px;
	margin:25px;
	border-bottom: 1px solid #ccc;
}

/* 회원정보 글자 */
.contentMedium{
	font-size:22px;
	padding:2px;
	margin:25px;
	text-align:end;
	border-bottom: 1px solid #ccc;
}

/* .select{ */
/*  	width: 420px; */
/*  	margin: 15px; */
/*  	position: relative; */
/* } */

/* 닉네임중복확인 버튼 */
.nick_input{
	position: absolute;
	top: 629px;
	right:179px;
}
</style>

<form action="./update" method="post" enctype="multipart/form-data">
<div id="wrap">
	<div id="grid">
	
		<div id="colgrid">
			<div class="items"><h1>마이페이지</h1></div>
			<div class="items"><a href="./mypage">회원정보</a></div>
			<div class="items"><a href="">내가 쓴글</a></div>
			<div class="items"><a href="">내 음원</a></div>
			<div class="items"><a href="">결제내역</a></div>
			<div class="items"><a href="./question">문의하기</a></div>
		</div>	
		
		<div id="colgrid2">
			<div class="contentSide"></div>		
			<div class="contentMiddle">
					<div class="contentSmalls">프로필</div>
				<div id="colgrid3">
					<div class="contentSmall">프로필 사진</div>
					<div class="contentMedium"><input type="file" id="userProfile" name="profile"></div>
					<div class="contentSmall">아이디</div>
					<div class="contentMedium">${userInfo.userId}</div>
					<div class="contentSmall">비밀번호</div>
					<div class="contentMedium"><input type="text" id="userPw" name="userPw" placeholder="비밀번호"></div>
<!-- 					<span id="userpw_msg" class="msg"></span> -->
					<div class="contentSmall">이름</div>
					<div class="contentMedium">${userInfo.userName}</div>
					<div class="contentSmall">닉네임</div>
					<div class="contentMedium"><input type="text" id="userNick" name="userNick" placeholder="닉네임"></div>
<!-- 					<span id="usernick_msg" class="msg"></span> -->
<!-- 					<button type="button" value="닉네임중복확인" class="nick_input">닉네임중복확인</button> -->
<!-- 					<span class="nick_input1" >사용 가능한 닉네임입니다.</span> -->
<!-- 					<span class="nick_input2">닉네임이 이미 존재합니다.</span></div> -->
					<div class="contentSmall">생일</div>
					<div class="contentMedium"><fmt:formatDate value="${userInfo.userBirth}" pattern="yyyy-MM-dd"/></div>
					<div class="contentSmall">이메일</div>
					<div class="contentMedium">${userInfo.userEmail}</div>
					<div class="contentSmall">연락처</div>
					<div class="contentMedium">${userInfo.userMobile}</div>
				</div>
			</div>	
			<div>
				<button>수정하기</button>	
				<a href="./mypage"><button type="button">뒤로가기</button></a>
			</div>
				
			<div class="contentSide"></div>	
		</div>
		<div>
		</div>
	</div>
</div>

</form>

<c:import url="../layout/footer.jsp" />