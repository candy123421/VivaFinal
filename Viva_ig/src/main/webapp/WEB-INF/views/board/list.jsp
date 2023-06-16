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
	margin: 1 auto;
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
   <div class="FunctionTitle">
      FREE BOARD
   </div>
   <div class="FunctionTitleLine">
      <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
   </div>
</div>

<!-------------------- 검색 시작 -------------------->
<div class="container">
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

<input type="hidden" name="keyword" id="keyword">
<input type="hidden" name="categoryType" id="categoryType">

<form action="./list" method="post" name="form-head" style="width: 1400px; margin: 0 auto;">
<div id="formAfter">
   <div class="container-list" >
      <table class="table" style="width: 1400px;">
         <thead>
            <tr class="thead">
               <c:if test="${not empty adminlogin and adminlogin }">
                  <th><input type='checkbox'
                      name='checkall' 
                      value='selectall'
                      onclick='selectAll(this)'/> Check All</th>
               </c:if>
                  <th class="table-th">게시글 번호</th>
                  <th class="table-th">카테고리
                     <select class="filterSelect" name="categoryType">
                         <option class="boardCategory" data-index="0" value="all" selected="${categoryType == null || categoryType == 'all' || categoryType == 'free' || categoryType == 'qna'}">전체</option>
                         <option class="boardCategory" data-index="1" value="free" selected="${categoryType == 'free'}">자유</option>
                         <option class="boardCategory" data-index="2" value="qna" selected="${categoryType == 'qna'}">질문</option>
                     </select>
                  </th>
               <th class="table-th">게시글 제목</th>
               <th class="table-th">작성자</th>
               <th class="table-th">조회수</th>
               <th class="table-th">게시글 작성일</th>
            </tr>
         </thead>
      
      <!--  ajax를 통해 업데이트 될 구역 -->
      <tbody class="tbody">
         <c:forEach var="boardList" items="${boardList}">
            <tr class="board-item"> <!--  첫번째 row 시작 -->
            
               <c:if test="${not empty adminlogin and adminlogin }">
                  <td><input type='checkbox'
                      name='check' 
                      value="${boardList.boardNo }"
                      onclick='checkSelectAll(this)'/>
                  </td>
               </c:if>
               
                  <td class="table-td"><span>${boardList.boardNo }</span></td>
                  <td class="table-td"><span>${boardList.categoryType }</span></td>
                  <td class="table-td"><a href="./view?boardNo=${boardList.boardNo }"><span>${boardList.boardTitle }</span></a></td>
                  <td class="table-td"><span>${boardList.userId}</span></td> 
                  <td class="table-td"><span>${boardList.boardHit }</span></td>
                  <td class="table-td"><span><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></span></td>
            </tr>
            
         </c:forEach>
      </tbody>
      
      </table>
   </div> <!--  -->

   <div class="totalBoardCount">total : ${page.totalCount }</div>
</div> <!-- container end -->
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

         
		<script>
		/*  ===== 말머리 유지하게 하기 ===== */
		$(document).ready(function() {
                
			//select 태그를 동적쿼리로 등록하는것. 
            var filterSelect = $(".filterSelect") // jQuery 
         
            //select 태그에 변화가 감지되면
            filterSelect.on("change", function(e) {

            e.preventDefault();
            console.log("변화감지..!");
            
             var status = this.options[this.selectedIndex].value;
             console.log("status : ", status);

             var index = $(this.options[this.selectedIndex]).data('index');
            console.log("index변수 선언 : ",index)   //[Object object] 로 출력됨
            
            $('.boardCategory[data-index=' + index + ']').addClass('clicked_menu');
            console.log($('.boardCategory[data-index=' + index + ']').addClass('clicked_menu'))
            
            $('.boardCategory[data-index!=' + index + ']').removeClass('clicked_menu');
            console.log($('.boardCategory[data-index!=' + index + ']').removeClass('clicked_menu'))
            
             
             $.ajax({
                url: "/board/category",
                type : "POST",
                data : {categoryType : status},
                dataType : "json",
                success : function(data) {
                   console.log("ajax 성공");
                   console.log(data)
                   
                   // 서버에서 받아온 데이터를 테이블에 적용하는 로직 작성
                   var list = data; // 서버에서 받아온 ArrayList
                   var tableBody = $("#formAfter").find("tbody"); // 테이블의 tbody 요소 선택
                   console.log(list)
                   console.log(tableBody)
                   // 기존의 tbody 내용 제거
                     tableBody.empty();
                   
                   //컨트롤러에서 받아온 데이터를 반복하면서 가상의 테이블에 가상의 행을 추가!
                   $.each(list, function(index, item) {
                      var row = $("<tr>").addClass("board-item");
                      
                      //각 열에 데이터 추가
                      var boardNo = $("<td>").html('<span>' + item.boardNo + ' </span>');
                      var categoryType=$("<td>")

                      if(item.categoryType === 'free') {
                         categoryType.html('<span>자유</span>')
                      } else if (item.categoryType === 'all') {
                         categoryType.html('<span>전체</span>')
                      } else if (item.categoryType === 'qna') {
                         categoryType.html('<span>질문</span>')
                      }
                      
//                  var boardTitle = $("<td>").html('<span>' + item.boardTitle + ' </span>');
					var boardTitle = $("<td>").html('<a href="./view?boardNo=' + item.boardNo + '"><span>' + item.boardTitle + '</span></a>');
					var userId = $("<td>").html('<span>' + item.userId + ' </span>');
					var boardHit = $("<td>").html('<span>' + item.boardHit + ' </span>');
					var boardDate = $("<td>").html('<span>' + item.boardDate + '</span>');
                      
					//새롭게 동적으로 만든 행을 동적으로 만든 테이블에 추가
					row.append(boardNo, categoryType, boardTitle, userId, boardHit, boardDate );
					tableBody.append(row);
                   })
                },
                error : function() {
                   console.log("AJAX 실패")
                }
                
             })/*  ajax END */
             })/*  change 이벤트  END */
             
         });/*  document.ready END */
         </script>
</div>         
</form>   





<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />