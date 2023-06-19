<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<style>

.container {
	width : 1400px;
	margin : 0 auto:
}

.table-th {
	width: 220px;
}

.table-td {
	width: 440px;
}

.btnUserList {
	text-align: right;
	margin-bottom: 10px;
}

.btnList {
	background: #FC5C7D;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #6A82FB, #FC5C7D);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #6A82FB, #FC5C7D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:100px;
	height:40px;
	transition: all 0.4s;
	color: white;
}

.btnList:hover {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:100px;
	height:40px;
	color: white;
}

.btnComment, .btnCommentUpdate, .btnCommentDelete {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:150px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
}
.btnUpdate, .btnDelete {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:100px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
}

.btnUpdate:focus, .btnDelete:focus, .btnList:focus, .btnComment:focus, .btnCommentUpdate:focus, .btnCommentDelete:focus  {
	outline: none;
}

.btnComment:hover, .btnCommentUpdate:hover, .btnCommentDelete:hover {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:100px;
	height:40px;
	color: white;
}
.btnUpdate:hover, .btnDelete:hover {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:100px;
	height:40px;
	color: white;
}

.like{
	cursor: pointer;
}

</style>

<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">Notice BOARD View</div>
	<div class="FunctionTitleLine"  style="margin: 0 auto; margin-top: 30px;">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>


<c:choose>
	<c:when test="${login or adminlogin}">
	<div class="container">
	     <div class="row row1">
	      <table class="table" style="margin-top: 25px;">
	        <tr>
				<th class="table-th">게시글 번호</th>
				<td class="table-td">${boardNotice.noticeNo }</td>
				<th class="table-th">작성일</th>
				<td class="table-td"><fmt:formatDate value="${boardNotice.noticeDate }" pattern="yyyy-MM-dd hh:mm" /></td>
	        </tr>
	        
	        <tr>
			<th class="table-th">관리자 번호</th>
			<td class="table-td" colspan="4" >${boardNotice.adminNo }</td>
	        </tr>
	        
	        <tr>
			<th width=20% class="table-th" style="height: 50px;">제목</th>
			<td colspan="3" style="height: 50px;">${boardNotice.noticeTitle }</td>
	        </tr>
	        
	        <tr>
<!-- 			<td class="table-td" valign="top" style="height: 300px; width: 1200px;"> -->
			<td class="content" colspan="4" style="height: 300px; width: 1000px;">${boardNotice.noticeContent }</td>
	        </tr>
	      </table>
	        
  <c:if test="${adminNo eq boardNotice.adminNo}">
    <div class="btnUserList">
      <button class="btnUpdate" id="btnUpdate">수정</button>
      <button class="btnDelete" id="btnDelete">삭제</button>
    </div>
</c:if>

	</c:when>
</c:choose>
	<div class="container-btnList" style="display: flex; justify-content: center; align-items: center;">
		<button id="btnList" class="btnList">목록</button>
	</div>
  
</div><!-- .container end -->


<script type="text/javascript">

$(document).ready(function() {

	<!-------------------- 게시글 버튼 시작 -------------------->
	//게시글 상세보기 - 목록으로 돌아가기
	$("#btnList").click(function() {
		location.href = "./list";
	})
	
// 	//게시글 상세보기 - 수정하기
	$("#btnUpdate").click(function() {
		location.href="./update?noticeNo=${boardNotice.noticeNo}";
	})
	
	
// 	//게시글 상세보기 - 삭제
	$("#btnDelete").click(function() {
		location.href="./delete?noticeNo=${boardNotice.noticeNo}";
	}) 
})
</script>
	
	<!-------------------- 게시글 버튼 끝 -------------------->

<c:import url="../layout/footer.jsp"/>
