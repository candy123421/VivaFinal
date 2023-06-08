<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">

	$(document).on('click', '#btnSearch', function(e){
	
		e.preventDefault();
	
		var url = "${pageContext.request.contextPath}/board/list";
		url = url + "?searchOption=" + $('#searchOption').val();
		url = url + "&keyword=" + $('#keyword').val();
	
		location.href = url;
		console.log(url);
	});	

// function optionChange(){ 
	
// 	var selectedOption = document.getElementById("category").value;
	
// 		// 선택된 옵션 값에 따라서 AJAX 요청 처리
// 		if (selectedOption === "free") {
			
// 		// 자유 카테고리에 대한 AJAX 요청
// 	    $.ajax({
	    	
// 	      url: "free_category",
// 	      method: "GET",
// 	      success: function(response) {
// 	        // AJAX 요청 성공 시 처리
// 	      },
// 	      error: function(xhr, status, error) {
// 	        // AJAX 요청 실패 시 처리
// 	      }
// 	    });
		
// 	  } else if (selectedOption === "notice") {
		  
// 	    // 공지 카테고리에 대한 AJAX 요청
// 	    $.ajax({
// 	      url: "notice_category",
// 	      method: "GET",
// 	      success: function(response) {
// 	        // AJAX 요청 성공 시 처리
// 	      },
// 	      error: function(xhr, status, error) {
// 	        // AJAX 요청 실패 시 처리
// 	      }
// 	    });
// 	  }
// 	}
	
// 	if (free == "자유") {
		
// 		} else if (option1 == "selectB") {
// 			options = new Array("B) 첫번째 옵션", "B) 두번째 옵션", "B) 세번째 옵션");
// 			values = new Array("1", "2", "3");
// 	    	}
	
//	var optionChange = document.getElementById("category")	
//
//	if(optionChange.options[optionChange.selectedIndex].value == "자유"){
//		location.href = "/board/list?bType=자유";
//	}
//	if(optionChange.options[optionChange.selectedIndex].value == "공지"){
//		location.href = "/board/list?bType=공지";
//	}




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

<!--------------- 검색 옵션 --------------->
<form action="./list" method="post" name="searchForm">
	<div class="search_wrap">
		<div class="search_area" style="padding-right:10px">
			<select class="searchType" name="searchType" id="searchType">
				<option value="title" <c:if test="${map.search_option == 'boardTitle'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${map.search_option == 'boardContent'}">selected</c:if>>내용</option>
				<option value="userId" <c:if test="${map.search_option == 'userId'}">selected</c:if>>작성자</option>
				<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>제목+내용+작성자</option>
			</select>
		</div>
		<div class="search" style="padding-right:10px">
			<input type="text" class="keyword" name="keyword" id="keyword" value="${map.keyword}"  placeholder="키워드를 입력하세요">
			<button class="btnSearch" name="btnSearch" id="btnSearch">검색</button>
		</div>
	</div>
</form>



<!--------------- 카테고리 옵션 --------------->
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
		<select id="search_option" name="search_option" onchange="optionChange()">
			 <c:choose>
			 	<c:when test="${head eq '전체' }"> 
					<option value="all">전체</option>
					<option value="free">자유</option>
					<option value="notice">공지</option>
				</c:when>
				<c:when test="${head eq '자유' }">
					<option value="all">전체</option>
					<option value="free">자유</option>
					<option value="notice">공지</option>
				</c:when>
				<c:when test="${head eq '공지' }">
					<option value="all">전체</option>
					<option value="free">자유</option>
					<option value="notice">공지</option>
				</c:when>
			</c:choose>
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


