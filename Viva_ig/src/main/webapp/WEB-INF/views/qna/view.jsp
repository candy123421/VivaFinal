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
	border: 1px grey solid;
	width: 1000px;
	height: 300px;

}
.t{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	width: 1200px;


}



</style>


<title>QnA List</title>

</head>
<body>
<h1>QnA view</h1>
<hr>

<div class="t">
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
문의 작성일:<fmt:formatDate value="${userQuestion.qDate }" pattern="yyyy-MM-dd"/>
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

<div class="a">
답변<hr>



</div>
<a href="/qna/list"><button class="btn btn-outline-secondary">돌아가기</button></a>

<c:if test="${not empty adminlogin and adminlogin }">
<a href="/qna/answer?qNo=${userQuestion.qNo }"><button class="btn btn-outline-secondary">답변하기 </button></a>

</c:if>

</body>
</html>