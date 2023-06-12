<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script type="text/javascript">

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

<!--------------- 검색 옵션 --------------->
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
<!--------------- 검색 옵션 끝 --------------->



<form action="./list" method="post" name="category">

	<table>
	<thead>
	<tr class = "head">
		<c:if test="${not empty adminlogin and adminlogin }">
			<th><input type='checkbox'
		       name='checkall' 
		       value='selectall'
		       onclick='selectAll(this)'/> Check All</th>
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
	
	<c:choose>
		<c:when test="${empty login}">
			<a href="/viva/login"><button type="button">게시글 작성하기</button></a>
		</c:when>
		<c:when test="${not empty login and login}">
			<a href="./write"><button type="button" id="btnWrite" name="btnWrite">게시글 작성하기</button></a>
		</c:when>
	</c:choose>
	
	<c:if test="${not empty adminlogin and adminlogin }">
		<button id="btnDelete" name="btnDelete" class="btn btn-danger">선택 삭제</button>
	</c:if>
	
	<span class="float-end mb-3">total : ${paging.totalCount }</span>
</form>



<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />
