<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript"
	src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<c:if test="${empty login}">
	로그인 후 이용해 주세요!
	<a href="/viva/login">
		<button>Login</button>
	</a>
</c:if>

<script type="text/javascript">
	$(function() {
		//작성버튼 동작
		$("#btnWrite").click(function() {
			console.log("btnWrite click");

			//iframe내용을 textarea에 넣어주어야 보여짐
			//작성된 내용을 <textarea>에 적용하기
			updateContents()
			//-> 이 함수 밖에 있으면 content등록 전에 작동하게 됨

			//폼 제출
			$("form").submit()
		})
		//취소버튼 동작
		$("#btnCancel").click(function() {
			history.go(-1)
		})
	})

	function updateContents() {
		//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
		oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", [])
	}
</script>

<style type="text/css">

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
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

/*
.container-file {
	width: 600px;
	height: 30px;
	margin-top: 20px;
	display: flex;
	align-items: center;
}
*/


.btnWrite, .btnCancel {
/* 	background: #FC466B;  /* fallback for old browsers */ */
/* 	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */ */
/* 	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ */
	background: #FC5C7D;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #6A82FB, #FC5C7D);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #6A82FB, #FC5C7D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	
	border: 2px solid #F88080;
	border-radius: 10px;
	width:100px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
	margin-right: 10px;
}

.btnWrite:focus, .btnCancel:focus {
	outline: none;
}

.btnWrite:hover, .btnCancel:hover {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:100px;
	height:40px;
	color: white;
}
		
.container-button {
	margin-top: 15px; 
	display: flex; 
	justify-content: center;"
}

</style>


<div class="container">
<!-- 	<h2 class="text-center">게시글 작성</h2> -->
<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">FREE BOARD Write</div>
	<div class="FunctionTitleLine" style="margin: 0 auto;">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>

	<div class="container-2" style="width: 1170px;">
		<form action="/board/write" method="post" enctype="multipart/form-data">
			<div class="container-table">
				<!-- 				<table class="table table-striped"> -->
				<table class="table">
					<tr>
						<td class="item">카테고리</td>
						<td><select name="categoryType" class="categoryType">
								<option value="free">자유</option>
								<option value="qna">질문</option>
						</select></td>
						</td>
					</tr>

					<tr>
						<td class="item">작성자</td>
						<td>${id}</td>
<%-- 						<td>${writeBoard.userId}</td> --%>
					</tr>
					<tr>
						<td class="item">제목</td>
						<td><input type="text" class="form-control" id="boardTitle" name="boardTitle"></td>
					</tr>

					<tr>
						<td class="item">글내용</td>
						<td><textarea class="form-control" id="boardContent" name="boardContent" style="height: 400px;"></textarea></td>
					</tr>
					<tr>
					
					<tr>
						<td class="item">첨부파일</td>
						<td><input type="file" id="file" name="file" class="file" multiple="multiple"></td>
					</tr>
					
				</table>

			</div> <!-- container-table end -->

			<div class="container-button">
				<c:if test="${not empty login and login}">
					<button type="button" class="btnWrite" id="btnWrite">작성</button>
					<input type="reset" id="btnCancel" class="btnCancel" value="취소">
				</c:if>
			</div>

		</form>

	</div><!-- container-2 -->
</div><!-- container end -->


<!-- 스마트에디터 초기화 -->
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "boardContent", //에디터가 적용될 <textarea>의 id속성값
		sSkinURI : "../resources/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	})
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />