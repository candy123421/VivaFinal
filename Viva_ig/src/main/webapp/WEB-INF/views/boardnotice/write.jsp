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
	
	function updateContents() {
		//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
		oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", [])
	}
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

<!-- 스마트에디터 초기화 -->
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "noticeContent", //에디터가 적용될 <textarea>의 id속성값
		sSkinURI : "../resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	})
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />