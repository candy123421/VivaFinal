<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<style type="text/css">

.q{
	border: 2px #ffd4de  solid;
	width: 1100px;
	height: 300px;
	margin: 0 auto;
	 border-radius: 10px;
	 background: #fef6fc;
/*  	 F9CFCF  */
/* 	 ffffe8 */
	 
}

.a{
	border: 2px pink solid;
	width: 1100px;
	height: 300px;
	margin: 0 auto;
	border-radius: 10px;

}
.t{
	display: grid;
	grid-template-columns: 100px 160px 150px 100px 150px 300px;
	width: 1200px;
	margin: 0 auto;
	margin-left: 330px;
}
.ad{
	display: grid;
	grid-template-columns: 150px 150px 150px 300px;
	width: 1200px;
	margin: 0 auto;
	margin-left: 330px;
}

.first{
	margin: 0 auto;
}


</style>


<title>QnA List</title>

</head>
<body >
<h1>QnA view</h1>
<hr>
<div class = first>
	<div class="t">
		<div class="item">유저 번호:${userQuestion.userNo }</div>
		<div class="item">유저 닉네임:${users.userNick }</div>
		<div class="item">유저 아이디:${users.userId }</div>
		<div class="item">문의번호:${userQuestion.qNo}</div>
		<div class="item">처리여부:${userQuestion.qProcess }</div>
		<div class="item">문의 작성일:<fmt:formatDate value="${userQuestion.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
	</div><br>

	

<div class="q">
	문의제목: ${userQuestion.qTitle }<hr>
	문의내용<hr>${userQuestion.qContent }</div>
</div>
<br><br>

<c:if test="${process eq 1 }">

	<div class="ad">
		<div class="item">관리자번호:${adminAnswer.adminNo }</div>
		<div class="item">관리자아이디 : ${admin.adminId }</div>
		<div class="item">답변번호:${adminAnswer.aNo }</div>
		<div class="item">답변일자:<fmt:formatDate value="${adminAnswer.aDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></div>
	
	</div>
	<div class="a">
		답변<hr>${adminAnswer.aAnswer }
	
	</div>


</c:if>

<a href="/qna/list"><button class="btn btn-outline-secondary">목록</button></a>
<c:choose>
	<c:when test="${not empty adminlogin and adminlogin && process eq 1} ">
		<span>이미 답변 완료 하셨습니다.</span>
	</c:when>
	
	<c:when test="${not empty adminlogin and adminlogin && process eq 0}">
		<a href="/qna/answer?qNo=${userQuestion.qNo }"><button class="btn btn-outline-secondary">답변하기 </button></a>
	</c:when>

</c:choose>




</body>
</html>