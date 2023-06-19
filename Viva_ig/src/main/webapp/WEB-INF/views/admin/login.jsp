<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>Admin Login</title>
<style type="text/css">


.form-control{
	width: 500px;
}


</style>

</head>
<body>
<div class="FunctionTitle">
   Viva Admin Login
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
<br>
<form action="./login" method="post">
<div class="text-center" style="margin-left: 555px;">
<input type="text" id="adminId" name="adminId" class="form-control" placeholder="Admin ID"><br>
<input type="password" id="adminPw" name="adminPw" class="form-control" placeholder="Admin PW"><br>
</div>

<div class="text-center"  style="margin-top: 20px;">
	<button id="btnWrite" class="btn btn-outline-secondary">Login</button>
	<input type="reset" id="cancel" class="btn btn-outline-danger" value="cancel">
</div>
</form>
</body>
</html>