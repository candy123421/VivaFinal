<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:import url="../layout/header.jsp"/>
<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>
<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	//이게 있어야지 스마트에디터 콘텐트부분에 내용이 들어간다
		$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
</script>



<style type="text/css">

	.all{
sss	text-align: center;
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
	grid-template-columns: 150px 250px 150px ;
	width: 1200px;
	}
	.ad{
	display: grid;
	grid-template-columns: 150px 150px 1fr;
	}
	#title{
	width:1200px;
	margin-right: 0px;
	}
	#content{
	height: 360px;
	resize: none;
	}
	#titleWrap{
	width: 1400px;
	margin: 0 auto;
		font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}

	.question{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.question:focus{
	outline: none;
	}

	.question:hover{
	background: linear-gradient(270deg, rgba(255, 194, 137, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	width:70px;
	height:40px;
	color: white;
	}
		
	.cancel{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.cancel:focus{
	outline: none;
	}

	.cancel:hover{

	background: linear-gradient(270deg, rgba(245, 174, 108, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	color: white;
	}

</style>s



<title>QnA Question</title>

</head>
<body>
<div id="titleWrap">
<div class="FunctionTitle">
   Viva QnA Question 
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>
<form action="/qna/question" method="post">
<div class="q">
	<div class="t">
		<div class="item">유저 번호:${users.userNo }</div>
		<div class="item">유저 아이디:${users.userId }</div>
		<div class="item">유저 닉네임:${users.userNick }</div>
	</div>
<div>
<hr> 
	<div style="text-align: center;">문의 제목</div> <hr>
		<input type="text" id="title" name="qTitle" class="form-control" placeholder="문의 제목을 입력해주세요!">
	</div>
<br>
<hr> 
	<div style="text-align: center">문의 내용</div>  <hr>
<textarea id="content" name="qContent" rows="10" placeholder="문의 내용을 입력해주세요!" style="width: 1190px;"></textarea>

	<div class="text-center"  style="margin-top: 15px;">
		<button id="btnWrite" class="question">작성</button>
		<input type="reset" id="cancel" class="cancel" value="취소">
	</div>
</div>
</form>





</body>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>
</html>