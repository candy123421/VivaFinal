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

.container-top {
	width: 1400px;
/* 	margin: 1 auto; */
}

.container {
	width: 1400px;
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


</style>

<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">FREE BOARD</div>
	<div class="FunctionTitleLine" style="margin: 0 auto;">
	   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>
<!--------------- 검색 시작 --------------->
<!-- <div class="container"> -->
<%-- <form action="./list?keyword=${keyword}" method="get" name="searchForm"> --%>
<!-- 	<div class="search_wrap"> -->
<!-- 		<div class="search_area" style="padding-right:10px"> -->
<!-- 			<select class="searchType" id="searchType"> -->
<!-- 				<option>제목</option> -->
<!-- 			</select> -->
<!-- 		</div> -->
<!-- 		<div class="search" style="padding-right:10px"> -->
<!-- 			<input type="text" class="keyword" name="keyword" id="keyword" placeholder="검색어를 입력하세요"> -->
<!-- 			<button class="btnSearch" id="btnSearch">검색</button> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </form> -->
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
	<span class="float-end mb-3">total : ${paging.totalCount }</span>
</div>	 
	<!---------- 버튼 ---------->
<c:choose>
    <c:when test="${empty adminlogin}">
        <a href="/viva/login"><button type="button">게시글 작성하기</button></a>
    </c:when>
    <c:when test="${not empty adminlogin and adminlogin}">
        <div>
            <button id="btnDelete" name="btnDelete" class="btn btn-danger" style="margin-top: 10px;">선택 삭제</button>
            <div style="display: inline-block;">
                <a href="./write"><button type="button" id="btnWrite" name="btnWrite">게시글 작성하기</button></a>
            </div>
        </div>
    </c:when>
</c:choose>
	<!---------- 버튼 ---------->
</form>
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
