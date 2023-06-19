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

.container {
	width: 1400px;
	margin-left: 100px;
}

.container-top {
	width: 1400px;
/* 	margin: 1 auto; */
}

.container-table {
    width: 1400px;
    margin: 0 auto;
    margin-top: 20px;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	font-size: 17px;
}

th, td {
	height: 50px;
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #444444;
}

th {
	font-size: 19px;
}

.search_wrap, .filterSelect {
	width: 100%;
	height: 50px;
	margin-top: 30px;
	margin-bottom: 10px;
	text-align: center;
}

.searchType, .filterSelect {
	width: 70px;
	height: 35px;
	border-radius: 15px;
}

 .keyword { 
 	width: 600px; 
 	height: 35px; 
 	margin-left: 3px; 
 	margin-right: 10px; 
 	border-radius: 15px;
 }

.filterSelect {
	width: 70px;
	border-radius: 15px;
}

.btnSearch {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:120px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
}
.btnSearch:hover {
	background: #fffbd5;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #b20a2c, #fffbd5);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #b20a2c, #fffbd5); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:150px;
	height:40px;
	color: white;
}

.btnWrite:focus, .btnSearch:focus {
	outline: none;
}

.paging {
	width: 1400px;
	margin: 0 auto;
	text-align: -webkit-center;
}

</style>

<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">Notice BOARD</div>
	<div class="FunctionTitleLine" style="margin: 0 auto;">
	   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>
<!--------------- 검색 시작 --------------->
<div class="container">
<form action="./list?keyword=${keyword}" method="get" name="searchForm">
	<div class="search_wrap">
		<div class="search_area" style="display: flex; align-items: center; justify-content: center;">
			<select class="searchType" id="searchType" style="margin-right: 10px;">
				<option>제목</option>
			</select>
			<input type="text" class="keyword" name="keyword" id="keyword" placeholder="검색어를 입력하세요">
			<button class="btnSearch" id="btnSearch">검색</button>
		</div>
	</div>
</form>

	
<%-- 	<form action="./list?keyword=${keyword}" method="get" name="searchForm"> --%>
<!-- 		<div class="search_wrap"> -->
<!-- 			<div class="search_area" style="padding-right:10px"> -->
<!-- 				<select class="searchType" id="searchType"> -->
<!-- 					<option>제목</option> -->
<!-- 				</select> -->
<!-- 			</div> -->
<!-- 			<div class="search" style="padding-right:10px"> -->
<!-- 				<input type="text" class="keyword" name="keyword" id="keyword" placeholder="검색어를 입력하세요"> -->
<!-- 				<button class="btnSearch" id="btnSearch">검색</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</form> -->
<!--------------- 검색 끝 --------------->


<div class=container-table>
	<table>
		<thead>
			<tr class="head">
				<c:if test="${not empty adminlogin and adminlogin }">
					<th><input type='checkbox'
				       name='checkall' 
				       value='selectall'
				       onclick='selectAll(this)'/> Check All</th>
				</c:if>
				<th class="table-th">공지글 번호</th>
				<th class="table-th">공지 제목</th>
				<th class="table-th">작성자</th>
				<th class="table-th">공지글 작성일</th>
			</tr>
			</thead>
	
	
	<tbody class="body">
		<c:forEach var="boardNoticeList" items="${boardNoticeList}">
<%-- 		<c:forEach var="boardNotice" items="${boardNoticeList}"> --%>
		
			<tr>
				<c:if test="${not empty adminlogin and adminlogin }">
					<td class="table-td"><input type='checkbox'
				       name='check' 
				       value="${boardNoticeList.noticeNo }"
				       onclick='checkSelectAll(this)'/>
					</td>
				</c:if>
					<td class="table-td">${boardNoticeList.noticeNo }</td>
					<td class="table-td"><a href="./view?noticeNo=${boardNoticeList.noticeNo }">${boardNoticeList.noticeTitle }</a></td>
					<td class="table-td">${boardNoticeList.adminNo}</td> 
					<td class="table-td"><fmt:formatDate value="${boardNoticeList.noticeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
<div class="float-end mb-3" style="display: block;">total : <span id="totalCount">${paging.totalCount}</span></div>

 	<!---------- 버튼 ---------->
	<div class="btnList">
	    <c:choose>
	        <c:when test="${empty adminlogin}">
	            <a href="/viva/login"><button type="button" name="btnWrite" class="btnWrite">게시글 작성하기</button></a>
	        </c:when>
	        <c:when test="${not empty adminlogin and adminlogin}">
	            <button id="btnDelete" name="btnDelete" class="btn btn-danger">선택 삭제</button>
	        </c:when>
	    </c:choose>
	</div>

<!-- 게시글 작성하기 -->
<c:choose>
    <c:when test="${not empty adminlogin and adminlogin}">
        <div class="float-end" style="padding-top: 10px;">
            <a href="./write"><button type="button" id="btnWrite" name="btnWrite" class="btn btn-danger">게시글 작성하기</button></a>
        </div>
    </c:when>
</c:choose>
	
	
</form>
</div>
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp"/>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
