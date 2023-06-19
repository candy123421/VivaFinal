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

.q{
	border: 2px #ffd4de  solid;
	width: 1100px;
	height: 300px;
	margin: 0 auto;
	 border-radius: 10px;
	 background: #fef6fc;
/*  	 F9CFCF  */
/* 	 ffffe8 */
	 
}

	.a{
	border: 2px #ffd4de  solid;
	width: 1100px;
	height: 300px;
	margin: 0 auto;
	 border-radius: 10px;
	 background: #fef6fc;
/*  	 F9CFCF  */
/* 	 ffffe8 */

	}
	.userquestion{
	display: grid;
	grid-template-columns: 100px 300px 150px 400px 100px;
	width: 1050px;
	border: 2px #ffd4de solid;
	border-radius: 10px;
	text-align: center;
	margin: auto;
	}
	.adminanswer{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr ;
	width: 1200px;
	}
	}
	#aAnswer{
	display: inline-block;
 	resize: none; 
	width: 1000px;
	}
	.m{
	width: 1050px; 
	margin: 0 auto;
	display: grid;
	place-content: center;
	padding-top: 15px;
	}
	.admin{
	display: grid;
	grid-template-columns: 150px 300px ;
	width: 1050px;
	border: 2px #ffd4de solid;
	border-radius: 10px;
	text-align: center;
	margin: 0 auto;
	margin-bottom: 20px;
	
	}
	#titleWrap{
	width: 1400px;
	margin: 0 auto;
	font-weight: bold;
	margin-bottom: 30px;
}

	.an{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:80px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	margin-top: 30px;
	}
	.an:focus{
	outline: none;
	}

	.an:hover{
	background: linear-gradient(270deg, rgba(255, 194, 137, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	width:80px;
	height:40px;
	color: white;
	}




</style>


<title>QnA List</title>

</head>
<body>
<div id="titleWrap">
<div class="FunctionTitle">
   Viva QnA Answer
</div>
<div class="FunctionTitleLine1">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1400px;">
</div>
</div>
<div class="userquestion">
	<div class="item">문의번호:${userQuestion.qNo}</div>
	<div class="item">문의 제목:${userQuestion.qTitle }</div >
	<div class="item">처리여부:${userQuestion.qProcess }</div>
	<div class="item">문의 작성일:<fmt:formatDate value="${userQuestion.qDate }" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
</div>
	<div class="item">유저 번호:${userQuestion.userNo }</div>
</div>
<br>
		

<div class="q">

문의내용<hr>

${userQuestion.qContent }

</div>

<br><br>

<form action="/qna/answer" method="post">
<div class="admin">
	<div class="item">관리자번호 : ${adminNo }</div>
	<div class="item">관리자 아이디 : ${admin.adminId }</div>
</div>

<div class="a">
답변

<textarea id="content" name="aAnswer" class="form-control" placeholder="답변을 등록해주세요!" rows="10" style="resize: none;">

</textarea>



</div>
<div class="m">
	<button id="btnWrite" class="an">답변작성</button>
</div>	
	<input type="hidden" value="${userQuestion.qNo}" name="qNo" >
	
</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



</body>
</html>