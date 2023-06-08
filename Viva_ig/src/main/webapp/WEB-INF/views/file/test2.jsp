<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:import url="../layout/header.jsp"/>


<style type="text/css">
	.all{
	text-align: center;
	}


	.q{
	width: 1200px;
	height: 450px;
	margin: auto;
	}


	.a{
	border: 1px grey solid;
	width: 1000px;
	height: 300px;

	}
	.t{
	display: grid;
	grid-template-columns: 100px 150px 150px 200px 1fr;
	width: 1200px;
	}
	.ad{
	display: grid;
	grid-template-columns: 150px 150px 1fr;
	}
	#title{
	width:800px;
	margin-right: 0px;
	}
	#content{
	height: 360px;
	resize: none;
	
	}
	.titlegrid{
 	display: grid; 
 	grid-template-columns:100px 1fr; 
	}



</style>
<script type="text/javascript">
$(function(){
	
	$(document).ready(function() {
		$("#cancel").click(function() {
			history.go(-1)
		})

		//form이 있는데 굳이 또 쓰는이유를 잘모르겠어용
// 		$("#btnWrite").click(function() {
// 			submitContents($("#btnWrite"))
			
// 			$("form").submit();
// 		})
	})
	


</script>


<title>QnA Question</title>

</head>
<body>
<h1>QnA Question</h1>
<hr>

<form action="/qna/question" method="post">
<div class="all">
<div class="t">
<div class="item">
유저 번호:${users.userNo }
</div>
<div class="item">
유저 아이디:${users.userId }
</div>
<div class="item">
유저 닉네임:${users.userNick }
</div>
</div>
<hr>
		

<div class="q">
<div class="titlegrid">
<div class="item">문의제목</div>
<div class="item">
<input type="text" id="title" name="qTitle" class="form-control" placeholder="문의 제목을 입력해주세요!">
</div>
</div>
<br>
<hr>
문의내용<hr>
<textarea id="content" name="qContent" class="form-control" rows="10" placeholder="문의 내용을 입력해주세요!"></textarea>

</div>
<div class="text-center"  style="margin-top: 90px;">
	<button id="btnWrite" class="btn btn-outline-secondary">작성</button>
	<input type="reset" id="cancel" class="btn btn-outline-danger" value="취소">
</div>
</div>
</form>

</body>
</html>