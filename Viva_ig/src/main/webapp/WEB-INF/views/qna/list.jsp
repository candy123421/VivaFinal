<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">

.qnalist{
	display: grid;
	grid-template-columns: 100px 400px 200px 250px 100px;
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
#titleWrap{
	width: 1400px;
	margin: 0 auto;
	border-bottom: 3px solid #ccc;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}
#pagingWrap{
	width: 1050px;
	margin: 0 auto;
	display: grid;
	padding-top: 15px;
	place-content: center;
}

.menu{
	width: 1050px; 
	margin: 0 auto;
	display: grid;
	place-content: center;
	padding-top: 15px;
}
</style>
<c:import url="../layout/header.jsp"/>



<title>QnA List</title>
</head>
<body>
<div id="titleWrap">
	Viva QnA List
</div>
	  <c:choose>
	  
	  <c:when test="${empty adminlogin and empty login }">
	  로그인 후 이용해주세요!
	  <a href="/viva/login"> <button class="btn btn-outline-secondary btn-sm">Login</button> </a>
	  </c:when>
	  
	  
	  
	  <c:when test="${not empty adminlogin and adminlogin }">
	  <div class="total">
		  <div class="qnalist">
				<div class="item">문의번호</div>
				<div class="item">문의제목</div>
				<div class="item">처리여부</div>
				<div class="item">문의 작성일</div>
				<div class="item">유저번호</div>
			
			<c:forEach var="qnalist" items="${qnalist }">
				<div class="item">${qnalist.qNo}</div>
				<div class="item"><a href="./view?qNo=${qnalist.qNo}" >${qnalist.qTitle }</a></div>
				<div class="item">${qnalist.qProcess }</div>
				<div class="item"><fmt:formatDate value="${qnalist.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
				<div class="item">${qnalist.userNo }</div>
			</c:forEach>
				<span class="float-end mb-3">total : ${paging.totalCount }</span>
				<div class="clearfix"></div>
			</div>
			<div id="pagingWrap">
				<c:import url="/WEB-INF/views/layout/qnapaging.jsp" />
			</div>
		</div>

	  </c:when>
	  
	  <c:when test="${not empty login and login }">
	  	  <div class="qnalist">
			<div class="item">문의번호</div>
			<div class="item">문의제목</div>
			<div class="item">처리여부</div>
			<div class="item">문의 작성일</div>
			<div class="item">유저번호</div>
	
		<c:forEach var="userqna" items="${userqna }">
			<div class="item">${userqna.qNo}</div>
			<div class="item"><a href="./view?qNo=${userqna.qNo}" >${userqna.qTitle }</a></div>
			<div class="item">${userqna.qProcess }</div>
			<div class="item"><fmt:formatDate value="${userqna.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
			<div class="item">${userqna.userNo }</div>
			
		</c:forEach>
		
		</div>
	  
	  <div class="menu">
		<a href="/qna/question" ><button class="btn btn-outline-secondary">문의하기</button></a>
	  </div>
	  
	  </c:when>
	  
	  
	  </c:choose>






</body>
</html>