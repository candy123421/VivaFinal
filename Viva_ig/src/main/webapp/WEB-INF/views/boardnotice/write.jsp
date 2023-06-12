<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script>
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
</script>

<c:choose>
<%-- 	<c:when test="${empty login and empty adminlogin}"> --%>
	<c:when test="${empty adminlogin}">
		로그인 후 이용해 주세요!
		<a href="/viva/login"> <button>Login</button></a>
	</c:when>

	<c:when test="${not empty adminlogin and adminlogin }">
	<form action="./write" method="post" enctype="multipart/form-data">
		<div class="container">
		<h1>글 작성</h1>
		
			<div class="box">
				<div class="form-group">
					<div id="adminNo" name="adminNo" readonly="readonly">작성자 ${adminNo}</div>
				</div>
			
				<div class="form-group">
					<label class="form-label" for="title">제목</label>
					<input type="text" id="noticeTitle" name="noticeTitle" class="form-control">
				</div>
			
				<div class="form-group">
					<label class="form-label" for="content">본문</label>
					<textarea type="text" id="noticeContent" name="noticeContent" class="form-control"></textarea>
				</div>
				
			</div> <!-- box end -->
		</div> <!-- container end -->
		
		<div class="text-center">
			<button class="btn btn-primary" id="btnWrite">작성</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소">
		</div>
	</form>
	
	</c:when>
</c:choose>


<c:import url="/WEB-INF/views/layout/footer.jsp" />