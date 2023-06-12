<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp"/>

<style type="text/css">

.userlist{
	display: grid;
	grid-template-columns: 100px 200px 200px 250px 100px;
	border: 2px #ffd4de solid;
	border-radius: 10px;
	width: 1050px;
	text-align: center;
	margin: auto;
	grid-row-gap: 15px;
	background: #fef6fc;
}
.total{
	width: 1400px;
	margin: 0 auto;	
}
#pagingWrap{
	width: 1050px;
	margin: 0 auto;
	display: grid;
	padding-top: 15px;
	place-content: center;
}
#titleWrap{
	width: 1400px;
	margin: 0 auto;
	border-bottom: 3px solid #ccc;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}

</style>

<title>usergrade</title>
</head>
<body>
<div id="titleWrap">
	Viva User List
</div>

<div>
	<c:choose>
		<c:when test="${empty adminlogin and empty login}">
		<span style="color: red; font-size: 2.5em;">이 곳은 관리자 구역입니다. 접근금지!</span><br>
		관리자는 로그인을 해주세요!
		<a href="/admin/login"> <button class="btn btn-outline-secondary btn-sm">Login</button> </a>
		</c:when>
		
		
		<c:when test="${not empty adminlogin and adminlogin }">
		<div class="total"> 
			<div class="userlist">
				<div class="item">회원번호</div>
				<div class="item">ID</div>
				<div class="item">닉네임</div>
				<div class="item">등급</div>
				<div class="item">가입일</div>
			
			<c:forEach var="userlist" items="${userlist }">
				<div class="item">${userlist.userNo }</div>
				<div class="item">${userlist.userId }</div>
				<div class="item">${userlist.userNick }</div>
				<div class="item">${userlist.userGrade }</div>
				<div class="item"><fmt:formatDate value="${userlist.userJoindate }" pattern="yyyy-MM-dd"/></div>
			</c:forEach>
				<span class="float-end mb-3">total : ${paging.totalCount }</span>
				<div class="clearfix"></div>
			</div>
				<div id="pagingWrap">
					<c:import url="/WEB-INF/views/layout/qnapaging.jsp" />
				</div>
			</div>
		</c:when>
		
		
	</c:choose>
		
		
		
		
		
</div>
		
		






</body>
</html>