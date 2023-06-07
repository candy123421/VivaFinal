<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>    

<h1>장바구니 페이지</h1>
<form action = "./list" method="post">
<!-- <form action = "./listTest" method="post"> -->
<label>회원번호<input type="text" name="userNo"></label>
<button>검색</button>
</form>

<c:import url ="../layout/footer.jsp"/>