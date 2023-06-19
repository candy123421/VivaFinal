<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>



<title>Admin Main</title>
<style type="text/css">

#titleWrap{
	width: 1400px;
	margin: 0 auto;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}

.form-control{
	width: 500px;
}

</style>
</head>
<body>
<div id="titleWrap">
<div class="FunctionTitle">
   Viva Admin Main
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>
<div class="topWrap">
<c:if test="${empty adminlogin }">
<div id="titleWrap">
Admin은 로그인을 해주세요
<a href="./login"><button class="btn btn-outline-secondary">Login</button></a>
</div>
</c:if>
</div>

<c:if test="${not empty adminlogin and adminlogin}">
<div  id="titleWrap">
안녕하세요!<br>
<span style="font-size: 1.5em; color: red;"> ${adminNo }</span>번 Admin
<span style="font-size: 1.5em; color: red;"> ${adminloginid }</span>님<br>
<a href="/admin/boardlist"><button class="btn btn-outline-secondary">Board</button></a>
<a href="/qna/list"><button class="btn btn-outline-secondary">Q&A</button></a>
<a href="/admin/credit"><button class="btn btn-outline-secondary">Credit</button></a>
<a href="/admin/userlist"><button class="btn btn-outline-secondary">User</button></a>
</div>

</c:if>

</body>
</html>