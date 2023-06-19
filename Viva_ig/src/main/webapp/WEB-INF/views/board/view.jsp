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

.file-container {
  width: 100%;
  overflow: hidden;
  display: ${empty boardFile ? 'none' : 'block'};
}

.file {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
}

.like-wrapper {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 10px;
}

.like-container {
  display: flex;
  align-items: center;
}


.btnUserList {
	text-align: right;
	margin-bottom: 10px;
}


.btnUpdate, .btnDelete, .btnList, .btnComment, .btnList, .btnCommentUpdate, .btnCommentDelete {
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

.btnUpdate:focus, .btnDelete:focus, .btnList:focus, .btnComment:focus, .btnCommentUpdate:focus, .btnCommentDelete:focus  {
	outline: none;
}

.btnUpdate:hover, .btnDelete:hover, .btnList:hover, .btnComment:hover, .btnCommentUpdate:hover, .btnCommentDelete:hover {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:70px;
	height:40px;
	color: white;
}

.btnCommentList {
	text-align: right;
	margin-top: 10px;
	margin-left: 10px;
}

#commContent {
	width: 1300px;
	height: 120px;
	margin-bottom: 10px;
	border-radius: 10px;
	border: 1px solid grey;
	border-radius: 10px;
}

input[name="commListContent"] {
	width: 1300px;
	height: 120px;
    border: 1px solid grey;
    border-radius: 10px;
}

.like{
	cursor: pointer;
}

</style>

<!-- <div class="container"> -->
<!-- <h1>FREE BOARD View</h1> -->
<!-- <hr> -->
<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">FREE BOARD View</div>
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
				<td class="table-td">${viewBoard.boardNo }</td>
				<th class="table-th">조회수</th>
	         	<td class="table-td">${viewBoard.boardHit}</td>
	        </tr>
	        
	        <tr>
			<th class="table-th">아이디</th>
			<td class="table-td">${viewBoard.userId }</td>
			<th class="table-th">작성일</th>
			<td class="table-td"><fmt:formatDate value="${viewBoard.boardDate }" pattern="yyyy-MM-dd hh:mm" /></td>
	        </tr>
	        
	        <tr>
			<th width=20% class="table-th" style="height: 50px;">제목</th>
			<td colspan="3" style="height: 50px;">${viewBoard.boardTitle }</td>
	        </tr>
	        
	        <tr>
<!-- 			<td class="table-td" valign="top" style="height: 300px; width: 1200px;"> -->
			<td class="content" colspan="4" style="height: 300px; width: 1000px;">${viewBoard.boardContent }
			
			<div class="file-container">
				<c:if test="${not empty boardFile }">
					<div class="file" >
						<c:forEach var="boardFile" items="${boardFile}">
							<img src="/boardUpload/${boardFile.storedname }" alt="❤️"><hr>
							<a href="./download?fileNo=${boardFile.fileNo }">${boardFile.fileNo}</a>
						</c:forEach>
					</div>
				</c:if>
			</div>
			
			
			</td>
	        </tr>
	      </table>
	      <!---------- 첨부파일 ---------->
	        
<div class="like-wrapper">
  <div class="like-container">
    <img id="commentImg" class="commentImg" src="../resources/icon/comments.svg" style="width: 45px; margin-right:10px;">
    <div id="like" class="like">
      <c:choose>
        <c:when test="${likeCheck eq true}">
          <img id="likeBoard" class="like-icon" src="../resources/icon/heart-fill.svg" style="width: 45px;">
        </c:when>
        <c:when test="${likeCheck eq false}">
          <img id="likeBoard" class="like-icon" src="../resources/icon/heart.svg" style="width: 45px;">
        </c:when>
      </c:choose>
      <span class="like-count" id="likeCount">${likeCount}</span>
    </div>
  </div>
  <c:if test="${id eq viewBoard.userId}">
    <div class="btnUserList">
      <button class="btnUpdate" id="btnUpdate">수정</button>
      <button class="btnDelete" id="btnDelete">삭제</button>
    </div>
  </c:if>
  <c:if test="${adminlogin }">
  
      <button class="btnDelete" id="btnDelete">삭제</button>
  </c:if>
