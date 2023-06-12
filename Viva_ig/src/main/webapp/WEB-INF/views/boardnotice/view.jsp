<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<div class="container">
<h1>NOTICE BOARD View</h1>
<hr>

<c:choose>
<%-- 	<c:when test="${empty login and empty adminlogin}"> --%>
	<c:when test="${empty adminlogin}">
		로그인 후 이용해 주세요!
		<a href="/viva/login"> <button>Login</button></a>
	</c:when>
	  
	 <c:when test="${not empty adminlogin and adminlogin }">
		<table class="big">
			<tr>
				<td class="small">글번호</td><td>${boardNotice.noticeNo }</td>
			</tr>
			<tr>
			 	<td class="table-info">관리자번호</td><td>${boardNotice.adminNo }</td>
			</tr>
			<tr>
				<td class="small">작성일</td><td><fmt:formatDate value="${boardNotice.noticeDate }" pattern="yyyy-MM-dd hh:mm" /></td>
			</tr>
			<tr>
				<td class="small">제목</td><td>${boardNotice.noticeTitle }</td>
			</tr>
			<tr>
				<td class="small">본문</td>
			</tr>
			<tr>
				<td>${boardNotice.noticeContent }</td>
			</tr>
					
		<button id="btnList">목록</button>
			<c:if test="${id eq boardNotice.adminNo }">
				<button id="btnUpdate">수정</button>
		 		<button id="btnDelete">삭제</button>
		 	</c:if>
			<hr>
	</c:when>
</c:choose>
	
</div><%-- .container end --%>

<c:import url="../layout/footer.jsp"/>
	