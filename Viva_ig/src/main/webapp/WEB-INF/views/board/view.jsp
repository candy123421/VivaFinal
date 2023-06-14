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
/* 	height: 100%; */
}

.file-container {
  width: 100%;
  height: 200px; /* 설정한 공간의 높이 */
  overflow: hidden;
  display: ${empty boardFile ? 'none' : 'block'};
}

.file {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
}

#btnUpdate, #btnDelete, #btnList {
	width: 55px;
	height: 35px;
	border-radius: 10px;
	background: #873286;
	color: white;
	text-align: center;
}

#commContent {
	width: 700px;
	height: 100px;
	margin-bottom: 10px;
	border-radius: 10px;
}

#btnComment {
	width: 100px;
	height: 35px;
	margin-left: 600px;
	border-radius: 10px;
	background: #873286;
	color: white;
}

#commContent- {
	border: 1px solid grey;
	border-radius: 10px;
}

input[name="commListContent"] {
	width: 700px;
	height: 80px;
    border: 1px solid grey;
    border-radius: 10px;
}

.btnCommentUpdate, .btnCommentDelete {
	width: 100px;
	height: 35px;
	border-radius: 10px;
	background: #873286;
	color: white;
}

.like{
	cursor: pointer;
}

</style>

<div class="container">
<h1>FREE BOARD View</h1>
<hr>

<c:choose>
	<c:when test="${empty login}">
		로그인 후 이용해 주세요!
		<a href="/viva/login"> <button>Login</button></a>
	</c:when>
	  
	<c:when test="${not empty login and login}">
	<div class="container">
	     <div class="row row1">
	      <table class="table">
	        <tr>
	         <th width=20% class="text-center warning">게시글 번호</th>
	         <td width=20% class="text-center">${viewBoard.boardNo }</td>
			<th width=20% class="text-center warning">조회수</th>
	         <td width=20% class="text-center">${viewBoard.boardHit}</td>
	        </tr>
	        <tr>
	         <th width=20% class="text-center warning">아이디</th>
	         <td width=20% class="text-center">${viewBoard.userId }</td>
			<th width=20% class="text-center warning">작성일</th>
	         <td width=20% class="text-center"><fmt:formatDate value="${viewBoard.boardDate }" pattern="yyyy-MM-dd hh:mm" /></td>
	        </tr>
	        <tr>
	         <th width=20% class="text-center warning" style="height: 50px;">제목</th>
	         <td colspan="3" style="height: 50px;">${viewBoard.boardTitle }</td>
	        </tr>
	        <tr>
	          <td colspan="4" class="text-left" valign="top" height="200">
				<div class="content">${viewBoard.boardContent }</div>
	          </td>
	        </tr>
	        <tr>
	        	<td colspan="4" class="text-left" valign="top" height="50">

						<!-- 좋아요 -->
						<div id="like">
						<c:choose>
							<c:when test="${likeCheck eq true }">
						    	<img id="likeBoard" class="like-icon" src="../resources/icon/heart-fill.svg"  style="width: 45px;">
						    </c:when>
							<c:when test="${likeCheck eq false }">
								<img id="likeBoard" class="like-icon" src="../resources/icon/heart.svg" style="width: 45px;">
							</c:when>
						</c:choose>		
							<span class="like-count" id="likeCount">${likeCount}</span><br>
						</div>
							
	        </tr>
	        <tr>
				<c:if test="${id eq viewBoard.userId }">
	          <td colspan="4" class="btnList">
		            <button id="btnUpdate">수정</button>
		            <button id="btnDelete">삭제</button>
	          </td>
				</c:if>
	        </tr>
	      </table>
	     </div>
	</div>
	<!---------- 첨부파일 ---------->
	<div class="file-container">
		<c:if test="${not empty boardFile }">
			<div class="file" >
				<c:forEach var="boardFile" items="${boardFile}">
					<a href="./download?fileNo=${boardFile.fileNo }">${boardFile.fileNo}</a>
					<img src="/boardUpload/${boardFile.storedname }" alt="❤️"><hr>
				</c:forEach>
			</div>
		</c:if>
	</div>
		
	<!-------------------- 댓글 시작 -------------------->
	<!---------- 댓글 작성 ---------->
	<div id="comment">
		<form action="/commentWrite" method="post" style="padding-top: 30px;"><hr>
			<input type="hidden" name="boardNo" value="${viewBoard.boardNo }">
			<div>${viewBoard.userId}</div>
			<input id="commContent" name="commContent" placeholder=" 댓글을 작성하세요" rows="4" cols="100"><br>
			<button type="button" id="btnComment">댓글 작성</button>
		</form>
	</div>
	<hr>
	
	<!---------- 댓글 목록 ---------->
	<div id="commentList" class="commentList">
		<c:forEach items="${commentList}" var="commentList">
			<input type="hidden" name="commboardNo" value="${commentList.boardNo}">
			<input type="hidden" value="${commentList.commNo}">
			<div id="comm-userId">${viewBoard.userId}</div>
			<input id="commContent-${commentList.commNo}" name="commListContent" value="${commentList.commContent}" readonly="readonly"><br>
				<c:if test="${id eq viewBoard.userId}">
					<button type="button" class="btnCommentUpdate" data-comm-no="${commentList.commNo}">댓글 수정</button>
					<button type="button" class="btnCommentDelete" data-comm-no="${commentList.commNo}">댓글 삭제</button>
	       		</c:if>
	        <div name="writeDate"><fmt:formatDate value="${commentList.commDate}" pattern="yyyy-MM-dd hh:mm" /></div>
		</c:forEach>
	</div>
	</c:when>
