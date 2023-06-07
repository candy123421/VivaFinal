<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>QnA List</title>
</head>
<body>
<h1>Viva QnA List</h1>
<hr>

<table border="1">
	<tr>
		
		<th>문의 번호</th>
		<th>문의 제목</th>
		<th>처리여부</th>
		<th>문의 작성일</th>
		<th>유저 번호</th>
	</tr>

<c:forEach var="qnalist" items="${qnalist}">
<tr>
	<td>${qnalist.qNo}</td>
	<td><a href="./view?qNo=${qnalist.qNo}" >${qnalist.qTitle }</a></td>
	<td>${qnalist.qProcess }</td>
	<td><fmt:formatDate value="${qnalist.qDate }" pattern="yyyy-MM-dd"/></td>
	
	<td>${qnalist.userNo }</td>
</tr>
</c:forEach>
</table>

<a href="/users/question" ><button class="btn btn-outline-secondary">문의하기</button></a>



</body>
</html>