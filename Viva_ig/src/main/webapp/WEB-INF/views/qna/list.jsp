<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.qnalist{
	display: grid;
	grid-template-columns: 100px 400px 200px 250px 100px;
	border: 1px #BB2649 solid;
	
	}


</style>
<c:import url="../layout/header.jsp"/>



<title>QnA List</title>
</head>
<body>
<h1>Viva QnA List</h1>
<hr>
	  <c:choose>
	  
	  <c:when test="${empty adminlogin and empty login }">
	  로그인 후 이용해주세요!
	  <a href="/viva/login"> <button class="btn btn-outline-secondary btn-sm">Login</button> </a>
	  </c:when>
	  
	  
	  
	  <c:when test="${not empty adminlogin and adminlogin }">
	  <div class="qnalist">
			<div class="item">문의번호</div>
			<div class="item">문의제목</div>
			<div class="item">처리여부</div>
			<div class="item">문의 작성일</div>
			<div class="item">유저번호</div>
	
		</div>
		<div class="qnalist">
		<c:forEach var="qnalist" items="${qnalist }">
			<div class="item">${qnalist.qNo}</div>
			<div class="item"><a href="./view?qNo=${qnalist.qNo}" >${qnalist.qTitle }</a></div>
			<div class="item">${qnalist.qProcess }</div>
			<div class="item"><fmt:formatDate value="${qnalist.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
			<div class="item">${qnalist.userNo }</div>
			
		</c:forEach>
		
		</div>


	  </c:when>
	  
	  <c:when test="${not empty login and login}">
	  	  <div class="qnalist">
			<div class="item">문의번호</div>
			<div class="item">문의제목</div>
			<div class="item">처리여부</div>
			<div class="item">문의 작성일</div>
			<div class="item">유저번호</div>
	
		</div>
		<div class="qnalist">
		<c:forEach var="qnalist" items="${qnalist }">
			<div class="item">${qnalist.qNo}</div>
			<div class="item"><a href="./view?qNo=${qnalist.qNo}" >${qnalist.qTitle }</a></div>
			<div class="item">${qnalist.qProcess }</div>
			<div class="item"><fmt:formatDate value="${qnalist.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
			<div class="item">${qnalist.userNo }</div>
			
		</c:forEach>
		
		</div>
	  
		<a href="/qna/question" ><button class="btn btn-outline-secondary">문의하기</button></a>
	  
	  
	  </c:when>
	  
	  
	  </c:choose>






</body>
</html>