<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>user main</title>
</head>
<body>
<h1>User Main</h1>
<hr>
<div class="text-center">
<c:if test="${login eq false or login eq null}">
<%-- <c:if test="${empty login}"> --%>
<button onclick="location.href='./login'">로그인</button>
<button onclick="location.href='./join'">회원가입</button>
</c:if>
<br>
비 로그인 : ${empty userId } <br>
로그인 ${userId }<br>
어세스 토큰 : ${access_Token} <br>

<c:if test="${login}">
<%-- <c:if test="${not empty login and login}"> --%>
<button onclick="location.href='/board/list'">게시판</button>
<button onclick="location.href='./logout'">로그아웃</button>
<button onclick="location.href='./mypage'">마이페이지</button>
</c:if>

</div>
	
</body>
</html>