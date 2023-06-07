<!-- searchResults.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<div class="head">
<table>
<thead>
<tr>
	<c:if test="${not empty adminlogin and adminlogin }">
	<th><input type='checkbox'
       name='checkall' 
       value='selectall'
       onclick='selectAll(this)'/> Check All</th>
	</c:if>
	<th>게시글 번호</th>
	<th>카테고리
		<select id="category" name="category" onchange="optionChange()">
			<option value="all">전체</option>
			<option value="free">자유</option>
			<option value="notice">공지</option>
<%-- 			<option value="free" <c:if test="${boardList==자유}"> selected </c:if>>자유</option> --%>
<%-- 			<option value="notice" <c:if test="${boardList==공지}"> selected </c:if>>공지</option> --%>
		</select>
	</th>
	<th>게시글 제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>게시글 작성일</th>
</tr>
</thead>
</div>

<div class="body">
	<tbody>
		<c:forEach var="searchList" items="${searchList}">
			<tr>
				<c:if test="${not empty adminlogin and adminlogin }">
				
				<td><input type='checkbox'
			       name='check' 
			       value="${searchList.boardNo }"
			       onclick='checkSelectAll(this)'/></td>
				</c:if>
				<td>${searchList.boardNo }</td>
				<td>${searchList.categoryType }</td>
				<td><a href="./view?boardNo=${searchList.boardNo }">${searchList.boardTitle }</a></td>
				<td>sss</td> 
				<td>${searchList.boardHit }</td>
				<td><fmt:formatDate value="${searchList.boardDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</tbody>
</div>
</table>


<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
