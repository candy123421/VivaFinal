<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">

</script>

<!---------- 댓글 시작 ---------->
<!----- 댓글 작성 ----->
<div id="comment">
	<form action="/commentWrite" method="post">
<%--      <c:if test="${sessionScope.userNo != null }"> --%>
	<input type="hidden" name="boardNo" value="${boardNo }">
	<textarea id="commContent" name="commContent" placeholder="댓글을 작성하세요" rows="5" cols="50"></textarea><br>
	<button type="button" id="btnComment">댓글 작성</button>
<%--      </c:if> --%>
	</form>
</div>

<!----- 댓글 조회 ----->
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

<!----- 댓글 조회 ----->
<div class="commContent">
		<c:forEach items="${commContent}" var="commContent">
		    <div>
		      <div>
		      작성자 : ${commentList.userNo}<br />
		      작성일 :  <fmt:formatDate value="${commentList.commDate}" pattern="yyyy-MM-dd" />
              </div>
              <p>${commentList.commContent}</p>
		     </div>
		 </c:forEach>   
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />