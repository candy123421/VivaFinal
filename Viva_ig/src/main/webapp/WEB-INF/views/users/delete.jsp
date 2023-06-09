<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/header.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(function(){
	  //체크박스가 체크되어있지 않으면 버튼 클릭 불가 -> '체크해주세요' 알림 띄우기
	  $('#btn').click(function(event) {
		    if (!$('#out').is(':checked')) {
		      event.preventDefault();
		 	    alert("탈퇴 동의 체크가 필요합니다");
		    }
	  });
})
</script>

<style type="text/css">
#grid{
	display: grid;
	grid-template-rows: 80px
}
#colgrid{
	display: grid;
	grid-template-columns: 300px 200px 200px 200px 200px 200px 
}
 
.items{
	padding: 1rem 0;
	padding-bottom: 0px;
	border-bottom: 1px solid #ccc;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    min-height: 5rem;
    font-size:20px;
}

a {
  text-decoration-line: none;
  color:black;
}
#wrap{
	padding-left: 16px;
}

#select{
	width: 1400px;
	margin: 0 auto;
	margin-top: 100px;
}

#btn{
	background-color:#3CAEFF;
	color : white;
	border-radius: 7px;
	border:none;
	width: 280px;
	height: 50px;
}
.write{
	width: 700px;
	margin-bottom: 10px;
	list-style-type: disc;
}
#ulWrap{
	width: 1400px;
	margin-top: 60px;
}
#chkWrap{
	z-index: 20;
	width: 1400px;
	margin: 0 auto;
	text-align: center;
	margin-top: 60px;
}
#out{

}
#myul{
	padding-left: 100px;
	width: 700px;
	margin: 0 auto;
}
#wrap{
	width: 1400px;
	margin: 0 auto;
}
</style>

<form action="./delete" method="post">
	<div id="wrap">
		<div id="grid">
			<div id="colgrid">
				<div class="items"><h1>마이페이지</h1></div>
				<div class="items"><a href="./mypage">회원정보</a></div>
				<div class="items"><a href="">내가 쓴글</a></div>
				<div class="items"><a href="">내 음원</a></div>
				<div class="items"><a href="">결제내역</a></div>
				<div class="items"><a href="./question">문의하기</a></div>
			</div>	
		</div>
	</div>
	
		<div id="select">
			<div style="font-size:35px; text-align:center;">탈퇴 시 유의사항</div>
			
			<div id="ulWrap">
				<ul id="myul">
					<li class="write">회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다</li>
					<li class="write">회원탈퇴 시 이용자의 개인정보를 보관하지않습니다</li>
					<li class="write" style="color:red; margin-top:30px;">게시글, 댓글 등 모든 기록은 삭제되며 복구하실 수 없습니다. 확인 후 탈퇴를 진행하세요</li>
				</ul>
			</div>
			
			<div id="chkWrap">
				<div style="margin-bottom: 30px;">
					<input type="checkbox" id="out" name="out">탈퇴하겠습니다
				</div>
				<button id="btn">탈퇴하기</button>
			</div>

		</div>
</form>


<c:import url="../layout/footer.jsp" />