<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>Login</title>
</head>
<body>
<h1>Viva Login</h1>
<hr>

<div>
<a href="/users/login"> <button class="btn btn-outline-secondary btn-sm">회원로그인</button> </a>
<a href="/admin/login"> <button class="btn btn-outline-danger btn-sm">관리자로그인</button> </a>

</div>
</body>
</html>