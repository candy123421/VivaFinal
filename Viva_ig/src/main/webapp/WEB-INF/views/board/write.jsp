<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<c:if test="${empty login}">
	로그인 후 이용해 주세요!
	<a href="/viva/login"> <button>Login</button></a>
</c:if>

<script type="text/javascript">
$(function() {
	//작성버튼 동작
	$("#btnWrite").click(function() {
		
		//제목 필수 입력 설정
		if( $("input[name~='boardTitle']").val() == '' ) {
			alert("제목을 입력하세요")
			return false;
		}
		//작성된 내용을 <textarea>에 적용하기
		updateContents()
		$("form").submit()
	})
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
})

// 	function updateContents() {
// 	//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
// 	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
// 	}
}

</script>

<style type="text/css">

.container {
	font-family: "typeFont"; 
    src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf') 
	text-align: center; 
}

.categoryType {
	width: 150px;
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.form-user {
	width: 200px;
	height: 40px;
	font-size: 20px;
    display: flex;
    align-items: center;
}

.form-user .userId {
    margin-right: 20px;
}

.form-group {
	font-size: 20px;
	display: flex;
    flex-direction: column;
}

.form-group .boardTitle {
	width: 100px;
	height: 30px;
	margin-bottom: 3px;
}

.form-group #boardTitle {
	width: 890px;
	height: 50px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.form-group .boardContent {
    width: 100px;
    height: 30px; /* 원하는 높이 값으로 조정 */
    margin-bottom: 3px;
}
  
.form-group #boardContent {
    width: 890px;
    height: 350px;
    margin-bottom: 10px;
    border-radius: 10px;
}

.form-file {
	width: 600px;
	height: 30px;
	margin-top: 20px;
	font-size: 20px;
    display: flex;
    align-items: center;
}

.form-file .multifile {
    margin-right: 20px;
}

.button {
	margin-top: 20px;
 	margin-left: 175px;
}

.btnWrite, .btnCancel {
	width: 55px;
	height: 35px;
	border-radius: 10px;
	
	background: #873286;
	color: white;
}

</style>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 작성</h2><p>&nbsp;</p>
        
		<form action="./write" method="post" enctype="multipart/form-data">
        
            <div class="table table-responsive">
<!-- 				<table class="table table-striped"> -->
				<table class="table" style="width:1400px; margin: 0 atuo;">
					<tr>
						<td class="danger">카테고리</td>
					    <td >
					        <td>
								<select name="categoryType" class="categoryType">
									<option value="free">자유</option>
									<c:if test="${not empty adminlogin and adminlogin }">
										<option value="공지">공지</option>
									</c:if>
									<option value="qna">질문</option>
								</select>
					        </td>
					    </td>
					</tr>
		            <tr>
		            	<input type="hidden" name="boardNo" value="${writeBoard.boardNo}">
		                <td class="danger">작성자</td>
		                <td>${id}</td>
		            </tr>
		            <tr>
		                <td class="danger">제목</td>
		                <td colspan="3"><input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${writeBoard.boardTitle }"></td>
		            </tr>
		             
		            <tr>
		                <td class="danger">글내용</td>
		                <td colspan="3"><textarea class="form-control" id="boardContent" name="boardContent" style="height: 400px;">${writeBoard.boardContent }</textarea></td>
		            </tr>
				</table> 

				<div class="form-file">
					<label class="multifile" for="multifile">첨부파일</label>
					<input type="file" id="file" name="file" class="file" multiple="multiple">
				</div>
				
			</div> <!-- table table-responsive end -->

		<div class="button">
			<c:if test="${not empty login and login}">
				<button class="btnWrite" id="btnWrite">작성</button>
				<input type="reset" id="btnCancel" class="btnCancel" value="취소">
			</c:if>
		</div>
	
		</form>
		
	</div> <!-- col-md-8 -->
	</div> <!-- col-md-2 -->
</div> <!-- row end -->



<!-- 스마트에디터 초기화 -->
<!--  
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "boardContent",	//에디터가 적용될 <textarea>의 id속성값
	sSkinURI: "../resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>
-->

<c:import url="/WEB-INF/views/layout/footer.jsp" />