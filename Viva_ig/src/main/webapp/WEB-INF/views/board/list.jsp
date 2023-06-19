<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
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
	margin-left: 100px;
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

.btnWrite {
background: #EDE574;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #E1F5C4, #EDE574);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #E1F5C4, #EDE574); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	border: 2px solid #ffffff;
	border-radius: 10px;
	width:160px;
	height:40px;
	transition: all 0.4s;
	color: black;
}
.btnSearch {
	background: #d9a7c7;  /* fallback for old browsers */
 	background: -webkit-linear-gradient(to right, #d9a7c7, #fffcdc);  /* Chrome 10-25, Safari 5.1-6 */ */
	background: linear-gradient(to right, #d9a7c7, #fffcdc); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #ffffff;
}

.btnWrite:focus, .btnSearch:focus  {
	outline: none;
}

.btnSearch:hover {
	background: #FC466B;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #3F5EFB, #FC466B);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #3F5EFB, #FC466B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	width:70px;
	height:40px;
	color: black;
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

.titlestyle{
	width: 1400px;
	margin: 0 auto;
}
</style>

<div class="titlestyle">
	<div class="FunctionTitle" >FREE BOARD</div>
	<div class="FunctionTitleLine1">
	   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
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
			<button class="btn btn-outline-secondary" id="btnSearch">검색</button>
		</div>
		<!-- search_wrap end -->
		<!--    </form> -->
		<!-------------------- 검색 끝 -------------------->


		<div id="formAfter">
			<div class="container-list">
				<table class="table" style="width: 1400px;">
					<thead>
						<tr class="thead">
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
								<td class="table-td"><span>${boardList.boardNo }</span></td>
								<td class="table-td"><span>${boardList.categoryType }</span></td>
								<td class="table-td"><a
									href="./view?boardNo=${boardList.boardNo }"><span>${boardList.boardTitle }</span></a></td>
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
		    <div class="totalBoardCount">total : ${paging.totalCount }</div>
		    <c:choose>
		      <c:when test="${empty login}">
		        <a href="/viva/login"><button type="button" class="btnWrite">게시글 작성하기</button></a>
		      </c:when>
		      <c:when test="${not empty login and login}">
		        <div>
		          <a href="./write"><button type="button" id="btnWrite" class="btnWrite" name="btnWrite">게시글 작성하기</button></a>
		        </div>
		      </c:when>
		    </c:choose>
		  </div>
		</div> <!-- container-button end -->
		
	</form>
</div> <!-- container end -->

<!-- <!-- 		<script> -->
<!-- // 		/*  ===== 말머리 유지하게 하기 ===== */ -->
<!-- // 		$(document).ready(function() { -->

<!-- // 			//select 태그를 동적쿼리로 등록하는것.  -->
<!-- //             var filterSelect = $(".filterSelect") // jQuery  -->

<!-- //             //select 태그에 변화가 감지되면 -->
<!-- //             filterSelect.on("change", function(e) { -->

<!-- //             e.preventDefault(); -->
<!-- //             console.log("변화감지..!"); -->

<!-- //              var status = this.options[this.selectedIndex].value; -->
<!-- //              console.log("status : ", status); -->

<!-- //              var index = $(this.options[this.selectedIndex]).data('index'); -->
<!-- //             console.log("index변수 선언 : ",index)   //[Object object] 로 출력됨 -->

<!-- //             $('.boardCategory[data-index=' + index + ']').addClass('clicked_menu'); -->
<!-- //             console.log($('.boardCategory[data-index=' + index + ']').addClass('clicked_menu')) -->

<!-- //             $('.boardCategory[data-index!=' + index + ']').removeClass('clicked_menu'); -->
<!-- //             console.log($('.boardCategory[data-index!=' + index + ']').removeClass('clicked_menu')) -->


<!-- //              $.ajax({ -->
<!-- //                 url: "/board/category", -->
<!-- //                 type : "POST", -->
<!-- //                 data : {categoryType : status}, -->
<!-- //                 dataType : "json", -->
<!-- //                 success : function(data) { -->
<!-- //                    console.log("ajax 성공"); -->
<!-- //                    console.log(data) -->

<!-- //                    // 서버에서 받아온 데이터를 테이블에 적용하는 로직 작성 -->
<!-- //                    var list = data; // 서버에서 받아온 ArrayList -->
<!-- //                    var tableBody = $("#formAfter").find("tbody"); // 테이블의 tbody 요소 선택 -->
<!-- //                    console.log(list) -->
<!-- //                    console.log(tableBody) -->
<!-- //                    // 기존의 tbody 내용 제거 -->
<!-- //                      tableBody.empty(); -->

<!-- //                    //컨트롤러에서 받아온 데이터를 반복하면서 가상의 테이블에 가상의 행을 추가! -->
<!-- //                    $.each(list, function(index, item) { -->
<!-- //                       var row = $("<tr>").addClass("board-item"); -->

<!-- //                       //각 열에 데이터 추가 -->
<!-- //                       var boardNo = $("<td>").html('<span>' + item.boardNo + ' </span>'); -->
<!-- //                       var categoryType=$("<td>") -->

<!-- //                       if(item.categoryType === 'free') { -->
<!-- //                          categoryType.html('<span>자유</span>') -->
<!-- //                       } else if (item.categoryType === 'all') { -->
<!-- //                          categoryType.html('<span>전체</span>') -->
<!-- //                       } else if (item.categoryType === 'qna') { -->
<!-- //                          categoryType.html('<span>질문</span>') -->
<!-- //                       } -->

<!-- // //                  var boardTitle = $("<td>").html('<span>' + item.boardTitle + ' </span>'); -->
<!-- // 					var boardTitle = $("<td>").html('<a href="./view?boardNo=' + item.boardNo + '"><span>' + item.boardTitle + '</span></a>'); -->
<!-- // 					var userId = $("<td>").html('<span>' + item.userId + ' </span>'); -->
<!-- // 					var boardHit = $("<td>").html('<span>' + item.boardHit + ' </span>'); -->
<!-- // 					var boardDate = $("<td>").html('<span>' + item.boardDate + '</span>'); -->

<!-- // 					//새롭게 동적으로 만든 행을 동적으로 만든 테이블에 추가 -->
<!-- // 					row.append(boardNo, categoryType, boardTitle, userId, boardHit, boardDate ); -->
<!-- // 					tableBody.append(row); -->
<!-- //                    }) -->
<!-- //                 }, -->
<!-- //                 error : function() { -->
<!-- //                    console.log("AJAX 실패") -->
<!-- //                 } -->

<!-- //              })/*  ajax END */ -->
<!-- //              })/*  change 이벤트  END */ -->

<!-- //          });/*  document.ready END */ -->
<!-- <!--          </script> -->




<c:import url="/WEB-INF/views/layout/boardpaging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />