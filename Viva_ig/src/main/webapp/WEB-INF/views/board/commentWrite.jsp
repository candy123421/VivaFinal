<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


function getReplyList() {
	var board = "${board.boardNo}";
		$.ajax({
		rl : "/board/replyList.kh",
		data : {
		"boardNo" : board
		},
		type : "get",
		success : function(result) { //댓글목록 불러오는 함수
						var $tableBody = $('#rtb tbody'); //$는 의미없음 그냥 변수명 중 하나
						$tableBody.html(''); //tbody를 초기화 시켜야 댓글 목록의 중첩을 막을수 있음 아니면 등록할떄마다 append로 이어짐
						$('#rCount').text("댓글 ("+result.length+")") //댓글수 출력
						if (result != null) {
							console.log(result);
							for ( var i in result) {
								var $tr = $("<tr>");
								var $rWriter = $("<td width='100'>").text(
										result[i].replyWirter);
								var $rContent = $("<td>").text(
										result[i].replyContents);
								var $rCreatDate = $("<td width='100'>").text(
										result[i].rCreateDate);
								var $btnArea = $("<td width='80'>").append(
										"<a href='modifyreply(${board.boardNo})'>수정</a>").append(
										"<a href='#'>삭제</a>");

								$tr.append($rWriter);
								$tr.append($rContent);
								$tr.append($rCreatDate);
								$tr.append($btnArea);
								$tableBody.append($tr);

							}
						}

					},
					error : function() {
						console.log("요청실패");

					}
				})

			}
		


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

<c:import url="../layout/footer.jsp"/>