<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<style type="text/css">
#imgWrap{
	width:1400px;
}
#img{
	width:100%
}
</style>

<title>guide</title>
</head>
<body>
<div class="FunctionTitle">
   Viva Guide 
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
<h3>안녕하세요 Sound Designer ${nick }님!</h3>

<div id="imgWrap">
	<img id="img" src="../../../resources/img/Guide.png">
</div>

</body>
</html>