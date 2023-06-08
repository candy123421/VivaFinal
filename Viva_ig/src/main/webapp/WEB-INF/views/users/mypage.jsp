<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/header.jsp"/>
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
/* 	margin:25px; */
	border-bottom: 1px solid #ccc;
	height: 100px;
}

/* 회원정보 글자 */
.contentMedium{
	font-size:22px;
	padding:2px;
/* 	margin:25px; */
	text-align:end;
	border-bottom: 1px solid #ccc;
	height: 100px;
}

#lastbtn{
	display:flex;
/* 	height :100vh; */
	justify-content: center;
	align-items: center;
}
#imgwrap{
	width: 100px;
	height:100px;
}
</style>

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
					<div id="imgwrap" class="contentMedium"><img src="../../../profile/${userProfile.STOREDNAME}" style="width: 100%"></div>
					<div class="contentSmall">아이디</div>
					<div class="contentMedium">${userInfo.userId}</div>
					<div class="contentSmall">이름</div>
					<div class="contentMedium">${userInfo.userName}</div>
					<div class="contentSmall">닉네임</div>
					<div class="contentMedium">${userInfo.userNick}</div>
					<div class="contentSmall">생일</div>
					<div class="contentMedium"><fmt:formatDate value="${userInfo.userBirth}" pattern="yyyy-MM-dd"/></div>
					<div class="contentSmall">이메일</div>
					<div class="contentMedium">${userInfo.userEmail}</div>
					<div class="contentSmall">연락처</div>
					<div class="contentMedium">${userInfo.userMobile}</div>
				</div>
			</div>		
<!-- 				<a href="./main"><button>메인으로</button></a> -->
		<div>
			<a href="./update"><button type="button" id="lastbtn">회원수정</button></a>
			<a href="./delete"><button type="button" id="lastbtn">탈퇴하기</button></a>	
		</div>
			<div class="contentSide"></div>	
		</div>
	</div>
</div>



<c:import url="../layout/footer.jsp" />