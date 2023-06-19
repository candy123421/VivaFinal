<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<style>

.container {
	width: 1400px;
	margin: 0 auto;
	font-family: "typeFont";
	src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf');
	text-align: center;
}

.text-center {
	width: 1400px;
	margin: 0 auto;
}

.item {
	width: 150px;
	height: 50px;
}

.form-control {
	width: 1000px;
}

.categoryType {
	width: 150px;
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.btnUpdate {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	border: 2px solid #F88080;
	border-radius: 10px;
	width: 70px;
	height: 40px;
	transition: all 0.4s;
	color: white;
	margin-right: 10px;
}

.btnUpdate:focus {
	outline: none;
}

.btnUpdate:hover {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	width: 70px;
	height: 40px;
	color: white;
}

.btnCancel {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	border: 2px solid #F88080;
	border-radius: 10px;
	width: 70px;
	height: 40px;
	transition: all 0.4s;
	color: white;
}

.btnCancel:focus {
	outline: none;
}

.btnCancel:hover {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	color: white;
}

.container-button {
	margin-top: 15px;
	display: flex;
	justify-content: center;
}
</style>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		console.log("#btnUpdate");
		submitContents($("#btnUpdate"));
		$("form").submit();
		$(".formclass").submit();
		console.log("#btnUpdate");
	});
	
	$("#cancel").click(function() {
		history.go(-1);
	});
});
</script>

<div class="container-top">
	<div class="FunctionTitle">NoticeBoard Modify</div>
	<div class="FunctionTitleLine">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>

	<c:choose>
		<c:when test="${empty adminlogin}">
			로그인 후 이용해 주세요!
			<a href="/viva/login"> <button>Login</button></a>
		</c:when>

		<c:when test="${not empty adminlogin and adminlogin}">
			<div class="container-2" style="width: 1170px;">
				<form action="./update" method="post" class="formclass">
					<input type="hidden" name="noticeNo" value="${boardNotice.noticeNo}">
					
					<div class="container-table">
						<table class="table">
							<tr>
								<td class="item">관리자 번호</td>
								<td><input type="text" id="adminNo" name="adminNo" value="${boardNotice.adminNo}" class="form-control" readonly="readonly"></td>
							</tr>
							<tr>
								<td class="item">제목</td>
								<td><input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${boardNotice.noticeTitle }"></td>
							</tr>
							<tr>
								<td class="item">글내용</td>
								<td><textarea id="noticeContent" name="noticeContent" class="form-control" style="height: 400px;">${boardNotice.noticeContent }</textarea></td>
							</tr>
						</table>
					</div> <!-- container-table end -->
					
					<div class="container-button">
						<button class="btnUpdate" id="btnUpdate" type="button">수정하기</button>
						<input type="button" id="cancel" class="btnCancel" value="취소">
					</div> <!-- container-button end -->
				</form>   
			</div> <!-- container-2 end -->
		</c:when>
	</c:choose>
</div><!-- container end -->

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "noticeContent",
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
