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

//카테고리 AJAX
$(document).ready(function() {
// 				  	var filterSelect = $(".filterSelect"); // jQuery 
	var filterSelect = $("select[name='categoryType']"); // jQuery

	filterSelect.on("change", function(e) {
		e.preventDefault();
		console.log("변화감지..!");
	    
// 					    var status = this.options[this.selectedIndex].value;
// 					    var status = $(this).val();
		var status = $(this).find(":selected").val();
	    console.log("status : ", status);
	    
	    $.ajax({
	    	url: "/board/list",
	    	type : "GET",
	    	data : {categoryType : status},
	    	success : function(result) {
	    		console.log("ajax 성공");
	    		$('body').html(result);
	    	}
	    })
	});
});
</script>

<style>

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
/* 	background: #9F468F; */
/* 	background: #710193; */
/* 	background: #873286; */
/* 	background: #67127C; */
/*  	color: white; */
}

.search_wrap {
	width: 100%;
	height: 50px;
	margin-top : 10px;
	margin-bottom: 10px;
	text-align: center;
}

.searchType {
	width: 70px;
	height:35px;
	
	border-radius: 15px;
}

.keyword {
	width: 600px;
	height: 35px;
	margin-left: 3px;
	margin-right: 3px;
	
	border-radius: 15px;
}

.btnSearch {
	width: 55px;
	height: 35px;
	border-radius: 15px;
	
	background: #873286;
	color: white;
}

.filterSelect {
	width: 60px;
	border-radius: 15px;
}

.btnWrite {
	width: 140px;
	height: 35px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 15px;
	
	background: #873286;
	color: white;
}

.buttons {
	float: right;
}

.totalBoardCount {
    width: 1400px;
/*     text-align: -webkit-center; */
    margin: 0 auto;
    text-align: right;
}

.container-list {
	width : 1400px;
	margin : 0 auto;
}

.container-button {
	float: right;
}

.paging {
	width: 1400px;
	margin: 0 auto;
	text-align: -webkit-center;
}


</style>

<div class="container-top">
	<div class="FunctionTitle" style="margin: 1 auto;">
	   FREE BOARD
	</div>
	<div class="FunctionTitleLine">
	   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>
<!-------------------- 검색 시작 -------------------->
	<form action="./list?keyword=${keyword}" method="get" name="searchForm">
		<div class="search_wrap">
			<select class="searchType" id="searchType">
				<option>제목</option>
			</select>
			<input type="text" class="keyword" name="keyword" id="keyword" placeholder=" 검색어를 입력하세요">
			<button class="btnSearch" id="btnSearch">검색</button>
		</div>
	</form>
<!-------------------- 검색 끝 -------------------->


<form action="./list" method="post" name="form-head" style="width: 1400px; margin: 0 auto;">
	<div class="container-list" >
		<table style="width: 1400px;">
			<thead>
				<tr class="head">
					<c:if test="${not empty adminlogin and adminlogin }">
						<th><input type='checkbox'
					       name='checkall' 
					       value='selectall'
					       onclick='selectAll(this)'/> Check All</th>
					</c:if>
						<th>게시글 번호</th>
						<th>카테고리
							<select class="filterSelect" name="categoryType">
							    <option value="all" selected="${categoryType == null || categoryType == 'all' || categoryType == 'free' || categoryType == 'qna'}">전체</option>
							    <option value="free" selected="${categoryType == 'free'}">자유</option>
							    <option value="qna" selected="${categoryType == 'qna'}">질문</option>
							</select>
						</th>
					<th>게시글 제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>게시글 작성일</th>
				</tr>
			</thead>
		
		<tbody class="body">
			<c:forEach var="boardList" items="${boardList}">
				<tr>
					<c:if test="${not empty adminlogin and adminlogin }">
						<td><input type='checkbox'
					       name='check' 
					       value="${boardList.boardNo }"
					       onclick='checkSelectAll(this)'/>
						</td>
					</c:if>
						<td>${boardList.boardNo }</td>
						<td>${boardList.categoryType }</td>
						<td><a href="./view?boardNo=${boardList.boardNo }">${boardList.boardTitle }</a></td>
						<td>${boardList.userId}</td> 
						<td>${boardList.boardHit }</td>
						<td><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div> <!--  -->

	<div class="totalBoardCount">total : ${page.totalCount }</div>

	<!---------- 버튼 ---------->
	<div class="container-button">
		<c:choose>
			<c:when test="${empty login}">
				<a href="/viva/login"><button type="button" class="btnWrite">게시글 작성하기</button></a>
			</c:when>
			<c:when test="${not empty login and login}">
				<a href="./write"><button type="button" id="btnWrite" class="btnWrite" name="btnWrite">게시글 작성하기</button></a>
			</c:when>
		</c:choose>
		
		<c:if test="${not empty adminlogin and adminlogin }">
			<button id="btnDelete" name="btnDelete" class="btn btn-danger">선택 삭제</button>
		</c:if>

		<th>게시글 번호</th>
		<th>카테고리
			<select class="filterSelect" name="search_option" >
						<option value="all">전체</option>
						<option value="free">자유</option>
						<option value="notice">공지</option>
			</select>
			
			<script>
			var filterSelect = $(".filterSelect") // jQuery 

			filterSelect.on("change", function(e) {
				e.preventDefault();.
				console.log("변화감지..!");
			    
			    var status = this.options[this.selectedIndex].value;
			    console.log("status : ", status);
			    
			    $.ajax({
			    	url: "/board/list",
			    	type : "GET",
			    	data : {categoryType : status},
			    	success : function() {
			    		console.log("ajax 성공");
			    	}
			    })
			});
			</script>
		</th>
		<th>게시글 제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>게시글 작성일</th>
	</tr>
	</thead>
	<tbody class="body">
		<c:forEach var="boardList" items="${boardList}">
			<tr>
				<c:if test="${not empty adminlogin and adminlogin }">
					<td><input type='checkbox'
				       name='check' 
				       value="${boardList.boardNo }"
				       onclick='checkSelectAll(this)'/>
					</td>
				</c:if>
					<td>${boardList.boardNo }</td>
					<td>${boardList.categoryType }</td>
					<td><a href="./view?boardNo=${boardList.boardNo }">${boardList.boardTitle }</a></td>
					<td>${boardList.userId}</td> 
					<td>${boardList.boardHit }</td>
					<td><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>

	</div> 
</form>	





<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
