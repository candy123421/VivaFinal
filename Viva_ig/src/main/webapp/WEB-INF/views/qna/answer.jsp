<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<style type="text/css">

	.q{
	border: 1px grey solid;
	width: 1000px;
	height: 300px;
	}

	.a{
/* 	border: 1px grey solid; */
	width: 1100px;
	height: 350px;

	}
	.userquestion{
	display: grid;
	grid-template-columns: 100px 300px 150px 1fr 1fr;
	width: 1200px;
	}
	.adminanswer{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr ;
	width: 1200px;
	}
	}
	#aAnswer{
	display: inline-block;
 	resize: none; 
	width: 1000px;
	}



</style>


<title>QnA List</title>

</head>
<body>
<h1>QnA view</h1>
<hr>

<div class="userquestion">
<div class="item">
문의번호:${userQuestion.qNo}
</div>
<div class="item">
문의 제목:${userQuestion.qTitle }
</div >
<div class="item">
처리여부:${userQuestion.qProcess }
</div>
<div class="item">
문의 작성일:<fmt:formatDate value="${userQuestion.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
</div>
<div class="item">
유저 번호:${userQuestion.userNo }
</div>
</div>
<br>
		

<div class="q">

문의내용<hr>

${userQuestion.qContent }

</div>

<br><br>

<form action="/qna/answer" method="post">
<div class="adminquestion">
관리자번호 : ${adminNo }
관리자 아이디 : ${admin.adminId }


</div>

<div class="a">
답변

<textarea id="aAnswer" name="aAnswer" class="form-control" placeholder="답변을 등록해주세요!" rows="11">

</textarea>



</div>
	<button class="btn btn-outline-secondary">답변작성</button>
	
	<input type="hidden" value="${userQuestion.qNo}" name="qNo" >
	
</form>



</body>
</html>