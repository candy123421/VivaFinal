<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./list";
	})
	
	$("#btnUpdate").click(function() {
		location.href="./update?boardNo=${viewBoard.boardNo}";
	})
	
	$("#btnDelete").click(function() {
		location.href="./delete?boardNo=${viewBoard.boardNo}";
	}) 
	
	//댓글 불러오기
	//댓글 작성
	$("#btnComment").click(function() {
		//var contextPath = '<%= request.getContextPath() %>';
		//console.log(contextPath);
		//return false;
		var commContent=$("#commContent").val();	//댓글 내용
		var boardNo = "${board.boardNo}";			//게시물 번호
		//var param="commentContent" + commentContent + "&boardNo" + boardNo;
		
		console.log(commContent);
		
		$.ajax({
			type: "post",
			url: "/board/commentWrite",
			data: {commContent: commContent, boardNo: boardNo},
			success: function(result) {
				
		        var commentHtml = '';
		        for (var i=0; i<result.length; i++) {
		            commentHtml += '<p>' + result[i].commContent + '</p>';
		        }
					
				//댓글 작성 성공 시 처리할 동작
				if( result == "success") {
					
//                $("#commentList").html(result);
				$("#commentList").html(commentHtml);
				
                alert("댓글이 작성되었습니다.");
                console.log(result);
                location.reload(); // 페이지 새로고침
				}
				
				$('#commContent').val(''); 		//댓글 등록시 댓글 등록창 초기화
	            viewComment();					//등록후 댓글 목록 불러오기 함수 실행
	            //DOM 조작 함수호출 등 가능
            },
            error: function() {
                //Ajax 요청 실패 시 처리할 동작
                alert("댓글 작성에 실패했습니다.");
            }
		}) //ajax end
	})//$("#btnComment").click(function() end
			
			
	
	 //댓글 조회 ajax
	   function viewComment() {
		   var boardNo = $('input[name=boardNo]').val();
		      $.ajax({
		    	  type: 'GET',
		          url: "/board/commentView",
		          data: {boardNo},
		          success: function(result) {
		        	  console.log(result);
		              for(var i=0; i<result.length; i++) {
		            	  var str = "<div class=\"comment\">"
		                  str += result[i].commentList+"</div></hr>"
		                  $("#comments.commentList").append(str);
		              } //for end
		          }, //success end
		          
		         error: function(result) {
		            
		         },
		         complete: function() {
		            
		         }

		      }) //ajax end
	}	//function viewComment() end
})

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

<!---------- 댓글 시작 ---------->
<!----- 댓글 작성 ----->
<div id="comment">
	<form action="/commentWrite" method="post">
	<input type="hidden" name="boardNo" value="${boardNo }">
	<textarea id="commContent" name="commContent" placeholder="댓글을 작성하세요" rows="5" cols="50"></textarea><br>
	<button type="button" id="btnComment">댓글 작성</button>
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
<c:import url="../layout/footer.jsp"/>
