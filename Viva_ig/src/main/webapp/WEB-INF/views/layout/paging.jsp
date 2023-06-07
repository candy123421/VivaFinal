<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${page.curPage ne 1 }">
		<li class="page-item"><a href="./list" class="page-link">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${page.startPage ne 1 }">
		<li class="page-item"><a href="./list?curPage=${page.startPage - page.pageCount }" class="page-link">&laquo;</a></li>
	</c:when>
	<c:when test="${page.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${page.curPage > 1 }">
		<li class="page-item"><a href="./list?curPage=${page.curPage - 1 }" class="page-link">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${page.startPage }" end="${page.endPage }" var="i">
	<c:if test="${page.curPage eq i }">
		<li class="page-item active"><a href="./list?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	<c:if test="${page.curPage ne i }">
		<li class="page-item"><a href="./list?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${page.curPage < page.totalPage }">
		<li class="page-item"><a href="./list?curPage=${page.curPage + 1 }" class="page-link">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${page.endPage ne page.totalPage }">
		<li class="page-item"><a href="./list?curPage=${page.startPage + page.pageCount }" class="page-link">&raquo;</a></li>
	</c:when>
	<c:when test="${page.endPage eq page.totalPage }">
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${page.curPage ne page.totalPage }">
		<li class="page-item"><a href="./list?curPage=${page.totalPage }" class="page-link">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
















