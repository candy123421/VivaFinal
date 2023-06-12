<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script>
$(document).ready(function() {
	
	$("#cancel").click(function() {
		history.go(-1)
	})
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit
	})
})
</script>

<c:choose>
	<c:when test="${empty login || empty adminlogin}">
		로그인 후 이용해 주세요!
		<a href="/viva/login"> <button>Login</button></a>
	</c:when>

	<c:when test="${not empty adminlogin and adminlogin }">
		<div class="container">
		<h1>글 수정</h1>
		<hr>
		
		<form action="./update" method="post">
		<input type="hidden" name="noticeNo" value="${boardNotice.noticeNo}">
		
			<div class="big">
				<label class="middel" for="write">작성자 회원번호</label>
				<input type="text" id="adminNo" value="${boardNotice.adminNo}" class="small" readonly="readonly">
			</div>
			
			<div class="big">
				<label class="middel" for="title">제목</label>
				<input type="text" id="noticeTitle" name="noticeTitle" class="small" value="${boardNotice.noticeTitle }">
			</div>
			
			<div class="big">
				<label class="middel" for="content">본문</label>
				<input type="text" id="noticeContent" name="noticeContent" class="small" value="${boardNotice.noticeContent }">
			</div>
			
			<div class="buttons">
				<button class="button" id="btnUpdate">수정하기</button>
				<input type="reset" id="cancel" class="btn" value="취소">
			</div>
		
		</form>
		
		</div>
	
	</c:when>
</c:choose>


<c:import url="/WEB-INF/views/layout/footer.jsp" />