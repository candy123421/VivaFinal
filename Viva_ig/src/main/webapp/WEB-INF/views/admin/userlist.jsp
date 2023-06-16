<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp"/>

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


<style type="text/css">

.userlist{
	display: grid;
	grid-template-columns: 100px 100px 200px 200px 200px 100px 100px;
	border: 2px #ffd4de solid;
	border-radius: 10px;
	width: 1050px;
	text-align: center;
	margin: auto;
	grid-row-gap: 15px;
	background: #fef6fc;
}
.total{
	width: 1400px;
	margin: 0 auto;	
}
#pagingWrap{
	width: 1050px;
	margin: 0 auto;
	display: grid;
	padding-top: 15px;
	place-content: center;
}
#titleWrap{
	width: 1400px;
	margin: 0 auto;
	font-weight: bold;
	margin-bottom: 10px;
}
	.search{
	background: #fef6fc;
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #9E66A4;
	}
	.search:focus{
	outline: none;
	}

	.search:hover{
	background: linear-gradient(270deg, rgba(177, 100, 255, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	color: white;
	}
	
	
	.search_wrap {
	width: 300px;
	height: 50px;
	text-align: center;
	}	

	#grid{
		display: grid;
		grid-template-columns: 300px 100px;
		grid-column-gap: 30px;
		margin: 0 auto;
	}
	
	.topWrap{
		display: flex;
		justify-content: center;
		width: 1400px;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	
	.btnupdate{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:90px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.btnupdate:focus{
	outline: none;
	}

	.btnupdate:hover{
	background: linear-gradient(270deg, rgba(245, 174, 108, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	color: white;
	}
	
	.i{
	font-weight: 900;
	}

</style>

<title>usergrade</title>
</head>
<body>
<div id="titleWrap">
<div class="FunctionTitle">
   Viva User List
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>

<div>
	<c:choose>
		<c:when test="${empty adminlogin and empty login}">
		<div id="titleWrap">
		<span style="color: red; font-size: 2.5em;">이 곳은 관리자 구역입니다. 접근금지!</span><br>
		관리자는 로그인을 해주세요!
		<a href="/admin/login"> <button class="btn btn-outline-secondary btn-sm">Login</button> </a>
		</div>
		</c:when>
		
		
		<c:when test="${not empty adminlogin and adminlogin }">
				<!-------------------- 검색 시작 -------------------->
				<form action="/admin/userlist?keyword=${keyword}" method="get" name="searchForm">
				<div class="topWrap">
					<div id="grid">
						<div class="search_wrap">
							<input type="text" class="form-control" name="keyword" id="keyword" placeholder="ID, Nick, Name을 검색하세요">
						</div>
						<div>
							<button class="search" id="btnSearch">Search</button>
						</div>
					</div>
				</div>
				</form>
		<!-------------------- 검색 끝 -------------------->
		<input type="hidden" value="${keyword }" name="keyword">

		<div class="total"> 
			<form action="/admin/userlist" method="post">
			<div class="userlist">
				<div class="i"><input type='checkbox' name='checkall' value='selectall' onclick='selectAll(this)'/> Check All</div>
				<div class="i">Number</div>
				<div class="i">ID</div>
				<div class="i">Nick</div>
				<div class="i">Name</div>
				<div class="i">Grade</div>
				<div class="i">Join Date</div>
			
			<c:forEach var="userlist" items="${userlist }">
				<div><input type='checkbox' name='check' value="${userlist.userNo }" onclick='checkSelectAll(this)'/></div>
				<div>${userlist.userNo }</div>
				<div>${userlist.userId }</div>
				<div>${userlist.userNick }</div>
				<div>${userlist.userName }</div>
				<div>${userlist.userGrade }</div>
				<div><fmt:formatDate value="${userlist.userJoindate }" pattern="yyyy-MM-dd"/></div>
			</c:forEach>
			<button id="btnupdate" name="btnupdate" class="btnupdate">Upgrade</button>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
				<span class="float-end mb-3">total : ${paging.totalCount }</span>
			</div>
				<div id="pagingWrap">
					<c:import url="/WEB-INF/views/layout/userpaging.jsp" />
				</div>
				</form>
			</div>
		</c:when>
	</c:choose>
		
</div>
		
		






</body>
</html>