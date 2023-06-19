<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/header.jsp"/>
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
}
#lastbtn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 120px;
	height: 50px;
}
</style>

<div id="wrap">
	<div id="grid">
	
		<div id="colgrid">
			<div class="items"><h1>마이페이지</h1></div>
			<div class="items"><a href="./mypage">회원정보</a></div>
			<div class="items"><a href="">내가 쓴글</a></div>
			<div class="items"><a href="./mysource">내 음원</a></div>
			<div class="items"><a href="/credit/list">결제내역</a></div>
			<div class="items"><a href="/qna/list">문의하기</a></div>
		</div>	
		
		<div id="colgrid2">
			<div class="contentSide"></div>		
			<div class="contentMiddle">
					<div class="contentSmalls">프로필</div>
				<div id="colgrid3">
					<div class="contentSmall">프로필 사진</div>
					<div class="contentMedium">
						<div id="imgwrap">
							<img src="<%=request.getContextPath() %>/profile/${userProfile}" style="width: 100%; border-radius: 50%; margin-left:300px;">
						</div>
					</div>
					<div class="contentSmall"><div>아이디</div></div>
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
					<div class="contentSmall">회원등급</div>
					<div class="contentMedium">
						<c:if test="${grade eq '0'}">
							<c:out value="일반회원" />
						</c:if>
	  					<c:if test="${grade eq '1'}">
	  						<c:out value="사운드디자이너 회원" />
	  					</c:if>
  					</div>
				</div>
			</div>		
			<div class="contentSide"></div>	
		</div>
	</div>
</div>
<div id="btnWrap">
	<a class="btna" href="./update" style="margin-right: 30px;"><button type="button" id="lastbtn">회원수정</button></a>
	<a class="btna" href="./delete"><button type="button" id="lastbtn">탈퇴하기</button></a>	
</div>


<c:import url="../layout/footer.jsp" />