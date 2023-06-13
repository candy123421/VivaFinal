<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<style>
.categoryType {
	width: 200px;
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
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

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 수정</h2><p>&nbsp;</p>
        
        <form action="./update" method="post" class="formclass" enctype="multipart/form-data">
        
            <div class="table table-responsive">
<!-- 				<table class="table table-striped"> -->
				<table class="table">
					<tr>
						<td class="danger">카테고리</td>
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
						<input type="hidden" name="boardNo" value="${updateBoard.boardNo}">
		                <td class="danger">작성자</td>
		                <td>${id}</td>
		            </tr>
		            <tr>
		                <td class="danger">제목</td>
		                <td colspan="3"><input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${updateBoard.boardTitle }"></td>
		            </tr>
		             
		            <tr>
		                <td class="danger">글내용</td>
		                <td colspan="3"><textarea class="form-control" id="boardContent" name="boardContent" style="height: 400px;">${updateBoard.boardContent }</textarea></td>
		            </tr>
		            
		            <tr>
			            <td class="file-container">
			            
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
		            <tr>  
		                <td colspan="4" class="text-center">
<!-- 		                    <input type="submit" value="글수정" class="btn btn-warning"> -->
		                    <button type="button" value="글 수정" id="btnUpdate" name="btnUpdate">글 수정</button>
		                </td>
		            </tr>
				</table>
            </div> <!-- table table-responsive -->
            
        </form>   
    </div>
	</div>
</div><!-- wrap end -->

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