</c:choose>
	
<script type="text/javascript">

$(document).ready(function() {
		
	<!-------------------- 좋아요 시작 -------------------->
	//좋아요 구현
	// 좋아요 구현
$("#likeBoard").click(function() {
    var boardno = $(this).parent().data('like'); 	// 부모 요소의 data-like 속성을 가져와서 boardNo 변수에 저장
    var userno = "${viewBoard.userNo}"; 			// userNo 변수

    console.log("${viewBoard.boardNo}");
    console.log(boardno);
    console.log(userno);

    $.ajax({
        type: "GET",
        url: "/board/like",
        data: { "userNo": userno, "boardNo": boardno }, // userNo는 세션에서 받아오기
        dataType: "json",
        success: function(res) {
            if (res.result == true) {
                // 좋아요 추가
                $(this).html('<img src="../resources/icon/heart-fill.svg" style="width:45%">');
                console.log(res);
                console.log(res.result);
                console.log("성공^^");
                $("#likeCount").html(res.likeCount);
                $("#like").children(2).eq(1).html(res.likeCount)
            } else if (res.result == false) {
                // 좋아요 삭제
                $(this).html('<img src="../resources/icon/heart.svg" style="width:45%">');
                console.log(res);
                console.log(res.result);
                console.log("실패ㅠㅠ");
                $("#likeCount").html(res.likeCount);
            }
        }
    });
});

	
//  	var likes = document.querySelectorAll("div[data-like]");
// 	$(".like").click(function() {
// 		var idx = $(".like").index(this)					// 인덱스 변수
// 		var boardno = likes[idx].getAttribute('data-like')	// boardNo 변수
//  		var userno = "${viewBoard.userNo}";					// userNo 변수
		
//  		console.log("${viewBoard.boardNo}");
// 		console.log(boardno);
// 		console.log(userno);
		
// 		$.ajax({
// 			type: "GET",
// 			url: "/board/like",
// 			data: { "userNo": userno, "boardNo": boardno }, //userNo는 세션에서 받아오기
// 			dataType: "json",	//html로 하고
// 			success: function(res) {
			    	
// 			if (res.result == true) {
				
// 				//좋아요 추가
// 				$(".like").eq(idx).html('<img src="../resources/icon/heart-fill.svg" style="width:45%">')
// 				console.log(res);
// 				console.log(res.result);
// 				console.log("성공^^")
// 				$("#like").children(2).eq(1).html(res.likeCount)
// 			} else if (res.result == false) {
// 				//좋아요 삭제
// 				$(".like").eq(idx).html('<img src="../resources/icon/heart.svg" style="width:45%">')
// 				console.log(res);
// 				console.log(res.result);
// 				console.log("실패ㅠㅠ")
// 				$("#like").children(2).eq(1).html(res.likeCount)
// 			}
			
// 			console.log(res.likeCount);
			
			//받은 응답에서 누적 카운트 업데이트
// 			var likeCount = res.likeCount;
// 			console.log(likeCount);
// 			$(".like-count").eq(idx).text(likeCount);
	
// 				console.log(res);
// 				console.log(res.likeCount);

				// 좋아요 누적 카운트 업데이트
// 				$("#total-like-count").text(res.totalLikeCount);
// 			},
// 				error: function(xhr, status, error) {
// 				console.log(error);
// 			} //success end
// 		}) //ajax end
// 	}) //like end


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

	<div class="btnList" style="text-align: center;">
		<button id="btnList">목록</button>
	</div>    

</div><!-- .container end -->

<c:import url="../layout/footer.jsp"/>
