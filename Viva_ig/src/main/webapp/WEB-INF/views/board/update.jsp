<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
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
<h1>글 수정</h1>
<hr>

<div class="box">

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="boardNo" value="${updateBoard.boardNo}">

<div class="big">
	<label class="middel" for="write">작성자 회원번호</label>
	<input type="text" id="userNo" value="${updateBoard.userNo}" class="small" readonly="readonly">
</div>

<div class="big">
	<label class="middel" for="title">제목</label>
	<input type="text" id="boardTitle" name="boardTitle" class="small" value="${updateBoard.boardTitle }">
</div>

<div class="big">
	<label class="middel" for="content">본문</label>
	<input type="text" id="boardContent" name="boardContent" class="small" value="${updateBoard.boardContent }">
</div>

<div class="filesBox">
	<div id="fileBox">
			 <%-- <div id="originFile">
				<a href="./download?fileNo=${boardFile.fileNo}">${boardFile.originName }</a>
				<span id="deleteFile">X</span>
			</div> --%>
	
			<div id="newFile">
				<hr>
				<label class="form-label" for="file">새로운 첨부파일</label>
				<input type="file" id="file" name="file" class="form-control" multiple="multiple">
				<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
			</div>
		</div>
</div>

<div class="buttons">
	<button class="button" id="btnUpdate">수정하기</button>
	<input type="reset" id="cancel" class="btn" value="취소">
</div>
</form>

</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>


<!---------- 댓글 시작 ---------->
<!----- 댓글 작성 ----->
<div id="comment">
	<form action="/commentWrite" method="post">
<%--      <c:if test="${sessionScope.userNo != null }"> --%>
	<input type="hidden" name="boardNo" value="${boardNo }">
	<textarea id="commentContent" name="commentContent" placeholder="댓글을 작성하세요" rows="5" cols="50"></textarea><br>
	<button type="button" id="btnComment">댓글 작성</button>
<%--      </c:if> --%>
	</form>
</div>

<div id="comments">
	<div class="commentList">
		<c:forEach items="${commentList}" var="commentList">
		    <div>
		      <div>
		      작성자 : ${commentList.userNo}<br />
		      작성일 :  <fmt:formatDate value="${commentList.commDate}" pattern="yyyy-MM-dd" />
              </div>
              <p>${commentList.commContent}</p>
		     </div>
		 </c:forEach>   
	</div>
</div>

<!-- 댓글 끝 -->

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
