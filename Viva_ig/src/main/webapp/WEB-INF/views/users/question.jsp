<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<script type="text/javascript">

$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	$("#btnWrite").click(function() {
		//submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
</script>


<style type="text/css">

.container {
	font-family: "typeFont"; 
    src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf') 
	text-align: center; 
}

.question{
	font-size:30px;
}

</style>


<div class="container">
<h1>문의하기</h1>
<hr>

<div class="box">
<form action="./question" method="post" enctype="multipart/form-data">

<a href="./question"><label class="question">1:1문의</label></a>
 | 
<a href="./question"><label class="question">문의내역확인</label></a>

<div class="form-group">
	<label class="form-label" for="write">작성자 아이디</label>
	<div>${userInfo.userId} 하이</div>
	<div>${id.userId} 하이</div>
<%-- 	<input type="text" id="userId" name="userId" value="${userInfo.userId }" class="form-control"> --%>
</div>

<div class="select">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="boardTitle" name="boardTitle" class="form-control">
</div>

<div class="form-group">
	<label class="form-label" for="content">내용</label>
	<input type="text" id="boardContent" name="boardContent" class="form-control">
</div>

<div class="form-group">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" id="boardFile" name="boardFile" class="form-control">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

</form>
</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />