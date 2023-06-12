<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="../layout/header.jsp"/>   

<style type="text/css">

.credit_list_wrap {
	width : 1400px;
	margin : 0 auto;
}
</style>
<script type="text/javascript">



</script>



<div class="FunctionTitle">
   Admin Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<div class="credit_list_wrap">
<c:if test="${not empty adminlogin and adminlogin}">
	<button class="btn btn-outline-secondary">전체 리스트 확인</button>
	<a href="./exchange"><button class="btn btn-outline-secondary">환전 관리</button></a>
	
	
	<div class="click-result">
	
	
	
	</div>
	
	
	
	
</c:if>
</div>

<c:import url ="../layout/footer.jsp"/>