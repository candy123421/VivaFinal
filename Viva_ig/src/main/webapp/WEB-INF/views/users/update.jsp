<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<script type="text/javascript"> 

$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("#btn").click(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 비밀번호 : 정규화 
		if(!validate()){
			return false;
		}
		return true;
	})
	
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
	
	//닉네임 중복 검사
	$(".nick_input").on("click", function(){
	
		var userNick = $("#userNick").val();
		var data = {userNick : userNick}
		
		//닉네임 입력란 클릭시 밑에 메시지 없애기
		$("#userNick").focus(function(){
			$("#usernick_msg").html("")	
		})
		
		$.ajax({
			type:"get",
			url: " /users/userNickChk2",
			data : data,
			success: function(result){
				//
				if(result != "fail" ){
					isNickCheck=true;
					//중복아이디가 없어서 사용가능한 닉네임입니다
					$("#usernick_msg").html("사용가능한 닉네임입니다");
				}else {
					isNickCheck=false;
					//중복닉네임이므로 '닉네임 이미 존재합니다' 띄우기
					$("#usernick_msg").html("이미 존재하는 닉네임입니다");
				}
				
			}
		})
	})
	//닉네임 중복이면 submit불가
	 $('#btn').click(function() {
	     if(!isNickCheck){
	         alert('닉네임이 중복되었습니다.');
	         return false;
	      }else{
	         return true;
	      }
	})
})

// 아이디,비밀번호,이름,생년월일 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//비밀번호 정규화
    var pwReg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		   
	if( !pwReg.test( $("#userPw").val() ) )  {
	      $("#userpw_msg").html("알파벳 대소문자, 숫자, 특수기호 조합으로 8~20자 이하로 작성")
	      return false
	}	
	return true;
}
</script>

<style type="text/css">
#wrap{
	width: 1400px;
	margin: 0 auto;
}
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

/* 프로필 글자 */
.contentSmalls{
	font-size:26px;
	margin-top: 50px;
	margin-bottom: 50px;
}

/* 컬럼명 글자 */
.contentSmall{
	font-size:22px;
	padding:2px;
	border-bottom: 3px solid #ccc;
	height: 100px;
	display: grid;
	align-items: center;
}

/* 회원정보 글자 */
.contentMedium{
	font-size:22px;
	padding:2px;
	text-align:end;
	border-bottom: 3px solid #ccc;
	height: 100px;
	display: grid;
	align-items: center;
}

/* 닉네임중복확인 버튼 */
.nick_input{
	position: absolute;
	top:-379px;
	right:-523px;
	border-radius: 6px;
}
#btn{
	top: 60px;
	left: 110px;
	z-index: 80;
}

#re{
	position:relative;
	z-index: 80;
}
#imgwrap{
	width: 92px;
}
#btnWrap{
	width: 1400px;
	margin: 0 auto;
	text-align: -webkit-center;
	margin-top: 30px;
	height: 150px;
}
.btna{
	display: inline-block;
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 120px;
	height: 50px;
}
#fileWrap{
	position:relative;
}

#userProfile{
	position: absolute;
	top:-68px;
	right:-748px;
}
#userPw , #userNick{
	border: 2px solid ;
  	border-radius: 10px;
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
					<div class="contentMedium" >
						<div id="imgwrap">
							<img src="<%=request.getContextPath() %>/profile/${userProfile}" style="width: 100%; border-radius: 50%; margin-left:300px;">
								<div id="fileWrap">
									<input type="file" id="userProfile"  accept=".jpg, .png, .gif" name="profile">
								</div>
						</div>
					</div>
					<div class="contentSmall"><div>아이디</div></div>
					<div class="contentMedium">${userInfo.userId}</div>
					
					<div class="contentSmall">비밀번호</div>
					<div class="contentMedium">
						<input type="password" id="userPw" name="userPw" value="${userInfo.userPw}">
						<div>
							<span id="userpw_msg" class="msg" style="color:red; font-size:12px;"></span>
						</div>
					</div>
					
					<div class="contentSmall">이름</div>
					<div class="contentMedium">${userInfo.userName}</div>
					
					<div class="contentSmall">닉네임</div>
					<div class="contentMedium">
						<input type="text" id="userNick" name="userNick" value="${userInfo.userNick}">
						<div>
							<span id="usernick_msg" class="msg" style="color:red; font-size:12px;"></span>
						</div>
					</div>
						
					<div class="contentSmall">생일</div>
					<div class="contentMedium">
						<fmt:formatDate value="${userInfo.userBirth}" pattern="yyyy-MM-dd"/>
					</div>
					<div class="contentSmall">이메일</div>
					<div class="contentMedium">${userInfo.userEmail}</div>
					<div class="contentSmall">연락처</div>
					<div class="contentMedium">${userInfo.userMobile}</div>
					
						<div id="re">
							<button type="button" value="닉네임중복확인" class="nick_input">닉네임중복확인</button>
						</div>
					
					</div>
				</div>
			</div>	
			<div class="contentSide"></div>	
	</div>
</div>
<div id="btnWrap">
	<button id="btn" class="btna" style="margin-right: 30px;">수정하기</button>	
	<a href="./mypage"><button type="button" class="btna">뒤로가기</button></a>
</div>
</form>

<c:import url="../layout/footer.jsp" />