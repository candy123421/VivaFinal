<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">

.qnalist{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	border: 2px #ffd4de solid;
	border-radius: 10px;
	width: 1300px;
	text-align: center;
	margin: auto;
	grid-row-gap: 15px;
	background: #fef6fc;
}

#titleWrap{
	width: 1400px;
	margin: 0 auto;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}
#pagingWrap{
	width: 1050px;
	margin: 0 auto;
	display: grid;
	padding-top: 15px;
	place-content: center;
}

.menu{
	width: 1050px; 
	margin: 0 auto;
	display: grid;
	place-content: center;
	padding-top: 15px;
}

	.question{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:80px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.question:focus{
	outline: none;
	}

	.question:hover{
	background: linear-gradient(270deg, rgba(255, 194, 137, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	width:80px;
	height:40px;
	color: white;
	}


</style>
<c:import url="../layout/header.jsp"/>



<title>QnA List</title>
</head>
<body>
<div id="titleWrap">
<div class="FunctionTitle">
   Viva QnA 
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>
	  <c:choose>
	  

	  
	  
	  
	  <c:when test="${not empty adminlogin and adminlogin }">
		  <div class="qnalist">
				<div class="item">문의번호</div>
				<div class="item">문의제목</div>
				<div class="item">처리여부</div>
				<div class="item">문의 작성일</div>
				<div class="item">유저번호</div>
			
			<c:forEach var="qnalist" items="${qnalist }">
				<div class="item">${qnalist.qNo}</div>
				<div class="item"><a href="./view?qNo=${qnalist.qNo}" >${qnalist.qTitle }</a></div>
				<div class="item">${qnalist.qProcess }</div>
				<div class="item"><fmt:formatDate value="${qnalist.qDate }" pattern="yyyy-MM-dd [E] a hh:mm"/></div>
				<div class="item">${qnalist.userNo }</div>
			</c:forEach>
				<span class="float-end mb-3">total : ${paging.totalCount }</span>
				<div class="clearfix"></div>
			</div>
			<div id="pagingWrap">
				<c:import url="/WEB-INF/views/layout/qnapaging.jsp" />
			</div>

	  </c:when>
	  
	  <c:when test="${not empty login and login }">
	  	  <div class="qnalist">
			<div class="item">문의번호</div>
			<div class="item">문의제목</div>
			<div class="item">처리여부</div>
			<div class="item">문의 작성일</div>
			<div class="item">유저번호</div>
	
		<c:forEach var="userqna" items="${userqna }">
			<div class="item">${userqna.qNo}</div>
			<div class="item"><a href="./view?qNo=${userqna.qNo}" >${userqna.qTitle }</a></div>
			<div class="item">${userqna.qProcess }</div>
			<div class="item"><fmt:formatDate value="${userqna.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
			<div class="item">${userqna.userNo }</div>
			
		</c:forEach>
		
		</div>
	  
	  <div class="menu">
		<a href="/qna/question" ><button class="question">문의하기</button></a>
	  </div>
	  
	  </c:when>
	  
	  
	  </c:choose>






</body>
</html>