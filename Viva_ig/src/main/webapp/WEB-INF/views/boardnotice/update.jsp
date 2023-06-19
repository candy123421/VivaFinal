<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<style>


.container {
	width: 1400px;
	margin: 0 atuo;
	font-family: "typeFont";
	src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf')
		text-align: center;
}

.text-center {
	width: 1400px; 
	margin: 0 atuo;
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
/* 	width: 200px; */
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.btnUpdate {
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	
	margin-right: 10px;
}

.btnUpdate:focus {
	outline: none;
}

.btnUpdate:hover {
	background: linear-gradient(270deg, rgba(255, 194, 137, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	width:70px;
	height:40px;
	color: white;
}
		
.btnCancel {
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
}

.btnCancel:focus {
	outline: none;
}

.btnCancel:hover {
	background: linear-gradient(270deg, rgba(245, 174, 108, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	color: white;
}

.container-button {
	margin-top: 15px; 
	display: flex; 
	justify-content: center;"
}

</style>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", [])	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		
		console.log("#btnUpdate");
 		submitContents($("#btnUpdate"))
		
		$("form").submit()
		$(".formclass").submit()
		
		console.log("#btnUpdate");
	})
	
	$("#cancel").click(function() {
		history.go(-1)
	})
})
</script>

<c:choose>
	<c:when test="${empty adminlogin}">
		로그인 후 이용해 주세요!
		<a href="/viva/login"> <button>Login</button></a>
	</c:when>

	<c:when test="${not empty adminlogin and adminlogin }">
<div class="container">

<div class="container-top">
	<div class="FunctionTitle">NoticeBoard Modify</div>
	<div class="FunctionTitleLine">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>

	<div class="container-2" style="width: 1170px;">
        <form action="./update" method="post" class="formclass" enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value="${boardNotice.noticeNo}">
		
        <div class="container-table">
			<table class="table">
				<tr>
					<td class="item">관리자 번호</td>
					<input type="text" id="adminNo" name="adminNo" value="${boardNotice.adminNo}" class="small" readonly="readonly">
				</tr>
				<tr>
					<td class="item">제목</td>
					<td><input type="text" id="noticeTitle" name="noticeTitle" class="small" value="${boardNotice.noticeTitle }"></td>
		            </tr>
		             
		            <tr>
		                <td class="item">글내용</td>
		                <td><textarea id="noticeContent" name="noticeContent" class="small">${boardNotice.noticeContent }</textarea></td>
		            </tr>
				</table>
					
				<div class="buttons">
					<button class="button" id="btnUpdate" type="button">수정하기</button>
					<input type="button" id="cancel" class="btn" value="취소">
				</div>
            </div> <!-- container-table end -->
        </form>   
	</div> <!-- container-2 end -->
</div><!-- container end -->

</c:when>
</c:choose>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "boardContent"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
