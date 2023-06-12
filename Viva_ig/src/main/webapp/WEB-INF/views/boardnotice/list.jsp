<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">


// 보현작성  -전체선택 
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

</script>

<style>
table {
	width: 85%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}
th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
</style>


<div class="FunctionTitle">
   FREE BOARD
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<!--------------- 검색 시작 --------------->
<form action="./list?keyword=${keyword}" method="get" name="searchForm">
	<div class="search_wrap">
		<div class="search_area" style="padding-right:10px">
			<select class="searchType" id="searchType">
				<option>제목</option>
			</select>
		</div>
		<div class="search" style="padding-right:10px">
			<input type="text" class="keyword" name="keyword" id="keyword" placeholder="검색어를 입력하세요">
			<button class="btnSearch" id="btnSearch">검색</button>
		</div>
	</div>
</form>
<!--------------- 검색 끝 --------------->



<form action="./list" method="post" name="head">
	<table>
		<thead>
			<tr class = "head">
				<c:if test="${not empty adminlogin and adminlogin }">
					<th><input type='checkbox'
				       name='checkall' 
				       value='selectall'
				       onclick='selectAll(this)'/> Check All</th>
				</c:if>
				<th>공지글 번호</th>
				<th>공지 제목</th>
				<th>작성자</th>
				<th>공지글 작성일</th>
			</tr>
			</thead>
	
	
	<tbody class="body">
		<c:forEach var="boardNoticeList" items="${boardNoticeList}">
			<tr>
				<c:if test="${not empty adminlogin and adminlogin }">
					<td><input type='checkbox'
				       name='check' 
				       value="${boardNoticeList.noticeNo }"
				       onclick='checkSelectAll(this)'/>
					</td>
				</c:if>
					<td>${boardNoticeList.noticeNo }</td>
					<td><a href="./view?boardNo=${boardNoticeList.noticeNo }">${boardNoticeList.noticeTitle }</a></td>
					<td>${boardNoticeList.adminNo}</td> 
					<td><fmt:formatDate value="${boardNoticeList.noticeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<!---------- 버튼 ---------->
	<c:choose>
		<c:when test="${empty adminlogin}">
			<a href="/viva/login"><button type="button">게시글 작성하기</button></a>
		</c:when>
	
		<c:when test="${not empty adminlogin and adminlogin }">
			<a href="./write"><button type="button" id="btnWrite" name="btnWrite">게시글 작성하기</button></a>
			<button id="btnDelete" name="btnDelete" class="btn btn-danger">선택 삭제</button>
		</c:when>
	</c:choose>
	<!---------- 버튼 ---------->
	
	<span class="float-end mb-3">total : ${paging.totalCount }</span>

</form>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
