<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<script type="text/javascript">
$(document).ready(function() {
	
	//게시글 상세보기 - 목록으로 돌아가기
	$("#btnList").click(function() {
		location.href = "./list";
	})
	
	//게시글 상세보기 - 수정하기
	$("#btnUpdate").click(function() {
		location.href="./update?boardNo=${viewBoard.boardNo}";
	})
	
	//게시글 상세보기 - 삭제
	$("#btnDelete").click(function() {
		location.href="./delete?boardNo=${viewBoard.boardNo}";
	}) 
	
	
	//댓글 작성 ajax
	$("#btnComment").click(function() {
		//var contextPath = '<%= request.getContextPath() %>';
		var commContent=$("#commContent").val();	//댓글 내용
		var boardNo = "${board.boardNo}";			//게시물 번호
		//var param="commentContent" + commentContent + "&boardNo" + boardNo;

		$.ajax({
			type: "post",
			url: "/board/commentWrite",
			data: {commContent: commContent, boardNo: boardNo},
			success: function(result) {
				
		        /* var commentHtml = '';
		        for (var i=0; i<result.length; i++) {
		            commentHtml += '<p>' + result[i].commContent + '</p>';
		        } */
					
		        if (result.length > 0) {
	                /* $("#commentList").html(commentHtml); */
	                $("#commentList").html(result);
	                alert("댓글이 작성되었습니다.");
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert("댓글 작성에 실패했습니다.");
	            }
	          
	            $('#commentList').val('');
	            // DOM 조작 함수호출 등 가능
	        },
            error: function() {
                //Ajax 요청 실패 시 처리할 동작
                alert("댓글 작성에 실패했습니다.");
            }
		}); //ajax end
	}); //$("#btnComment").click(function() end

			
			
	//댓글 조회 ajax - 초기 페이지 로딩시 댓글 불러오기
	$(function(){
		viewComment();
	});			
	//댓글 조회 ajax
	function viewComment() {
	var boardNo = $('input[name=boardNo]').val();
		$.ajax({
		type: 'GET',
		url: "/board/commentView",
		data: { boardNo: boardNo },
		success: function(result) {
			console.log(result);
		}, //success end
		          
		error: function(result) {},
		complete: function() {}

		}) //ajax end
	} //function viewComment() end
	
	
	
	//댓글 수정 ajax
	 $(document).on("click", ".btnCommentUpdate", function() {
		var boardNo = $("#boardNo").val();
// 		var commNo = "${comments.commNo}";
// 		var commContent=$("#commContent").val();	//댓글 내용
		var commNo = $(this).data("comm-no");
        var commContent = $("#commContent-" + commNo).val();
		
	    //서버로 수정할 댓글의 내용과 댓글 번호를 전달하여 처리하는 Ajax 요청 추가
	    $.ajax({
	        type: 'POST',
	        url: "/board/commentUpdate",
	        data: { boardNo: boardNo, commNo: commNo, commContent: commContent },
	        success: function(result) {
	            // 수정 성공 시에 대한 처리 로직 작성
	            // 예: 댓글 수정이 성공하면 새로운 내용으로 업데이트
				alert("댓글이 수정되었습니다.");
				location.reload(); // 페이지 새로고침
	        },
	        error: function(error) {
	            // 수정 실패 시에 대한 처리 로직 작성
	        	alert("댓글 수정에 실패했습니다.");
	        }
	    });  //$.ajax end
	}); //$("#btnCommentUpdate").click(function() end
	
			
	//댓글 삭제 ajax
	$('.btnCommentDelete').click(function() {
		
		var idx = $(".btnCommentDelete").index(this);
		var boardNo = $("input[name='commboardNo']").val();
        var commNo = $(".btnCommentDelete").eq(idx).attr('data-comm-no');

        $.ajax({
	        type: 'POST',
	        url: "/board/commentDelete",
 	        data: {boardNo: boardNo, commNo: commNo},
	        success: function(result) {

				$(".commentList").html(result);

 	            console.log("댓글 삭제 성공")
 	            alert("댓글을 삭제했습니다")
  				location.reload(); // 페이지 새로고침
	        },
	        error: function(error) {
	            console.log("댓글 삭제 실패");
	            alert("댓글 삭제에 실패했습니다.");
	        }
	    }); //$.ajax end
	}); //$("#btnCommentDelete").click(function() end
}) //$(document).ready(function() end

</script>

<div class="container">
<h1>게시글 상세보기</h1>
<hr>

<table class="big">
<tr>
	<td class="small">글번호</td><td>${viewBoard.boardNo }</td>
</tr>
<tr>
<%-- 	<td class="table-info">아이디</td><td>${viewBoard.userId }</td> --%>
	<td class="table-info">회원번호</td><td>${viewBoard.userNo }</td>
</tr>
<tr>
	<td class="small">조회수</td><td>${viewBoard.boardHit }</td>
	<td class="small">작성일</td><td><fmt:formatDate value="${viewBoard.boardDate }" pattern="yyyy-MM-dd hh:mm" /></td>
</tr>
<tr>
	<td class="small">제목</td><td>${viewBoard.boardTitle }</td>
</tr>
<tr>
	<td class="small">본문</td>
</tr>
<tr>
	<td>${viewBoard.boardContent }</td>
</tr>
</table>

<!-- 첨부파일 -->
<div class="file" >
	<c:if test="${not empty boardFile }">
		<c:forEach var="boardFile" items="${boardFile}">
			<a href="./download?fileNo=${boardFile.fileNo }"></a>
			<img src="/boardUpload/${boardFile.storedname }" alt="다잘될거야~">
		</c:forEach>
	</c:if>
</div>

<div>
	<button id="btnList">목록</button>
	
<%--  	<c:if test="${id eq viewBoard.userId }"> --%>
 		<button id="btnUpdate">수정</button>
 		<button id="btnDelete">삭제</button>
<%-- 	</c:if> --%>
</div>
<hr>

<!-------------------- 댓글 시작 -------------------->
<!---------- 댓글 작성 ---------->
<div id="comment">
	<form action="/commentWrite" method="post">
		<input type="hidden" name="boardNo" value="${viewBoard.boardNo }">
		<textarea id="commContent" name="commContent" placeholder="댓글을 작성하세요" rows="4" cols="100"></textarea><br>
		<button type="button" id="btnComment">댓글 작성</button>
	</form>
</div>
<hr>

<!---------- 댓글 목록 ---------->
<div id="commentList" class="commentList">
	<c:forEach items="${commentList}" var="commentList">
		<input type="hidden" name="commboardNo" value="${commentList.boardNo }">
		<div>작성자 번호: ${commentList.userNo}</div>
		<div>댓글 번호 : ${commentList.commNo }</div>
        <div>작성일: <fmt:formatDate value="${commentList.commDate}" pattern="yyyy-MM-dd hh:mm" /></div>
		<input id="commContent-${commentList.commNo}" name="commContent" value="${commentList.commContent}"><br>
			<button type="button" class="btnCommentUpdate" data-comm-no="${commentList.commNo}">댓글 수정</button>
			<button type="button" class="btnCommentDelete" data-comm-no="${commentList.commNo}">댓글 삭제</button>
			<hr>
	</c:forEach>
</div>
<!-- 댓글 끝 -->

</div><!-- .container end -->
<c:import url="../layout/footer.jsp"/>