</div>

	<!-------------------- 댓글 시작 -------------------->
	<!---------- 댓글 작성 ---------->
	<div id="container-commentWrite" class="container-commentWrite">
		<form action="/commentWrite" method="post"><hr>
			<input type="hidden" name="boardNo" value="${viewBoard.boardNo}">
			<div style="display: flex; align-items: center; margin-bottom: 10px;">
				<img src="../../../profile/${userProfile}" style="width: 45px; border-radius:50px;">
			<div style="margin-left: 10px;">${userInfo.userNick}</div>
			</div>
			<input id="commContent" name="commContent" placeholder="댓글을 작성하세요" rows="4" cols="100"><br>
			<div style="display: flex; justify-content: flex-end;">
				<button type="button" id="btnComment" class="btnComment" style="margin-left: auto;">댓글 작성</button>
			</div>
		<hr>
		</form>
	</div>
	<!---------- 댓글 목록 ---------->
	<div id="commentList" class="commentList">
		<c:forEach items="${commentList}" var="commentList">
			<input type="hidden" name="commboardNo" value="${commentList.boardNo}">
			<input type="hidden" value="${commentList.commNo}">
			<div style="display: flex; align-items: center; margin-bottom: 10px;">
			  <img src="../resources/icon/profile.svg" style="width: 45px;">
			  <div style="margin-left: 10px;">${viewBoard.userId}</div>
			  <div style="flex: 1;"></div>
			  <div name="writeDate" style="order: 2;"><fmt:formatDate value="${commentList.commDate}" pattern="yyyy-MM-dd hh:mm" /></div>
			</div>
			<input id="commContent-${commentList.commNo}" name="commListContent" value="${commentList.commContent}" readonly="readonly"><br>
				<div class="btnCommentList">
				<c:if test="${id eq viewBoard.userId}">
					<button type="button" class="btnCommentUpdate" data-comm-no="${commentList.commNo}">댓글 수정</button>
					<button type="button" class="btnCommentDelete" data-comm-no="${commentList.commNo}">댓글 삭제</button>
	       		</c:if>
	       		<c:if test="${adminlogin }">
					<button type="button" class="btnCommentDelete" data-comm-no="${commentList.commNo}">댓글 삭제</button>
	       		
	       		</c:if>
				</div>
		<hr>
		</c:forEach>
	</div>
	<!-------------------- 댓글 끝 -------------------->
	</c:when>
</c:choose>
	<div class="container-btnList" style="display: flex; justify-content: center; align-items: center;">
		<button id="btnList" class="btnList">목록</button>
	</div>
  
</div><!-- .container end -->


<script type="text/javascript">

$(document).ready(function() {
		
	<!-------------------- 좋아요 시작 -------------------->
	//좋아요 구현
	$("#likeBoard").click(function() {
		
	    var boardno = "${viewBoard.boardNo}";	//부모 요소의 data-like 속성을 가져와서 boardNo 변수에 저장
	    var userno = "${userNo}"; 				//userNo 변수
	
	    console.log(boardno);
	    console.log(userno);
	
	    $.ajax({
	        type: "GET",
	        url: "/board/like",
	        data: { "userNo": userno, "boardNo": boardno }, // userNo는 세션에서 받아오기
	        dataType: "json",
	        success: function(res) {
	            if (res.result == true) {
	                //좋아요 추가
	                $("#likeBoard").attr("src","../resources/icon/heart-fill.svg")
	                console.log(res);
	                console.log("성공^^");
	                $("#likeCount").html(res.likeCount);
	            } else if (res.result == false) {
	                //좋아요 삭제
	                $("#likeBoard").attr("src","../resources/icon/heart.svg")
	                console.log(res);
	                console.log("실패ㅠㅠ");
	                $("#likeCount").html(res.likeCount);
	            }
	        }
	    });
	});
	<!-------------------- 좋아요 끝 -------------------->

	
	<!-------------------- 게시글 버튼 시작 -------------------->
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
	<!-------------------- 게시글 버튼 끝 -------------------->
	
	
	<!-------------------- 댓글 시작 -------------------->
	//댓글 작성 ajax
	$("#btnComment").click(function() {
		var commContent=$("#commContent").val();	//댓글 내용
		var boardNo = "${board.boardNo}";			//게시물 번호

		$.ajax({
			type: "post",
			url: "/board/commentWrite",
			data: {commContent: commContent, boardNo: boardNo},
			success: function(result) {
		        if (result.length > 0) {
	                $("#commentList").html(result);
	                alert("댓글이 작성되었습니다.");
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert("댓글 작성에 실패했습니다.");
	            }
	            $('#commentList').val('');	// DOM 조작 함수호출 등 가능
	        },
            error: function() {
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
	
	//하
	//댓글 수정 ajax
	 $(document).on("click", ".btnCommentUpdate", function() {
		 //새로 입력할 댓글 창 보여주기
		var newComm = prompt('댓글을 새로 입력해주세요');
		var boardNo = "${board.boardNo}";
		var commNo = $(this).data("comm-no");
		
	    $.ajax({
	        type: 'POST',
	        url: "/board/commentUpdate",
	        data: { boardNo: boardNo, commNo: commNo, commContent: newComm },
	        success: function(result) {
	            console.log("AJAX 댓글 수정 성공!")
 				alert("댓글이 수정되었습니다.");
				location.reload(); // 페이지 새로고침
	        },
	        error: function(error) {
	        	alert("댓글 수정에 실패했습니다.");
	        }
	    });  //$.ajax end
	}); //$("#btnCommentUpdate").click(function() end
	
			
	//댓글 삭제 ajax
	$('.btnCommentDelete').click(function() {
		
		var idx = $(".btnCommentDelete").index(this);
		var boardNo = $("input[name='commboardNo']").val();
        var commNo = $(".btnCommentDelete").eq(idx).attr('data-comm-no');
        
        console.log(boardNo);
        console.log(commNo);

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
	<!-------------------- 댓글 끝 -------------------->
}) //$(document).ready(function() end

</script>

<c:import url="../layout/footer.jsp"/>
