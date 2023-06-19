<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
//보현작성  -전체선택 
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

	function selectCategoryType() {

		console.log("실행 되는거지?");

		var categoryType = document.getElementById('categoryType').value;
		var keyword = document.getElementById('keyword').value;

		//서버로부터 해당 카테고리 유형에 맞는 데이터 가져오기
		var newURL = "./list?categoryType=" + categoryType;

		console.log(categoryType);
	
		if (keyword) {
			newURL += "&keyword=" + encodeURIComponent(keyword);
		}
		window.location.href = newURL;
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
	/*    background: #9F468F; */
	/*    background: #710193; */
	/*    background: #873286; */
	/*    background: #67127C; */
	/*     color: white; */
}

.search_wrap, .filterSelect {
	width: 100%;
	height: 50px;
	margin-top: 10px;
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
 	margin-right: 3px; 
 	border-radius: 15px;
 }

.filterSelect {
	width: 70px;
	border-radius: 15px;
}

.btnWrite, .btnSearch {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:150px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
}

.btnWrite:focus, .btnSearch:focus  {
	outline: none;
}

.btnWrite:hover, .btnSearch:hover {
/* 	background: #7F00FF;  /* fallback for old browsers */ 
/* background: -webkit-linear-gradient(to left, #E100FF, #7F00FF);  /* Chrome 10-25, Safari 5.1-6 */ 
/* background: linear-gradient(to left, #E100FF, #7F00FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ 

/* background: #3A1C71;  /* fallback for old browsers */ 
/* background: -webkit-linear-gradient(to left, #FFAF7B, #D76D77, #3A1C71);  /* Chrome 10-25, Safari 5.1-6 */ 
/* background: linear-gradient(to left, #FFAF7B, #D76D77, #3A1C71); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ 
			
/* background: #c0392b;  /* fallback for old browsers */ 
/* background: -webkit-linear-gradient(to left, #8e44ad, #c0392b);  /* Chrome 10-25, Safari 5.1-6 */ */
/* background: linear-gradient(to left, #8e44ad, #c0392b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ 
	
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:70px;
	height:40px;
	color: white;
}

.container-button {
	width: 1400px;
	margin: 0 auto;
	text-align: right;
/*  	justify-content: float; */
/* 	float: right; */
}

.totalBoardCount {
	width: 1400px;
/* 	text-align: -webkit-center; */
	margin: 0 auto;
 	text-align: left;
}

.container-list {
	width: 1400px;
	margin: 0 auto;
}

.paging {
	width: 1400px;
	margin: 0 auto;
	text-align: -webkit-center;
}
</style>

<div class="container-top">
	<div class="FunctionTitle" style="margin: 0 auto;">Admin FREE BOARD</div>
	<div class="FunctionTitleLine" style="margin: 0 auto;">
		<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
	</div>
</div>


<!-------------------- 검색 시작 -------------------->
<div class="container">
	<form action="./list" method="get" name="searchForm">
		<div class="search_wrap">
			<select class="searchType" id="searchType">
				<option>제목</option>
			</select> <select class="filterSelect" id="categoryType" name="categoryType"
				onchange="selectCategoryType()">
				<c:choose>
					<c:when test="${categoryType eq null}">
						<option value="all" selected>전체</option>
						<option value="free">자유</option>
						<option value="qna">질문</option>
					</c:when>
					<c:when test="${categoryType.equals('')}">
						<option value="all" selected>전체</option>
						<option value="free">자유</option>
						<option value="qna">질문</option>
					</c:when>
					<c:when test="${categoryType.equals('all')}">
						<option value="all" selected>전체</option>
						<option value="free">자유</option>
						<option value="qna">질문</option>
					</c:when>

					<c:when test="${categoryType eq 'free'}">
						<option value="all">전체</option>
						<option value="free" selected>자유</option>
						<option value="qna">질문</option>
					</c:when>
					<c:when test="${categoryType.equals('free')}">
						<option value="all">전체</option>
						<option value="free" selected>자유</option>
						<option value="qna">질문</option>
					</c:when>

					<c:when test="${categoryType eq 'qna'}">
						<option value="all">전체</option>
						<option value="free">자유</option>
						<option value="qna" selected>질문</option>
					</c:when>
					<c:when test="${categoryType.equals('qna')}">
						<option value="all">전체</option>
						<option value="free">자유</option>
						<option value="qna" selected="selected">질문</option>
					</c:when>
					<c:when test="${categoryType eq categoryType}">
						<option value="all">전체</option>
						<option value="free">자유</option>
						<option value="qna">질문</option>
					</c:when>
				</c:choose>
			</select> <input type="text" class="keyword" name="keyword" id="keyword"
				placeholder=" 검색어를 입력하세요">
			<button class="btnSearch" id="btnSearch">검색</button>
		</div>
		</form>
		<!-- search_wrap end -->
		<!--    </form> -->
		<!-------------------- 검색 끝 -------------------->

	<form action="/admin/boardlist" method="post" name="form-head" style="width: 1400px; margin: 0 auto;">
		<div id="formAfter">
			<div class="container-list">
				<table class="table" style="width: 1400px;">
					<thead>
						<tr class="thead">
							<th class="table-th"><input type='checkbox' name='checkall'  value='selectall' onclick='selectAll(this)'/>Check All</th>
							<th class="table-th">게시글 번호</th>
							<th class="table-th">카테고리</th>
							<th class="table-th">게시글 제목</th>
							<th class="table-th">작성자</th>
							<th class="table-th">조회수</th>
							<th class="table-th">게시글 작성일</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach var="boardList" items="${boardList}">
							<tr class="board-item">
								<!--  첫번째 row 시작 -->
								<td><input type='checkbox' name='check' value="${boardList.boardNo }"  onclick='checkSelectAll(this)'/></td>
								<td class="table-td"><span>${boardList.boardNo }</span></td>
								<td class="table-td"><span>${boardList.categoryType }</span></td>
								<td class="table-td"><a
									href="/board/view?boardNo=${boardList.boardNo }"><span>${boardList.boardTitle }</span></a></td>
								<td class="table-td"><span>${boardList.userId}</span></td>
								<td class="table-td"><span>${boardList.boardHit }</span></td>
								<td class="table-td"><span><fmt:formatDate
											value="${boardList.boardDate }" pattern="yyyy-MM-dd" /></span></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div> <!-- container-list end -->
		</div> <!-- formAfter end -->

		<!---------- 버튼 ---------->
		<div class="container-button">
		  <div class="d-flex justify-content-between align-items-center">
		  <button id="btnDelete" name="btnDelete" class="btn btn-outline-danger btn-sm" style = "height: 30px; width: 100px; margin-right: 100px;">선택 삭제</button>
	
		    <div class="totalBoardCount">total : ${paging.totalCount }</div>
		        <div>
		          <a href="./write"><button type="button" id="btnWrite" class="btnWrite" name="btnWrite">게시글 작성하기</button></a>
		        </div>
		  </div>
		</div> <!-- container-button end -->
		
	</form>
</div> <!-- container end -->





<c:import url="/WEB-INF/views/layout/adminboardpaging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />