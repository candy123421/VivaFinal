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
/* 	border: 2px solid #F88080; */
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
	
	if( ${empty boardFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();	
	})	
})
</script>

<div class="container">
<!-- 	<h2 class="text-center">게시글 작성</h2> -->

<div class="container-top">
	<div class="FunctionTitle">FreeBoard Modify</div>
	<div class="FunctionTitleLine">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>

	<div class="container-2" style="width: 1170px;">
	
        <form action="./update" method="post" class="formclass" enctype="multipart/form-data">
      
        <div class="container-table">
				<table class="table">
					<tr>
						<td class="item">카테고리</td>
						<td><select name="categoryType" class="categoryType">
								<option value="free">자유</option>
								<c:if test="${not empty adminlogin and adminlogin }">
									<option value="공지">공지</option>
								</c:if>
								<option value="qna">질문</option>
						</select>
						</td>
					</tr>
					
		            <tr>
						<input type="hidden" name="boardNo" value="${updateBoard.boardNo}">
		                <td class="item">작성자</td>
		                <td>${id}</td>
		            </tr>
		            <tr>
		                <td class="item">제목</td>
		                <td><input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${updateBoard.boardTitle }"></td>
		            </tr>
		             
		            <tr>
		                <td class="item">글내용</td>
		                <td><textarea class="form-control" id="boardContent" name="boardContent" style="height: 400px;">${updateBoard.boardContent }</textarea></td>
		            </tr>
		            
		            <tr>
			            <td class="container-file">
			            
			            	<!-- 여기 주석 처리 했었음 -->
<!-- 							<div id="originFile"> -->
<%-- 							<a href="./download?fileNo=${boardFile.fileNo}">${boardFile.originName }</a> --%>
<!-- 							<span id="deleteFile">X</span> -->
<!-- 							</div> -->
							
							<td id="newFile">
								<label class="form-label" for="file">새로운 첨부파일</label>
								<input type="file" id="file" name="file" class="form-control" multiple="multiple">
								<span>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</span>
							</td>
						</td>
					</tr>
				</table>
					
		            <div class="container-button">
		            	<c:if test="${not empty login and login}">
		                    <button type="button" class="btnUpdate" id="btnUpdate">수정</button>
		                    <input type="reset" id="btnCancel" class="btnCancel" value="취소">
		                </c:if>
		            </div>
		            
            </div> <!-- container-table end -->
            
        </form>   
        
	</div> <!-- container-2 end -->
</div><!-- container end -->

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
