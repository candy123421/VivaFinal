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
	.upload{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #9E66A4;
	}
	.upload:focus{
	outline: none;
	}

	.upload:hover{
	background: linear-gradient(208.73deg, #4C469F -24.94%, #7857A2 24.61%, rgba(190, 52, 85, 0.9) 90.77%, #9E66A4 101.89%);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	color: white;
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
<div class="text-center">
	
	<a href="/file/fileupsource"><button class="upload">Source</button></a>
	<a href="/file/fileuppack"><button class="upload">Pack</button></a>
</div>

</body>
</html>