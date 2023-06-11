<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>Admin Main</title>
<style type="text/css">


.form-control{
	width: 500px;
}

</style>
</head>
<body>
<h1>Admin Main</h1>
<hr>
<c:if test="${empty adminlogin }">
Admin은 로그인을 해주세요
<a href="./login"><button class="btn btn-outline-secondary">Login</button></a>
</c:if>

<c:if test="${not empty adminlogin and adminlogin}">

안녕하세요<br>
<span style="font-size: 1.5em; color: red;"> ${adminNo }</span>번 Admin
<span style="font-size: 1.5em; color: red;"> ${adminloginid }</span>님<br>
<a href="./logout"><button class="btn btn-outline-secondary">Logout</button></a>
<a href="/board/list"><button class="btn btn-outline-secondary">Board</button></a>
<a href="/qna/list"><button class="btn btn-outline-secondary">Q&A</button></a>
<a href="/admin/credit"><button class="btn btn-outline-secondary">Credit</button></a>


</c:if>


</body>
</html>