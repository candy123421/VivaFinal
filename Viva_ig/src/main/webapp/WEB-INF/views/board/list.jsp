<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">

// 전체선택 
function checkSelectAll(checkbox)  {
  const selectall 
    = document.querySelector('input[name="checkall"]');
  
  if(checkbox.checked === false)  {
    selectall.checked = false;
  }
}

function selectAll(selectAll)  {
  const checkboxes 
     = document.getElementsByName('check');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}

//삭제하는건데 DB를 거쳐야하기때문에 이건 아닌거같긴함 
// document.addEventListener("DOMContentLoaded", function() {
//     var del = document.querySelector("#btnDelete");
//     del.onclick = function() {
//         // 삭제 작업 수행
//         del.parentElement.parentElement.remove();
//     }
// });
</script>

<style>
table {
	width: 77%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}
th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

</style>



<div class="top">
<h1>FREE BOARD</h1>
</div>


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
		<select name="category">
			<option value="자유">자유</option>
			<option value="공지">공지</option>
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
<c:forEach var="boardList" items="${boardList}">
<tr>
	<c:if test="${not empty adminlogin and adminlogin }">
	
	<td><input type='checkbox'
       name='check' 
       value="${boardList.boardNo }"
       onclick='checkSelectAll(this)'/></td>
	</c:if>
	<td>${boardList.boardNo }</td>
	<td>${boardList.categoryType }</td>
	<td><a href="./view?boardNo=${boardList.boardNo }">${boardList.boardTitle }</a></td>
	<td>sss</td> 
	<td>${boardList.boardHit }</td>
	<td><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</tbody>
</div>
</table>

<a href="./write"><button>게시글 작성하기</button></a>
	<c:if test="${not empty adminlogin and adminlogin }">
	<form action="./list" method="post">
		<button id="btnDelete" name = "btnDelete" class="btn btn-danger">선택삭제</button>
		</form>
	</c:if>
<span class="float-end mb-3">total : ${paging.totalCount }</span>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


<c:import url="/WEB-INF/views/layout/footer.jsp" />


