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
.qt{
	border: 2px #ffd4de  solid;
	width: 1100px;
	margin: 0 auto;
	 border-radius: 10px;
	 background: #fef6fc;
	 margin-bottom: 20px;


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
	margin-bottom: 15px;
}

.first{
	margin: 0 auto;
	
}
.m{
	width: 1050px; 
	margin: 0 auto;
	display: grid;
	place-content: center;
	padding-top: 15px;
}
#titleWrap{
	width: 1400px;
	margin: 0 auto;
	font-weight: bold;
	margin-bottom: 20px;
}

	.list{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:80px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.list:focus{
	outline: none;
	}

	.list:hover{
	background: linear-gradient(270deg, rgba(255, 194, 137, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	width:80px;
	height:40px;
	color: white;
	}



</style>


<title>QnA List</title>

</head>
<body >
<div id="titleWrap">
<div class="FunctionTitle">
   Viva QnA View
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>
<div class = first>
	<div class="t">
		<div class="item">Number:${userQuestion.userNo }</div>
		<div class="item">Nick:${users.userNick }</div>
		<div class="item">ID:${users.userId }</div>
		<div class="item">문의번호:${userQuestion.qNo}</div>
		<div class="item">처리여부:${userQuestion.qProcess }</div>
		<div class="item">문의 작성일:<fmt:formatDate value="${userQuestion.qDate }" pattern="yyyy-MM-dd [E] a hh:mm"/></div>
	</div><br>


<div class="qt">
	문의 제목: ${userQuestion.qTitle }
</div>

<div class="q">
	
	문의 내용 : <br>
	${userQuestion.qContent }</div>
</div>
<br><br>

	<c:if test="${process eq 1 }">
	
		<div class="ad">
			<div class="item">관리자번호:${adminAnswer.adminNo }</div>
			<div class="item">관리자아이디 : ${admin.adminId }</div>
			<div class="item">답변번호:${adminAnswer.aNo }</div>
			<div class="item">답변일자:<fmt:formatDate value="${adminAnswer.aDate }" pattern="yyyy-MM-dd [E] a hh:mm"/></div>
		
		</div>
		<div class="a">
			답변 : <br> 
			${adminAnswer.aAnswer }
		
		</div>
	
	
	</c:if>
	<div class="m">
		<a href="/qna/list"><button class="list">목록</button></a>
	</div>
		
	<c:choose>
		<c:when test="${not empty adminlogin and adminlogin && process eq 1} ">
			<span>이미 답변 완료 하셨습니다.</span>
		</c:when>
		
		<c:when test="${not empty adminlogin and adminlogin && process eq 0}">
			<div class="m">
				<a href="/qna/answer?qNo=${userQuestion.qNo }"><button class="list">답변하기 </button></a>
			</div>
		</c:when>
	
	</c:choose>




</body>
</html>