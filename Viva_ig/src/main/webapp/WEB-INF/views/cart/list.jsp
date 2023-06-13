<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | viva</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
class Accordion {
    constructor(options) {
      // 기본 옵션과 사용자 지정 옵션을 병합
      this.config = Accordion.mergeConfig(options);
      this.accordion = document.querySelector(this.config.selector);
      // 이벤트 핸들러 내부의 this는 currentTartget
      this.accordion.addEventListener('mouseover', this.toogle.bind(this));
    }
    static mergeConfig(options) {
      // 기본 옵션
      const config = {
        selector: '#accordion',
        multi: true
      };
      return { ...config, ...options };
    }
    toogle(event) {
      if (!event.target.classList.contains('menu')) return;
      // click 이벤트를 발생시킨 <div class="menu"> 요소의 부모 요소인 li 요소
      const targetLi = event.target.parentNode;

      // 멀티 오픈을 허용하지 않으면 타깃 이외의 모든 서브메뉴를 클로즈한다.
      if (!this.config.multi) {
        [].filter.call(
          this.accordion.childNodes,
          li => li.nodeType === Node.ELEMENT_NODE && li !== targetLi
        ).forEach(li => li.classList.remove('show'));
      }
      // li 요소의 class에 "show"가 있으면 제거하고 없으면 추가한다.
      targetLi.classList.toggle('show');
    }
  }
  window.onload = function () {
    const accordion = new Accordion({ multi: false });
    // const accordion = new Accordion();
  };
</script>
<style type="text/css">
* { 
 	font-family:"typeFont";  
 	padding : 0; 
 	margin : 0;
}

 /*  한글에만 적용 폰트 */ 
@font-face {  
    font-family: "typeFont";  
    src: url('/resources/font/GmarketSansTTFMedium.ttf') format("truetype");  
	unicode-range: U+AC00-U+D7A3;
}  
/*  영어, 숫자에만 적용 폰트 */
@font-face { 
    font-family: "typeFont"; 
    src: url('/resources/font/BalooBhaina2-VariableFont_wght.ttf') format("truetype"); 
	unicode-range: U+0041-005A, U+0061-007A, U+0030-0039;
} 

/*  전체 div */
.wrapper {
	display: grid;
	/*  세로구분 : 사이드바 250, 내용 1670 */
	grid-template-columns: 250px 1670px;
	/*  가로구분 : 상단헤더 65, 내용 1015 */
	grid-template-rows: 65px 1015px;
	grid-gap:0px;
}

/*  로고 그리드만 고정 크기로. */
#sidebar {
	display: grid;	
	grid-template-rows:  150px 1fr;
	grid-row: auto / span 2;
	grid-gap:0px;
	z-index: 1031;
	position : relative;
	background: linear-gradient(180.26deg, #514C9C 0.22%, #653A99 12.09%, #683287 25.27%, #802473 36.77%, #852C6F 48%, #7C2D79 62.62%, #78377F 73.64%, #814A7D 83.49%, #8E4669 93.45%, #8E5D7A 99.81%);
	position: fixed;
    height: 100%;
    overflow: auto;
}

/*  viva 로고 */
.layout_logo {
    position: absolute;
    width: 209px;
    height: 45px;
    left: 7px;
    top: 40px;
}
.sideNav {
	top:10px;
}
/*  ===================사이드 디테일 =========================== */
/*  메인 메뉴 - 1 Depth*/
ul {
	/*  ul태그의 기본 리스트스타일(disc) 제거 */
	list-style-type: none;
	width: 250px;
	display: list-item;  	
	padding: 0;
	margin:0;
}
.accordion {
      margin: auto;
      background: transparent;
      
}
.accordion .menu {
	position: relative;
 	padding: 15px 15px 15px 45px; 
	color: white;
	font-weight: bold;
	border-bottom: 1px solid transparent;
	cursor: pointer;
	transition: all 0.4s ease;
}

.subCategory {
	color: white;
	text-decoration: none;
	font-size: 30px;
	font-weight: bold;	/*  글자 두께: 굵게 */
	/*  내부 여백 (링크 클릭이 가능한 영역)*/
	padding: 10px 15px;
	/*  외부 여백 (링크 클릭이 불가능한 영역) */
	margin: 0px 5px;
/* 	display: block; /* 중요 */ */
  	text-align: center;
	
}
.subCategory span:hover {
	color: white;
font-weight: bold;
}
.accordion li:last-child .menu {
     border-bottom: 0;
}
.accordion li i {
  position: absolute;
  top: 1.2rem;
  left: 1rem;
  transition: all 0.4s ease;
}
   
.accordion li i.fa-chevron-down {
     right: 1rem;
     left: auto;
}

.accordion li.show i.fa-chevron-down {
     transform: rotate(180deg);
}

.accordion li.show .menu {
     color: white;
}

.accordion li.show i {
     color: white;
}    
/* Show submenu */
.accordion li.show .submenu {
/* height: auto;를 지정하면 transition이 동작하지 않는다 */
     max-height: 500px;
}

.submenu {
/* height: auto;를 지정하면 transition이 동작하지 않는다 */
     max-height: 0;
     overflow: hidden;
     font-size: 14px;
     transition: max-height 0.4s ease;
}

.submenu li {
     border-bottom: 1px solid transparent;
}

.accordion li:last-child .submenu {
     border-radius: 0 0 4px 4px;
}

.accordion li:last-child .submenu li:last-child {
     border-bottom: 0;
}

.submenu a {
     display: block;
     text-decoration: none;
     color: #d9d9d9;
     padding: 12px;
     padding-left: 42px;
     transition: all 0.25s ease-in-out;
}

.submenu a:hover {
/*  글자색 변환 */
color: white;
font-weight: bold;
}

#header {
	background: rgba(255, 255, 255, 0.77);
	text-align: right;
	display:block;
}
.fixed-top {
	background: rgba(255, 255, 255, 0.70);

}
.headerState{
    width: 1350px;
    height: 40px;
    -webkit-box-align: center;
    align-items: center;
    margin-inline-start: 300px;
}

#layout_content{
	top : 100px;
	display:block;
	margin-top : 110px;
	margin-left: 20px;
}
.header_icon img{
    width: 36px;
    height: 36px;
}

.header_icon {
	/* position: absolute; */
	
/* 	font-family: 'Bahnschrift'; */
	font-style: normal;
	font-weight: 700;
	font-size: 25px;
	/* identical to box height, or 60% */
	/* display: flex; */
	text-align: center;
	letter-spacing: -0.04em;
	
	background: linear-gradient(251.88deg, #BE3455 30.85%, #532AA2 78.35%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	text-fill-color: transparent;
}

/*  상단 헤더의 텍스트 간의 간격 */
.iconName{
 	margin-right: 20px;
}

/*  각 기능 페이지의 상단 타이틀 */
.FunctionTitle {
 	width: auto; 
	height: 40px;
	margin-left: 50px;
	font-weight: 600;
	font-size: 50px;
	line-height: 15px;
	/*  ie 에서는 지원안되는 속성이다. display : initial*/
	display: initial;
	align-items: center;
	text-align: center;
	letter-spacing: 0.13em;
	background: linear-gradient(251.88deg, #BE3455 30.85%, #532AA2 78.35%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	text-fill-color: transparent;
}

/*  상단 구분선 */
.FunctionTitleLine {
    margin: 0 auto;
    margin-left: 51px;
}
.admin_profile{
	width: 60px;
	height: 36px;
}
.login{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:60px;
	height: 33px;
	transition: all 0.4s;
	color: #9E66A4;
}
.login:focus{
	outline: none;
}

.login:hover{
	background: linear-gradient(208.73deg, #4C469F -24.94%, #7857A2 24.61%, rgba(190, 52, 85, 0.9) 90.77%, #9E66A4 101.89%);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:60px;
	color: white;
}

</style>

</head>
<body>

<div class="wrapper"> <!--  footer.jsp 에서 닫아줌 -->
	  <div id="sidebar">
	<div>
		  	<!--  상단 메인 로고 클릭시 메인페이지로 이동하도록 -->
	  		<a href="/"><img class="layout_logo" src="../../../resources/icon/viva_icon_final.svg"></a>
	  	</div>
<div class="sideNav">
  <ul id="accordion" class="accordion">

   	<!--  목록1 : 메인 홈 -->
    <li class="show">
      <div class="menu"><i class="fa fa-code"></i><a class="subCategory" href="/">Home</a><i class="fa fa-chevron-down"></i></div>
    </li>
    
    <!--  목록2 : 음원소스 -->
    <li>
      <div class="menu"><i class="fa fa-mobile"></i><a class="subCategory" href="/source/sound">Sounds</a><i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
		<li><a href="/source/genre?genre=Trap">Trap</a></li>
		<li><a href="/source/inst?detail=Kick">Kick</a></li>
		
		<li><a href="/source/genre?genre=BoomBap">BoomBap</a></li>
		<li><a href="/source/inst?detail=Snare">Snare</a></li>
		
		<li><a href="/source/genre?genre=Pop">Pop</a></li>
		<li><a href="/source/inst?detail=Female">Female</a></li>
		
		<li><a href="/source/genre?genre=Soul">Soul</a></li>
		<li><a href="/source/inst?detail=Male">Male</a></li>
		
		<li><a href="/source/genre?genre=Jazz">Jazz</a></li>
		<li><a href="/source/inst?detail=Lead">Lead</a></li>
		
		<li><a href="/source/genre?genre=RnB">R&B</a></li>
		<li><a href="/source/inst?detail=Pad">Pad</a></li>
		
		<li><a href="/source/genre?genre=EDM">EDM</a></li>
		<li><a href="/source/inst?detail=Acoustic">Acoustic</a></li>
		
		<li><a href="/source/genre?genre=Disco">Disco</a></li>
		<li><a href="/source/inst?detail=Flute">Flute</a></li>
      </ul>
    </li>
    
    <!--  목록3 : 게시판 -->
    <li>
      <div class="menu"><i class="fa fa-globe"></i><a class="subCategory">Community</a><i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
        <li><a href="/board/list">Free Board</a></li>
        <li><a href="/boardnotice/list">Notice Board</a></li>
      </ul>
    </li>
    
<!--     목록4: 문의 -->
	<li>
	<div class="menu"><i class="fa fa-globe"></i><a class="subCategory" href="/qna/list">Q&A</a><i class="fa fa-chevron-down"></i></div>
	</li>
	
<!-- 	목록5: 파일업로드 -->
	<li>
	<div class="menu"><i class="fa fa-globe"></i><a class="subCategory" href="/file/fileupsource">Upload</a><i class="fa fa-chevron-down"></i></div>
	</li>
	
	
  </ul>
  </div>
	  </div><!--  sidebar end-->
	
	
	<!--  헤더 : 상단 바 (장바구니, 마이소스, 마이페이지, 로그인&로그아웃)-->
	 <div class = "item" id="header">
	  	<div class="fixed-top">
        <nav class="navbar navbar-expand-lg">
	  			<div class="container-fluid justify-content-end">
	  			
	  			
	  				  <div class="loginstate">
	  
	  
	  <c:choose>
	  
	  <c:when test="${empty adminlogin and empty login }">
	  <a href="/viva/login"> <button class="login">Login</button> </a>
	  
	  </c:when>
	  

	  
	  	<c:when test="${not empty adminlogin and adminlogin }">
		<a class="header_icon" id="header_icon_profile" href="/admin/main">
		<img class="admin_profile" src="/resources/icon/profile.svg" alt="기본프로필" class="d-inline-block align-text-top"></a>
		<span style="font-size: 1.5em; color: red;"> ${adminNo }</span>번 Admin
		<span style="font-size: 1.5em; color: red;"> ${adminloginid }</span>님
		<a href="/admin/logout"><button class="login">Logout</button></a>
		
	  	
	  	</c:when>
	  	
	  	<c:when test="${not empty login and login }">
	  	
			<!--  여기부터 지선 작성 부분 -->
			<!--  로그인했을때만 credit, cart, my sounds 정보가 보이도록 -->
				<a class="header_icon" id="header_icon_credits" href="/credit/list">
	  				<span class="iconName" id="headerCreditStatus"> ${headerCredit } credits</span>
	  			</a>
	  			<a class="header_icon" id="header_icon_cart" href="/cart/list">
	 					<span class="iconName">Cart</span>
		  		</a>
				  		<a class="header_icon" id="header_icon_mySouncds" href="">
		  			<span class="iconName">My Sounds</span>
		  		</a>
			<!--  여기까지 지선 작성 부분 -->
	  	
	  	<a href="/users/mypage"><img src="<%=request.getContextPath() %>/profile/${userProfile}" style="width: 40px; border-radius:50px;"></a>
		<span style="font-size: 1.5em;" class="header_icon"> ${nick }</span>님
	  	<a href="/users/logout"><button class="btn btn-outline-secondary btn-sm">Logout</button></a>
	  	
	  	</c:when>
	  
	  
	  </c:choose>
	  </div>
				
				
				</div><!--  container-fluid justify-content-end -->
			</nav><!--  navbar end-->
		
		</div><!--  fixed-top end-->
	</div><!--  header end-->
	
	<div class ="layout_content" id="layout_content"><!--  footer.jsp 에서 닫아줌 -->


<%-- <c:import url="../layout/header.jsp"/>    --%>


<style type="text/css">
.cart_wrap {
	width: 1400px;
	margin : 0 auto;
	font-size : 18px;
}
/*  ========================================= */
.cart_select_btn {
	padding : 10px;
}
.cart_select_btn button {
	margin-left : 10px;
	border: 3px solid transparent;
	border-radius: 27px;
	background : transparent;
	padding : 5px;
}
.cart_select_btn button:hover {
	background: transparent;
 	border: 3px solid rgba(105, 100, 100, 0.3); 
	border-radius: 27px;
	padding : 5px;
}

/*  ========================================= */
.source_price {
  width: 200px;
  margin: 100px auto;
  background: #333333b0;
}
.source_price div {
  position: relative;
  display: inline-block;
}
.source_price img {
	cursor: pointer;
	display: flex;	/*  안해도 될것 같은데... 모르겠네 */
}

/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
#explain{ 
/* 	display : none; */
  	position: absolute; 
	opacity: 0;
	width: 100px;
	padding: 8px;
	left : 0;
/* 	-webkit-border-radius: 8px;  */
/* 	-moz-border-radius: 8px;  */
	border-radius: 8px; 
	background: rgba(51, 51, 51, 0.9002);
	color: #fff;
	font-size: 17px;
	margin-top: 20px;
	margin-left : -35px;
	text-align : center;
} 
.source_price:hover #explain{ 
  opacity: 1; 
  
}

#explain:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: ' ';
  border-bottom-color: #333333b0;
}
/*  ========================================= */
.table>:not(caption)>*>* {
    padding: 1.5rem 2.5rem;
}

th {
	font-size:22px;
}
</style>
<div class="FunctionTitle">
   Cart
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>


<div class="cart_wrap"><!--  전체 구성물 -->
	
	<form>
		<div class="cart_select_btn">	
			<label for="allCheck">전체선택</label>
			<button type="button" class="selectDelete_btn">선택삭제</button>
			<button type="button" class="selectBuy-btn">구매하기</button>
			
			<script>
			 $('.selectDelete_btn').click(function(){
				 console.log("선택 삭제 clicked()")
			  
				//배열선언
				var checkArr = new Array();
				 
				//체크박스의 name (attr)이 체크된 상태인 항목 각각에 대한 동작
				$("input[name='chBox']:checked").each(function(){
					
					//밖에서 선언한 배열변수에 체크박스의 cartNo 요소를 추가해주며
					//추가된 배열의 길이를 반환.
					checkArr.push($(this).attr("data-cart-no"));
					console.log(checkArr);
				});
			    
				//ajax로 데이터 전달하기
				$.ajax({
			    	url : "/cart/deleteChk",
			    	type : "POST",
			    	data : { chbox : checkArr },
			    	success: function(response) {
			    	console.log("ajax 성공");
					location.href = "/cart/list";		                    
				},
				error: function() {
					console.log("AJAX 실패")
				}
				});
			});
	
			 $('.selectBuy-btn').click(function(){
				 console.log("선택항목 구매 clicked()")
				 
				//배열선언
				var checkArr = new Array();
				 
				//체크박스의 name (attr)이 체크된 상태인 항목 각각에 대한 동작
				$("input[name='chBox']:checked").each(function(){
					
					//밖에서 선언한 배열변수에 체크박스의 cartNo 요소를 추가해주며
					//추가된 배열의 길이를 반환.
					checkArr.push($(this).attr("data-source-no"));
					console.log("배열", checkArr);
				});
			    
				//ajax로 데이터 전달하기
				$.ajax({
			    	url : "/cart/buy",
			    	type : "GET",
			    	data : { chbox : checkArr },
			    	success: function(response) {
			    	console.log("ajax 성공");
					location.href = "/cart/list";	
					
					reloadHeaderCredit(); //헤더 크레딧 잔액 변경
				},
				error: function() {
					console.log("AJAX 실패")
				}
				});
				 
			 });
			 function reloadHeaderCredit() {
				 console.log("리로드하고싶다")
				 /*  주의 ! location.href+ 이후 특정 영역을 입력해줄 때, 빈 칸 하나를 입력해주지 않으면 오류 발생한다 */
				 $('#headerCreditStatus').load(location.href +' #divReloadLayer');
				 
			 }
			</script>
			
		</div>
	
		<!--  테이블 내용 -->
		<div id="order">
			<table class="table">
			
			  <!--  테이블 헤드라인 -->
			  <thead class="table-light">
			    <tr>
			    
			      <th scope="col">
			      	<div class="form-check">
					  <input class="form-check-input" type="checkbox" data-cart-no="${i.CART_NO}" data-source-no="${i.SOURCE_NO}" id="flexCheckDefault">
					  <label class="form-check-label" for="flexCheckDefault"></label>
				  		
				  		<!--  전체선택 클릭에 대한 이벤트 -->
				  		<script>
						$("#flexCheckDefault").click(function(){
							 var chk = $("#flexCheckDefault").prop("checked");
							 if(chk) {
							  $(".form-check-input").prop("checked", true);
							 } else {
							  $(".form-check-input").prop("checked", false);
							 }
						});
						</script>
					
					</div>
			      </th>
			      <th scope="col">pack</th>
			      <th scope="col">Filename</th>
			      <th scope="col">Time</th>
			      <th scope="col">Key</th>
			      <th scope="col">Bpm</th>
			      <th scope="col">buy</th>
			      <th scope="col">delete</th>
			    </tr>
			  </thead>
			  
			  <c:forEach var="i" items="${list}">
			  
			  <tbody>
					<tr class="cart-item"><!--  첫번째 열 시작-->
						<td><!--  1. 체크박스 -->
							<div class="checkBox">
							  <input class="form-check-input chBox" type="checkbox" name="chBox" data-cart-no='${i.CART_NO}' data-source-no='${i.SOURCE_NO}'>
								<!--  항목선택 클릭에 대한 이벤트 -->
						  		<script>
								$(".chBox").click(function(){
									  $("#flexCheckDefault").prop("checked", false);
								});
								</script>
							</div>
					 	</td>
		
						<td><!--  2. pack 및 소스 앨범아트 -->
							<div class="product_img">
<%-- 								<img alt="pack" src="../upload/${i.SOURCE_IMG_STOREDNAME }" width="50"> --%>
<!-- 								<img alt="pack" src="../upload/default-image" width="50" height="50"> -->
							<c:choose>
								<c:when test="${empty i.PACK_IMG_STOREDNAME }">
									<div class="trimg" data-itemtype="line" data-img="${i.SOURCE_IMG_STOREDNAME}"><img src="../upload/${i.SOURCE_IMG_STOREDNAME}" style="width:40px; height: 40px;"></div>
									${i.SOURCE_IMG_STOREDNAME}
								</c:when>
								<c:otherwise>
									<div class="trimg" data-itemtype="line" data-img="${i.PACK_IMG_STOREDNAME}"><a href="./pack?packNo=${i.PACK_NO }"><img src="../upload/${list.PACK_IMG_STOREDNAME}" style="width:40px; height: 40px;"></a></div>
								</c:otherwise>
							</c:choose>
								
							</div>
						</td>
						
						<td><!--  3. 음원 title -->
							<span id="source_title">${i.SOURCE_NAME}</span>
						</td>
						
						<td><!--  4. Time -->
							<span class="timespace"></span>
						</td>
						
						<td><!--  5. Key -->
							<span>${i.KEY}</span>
						</td>
						
						<td><!--  6. Bpm -->
							<span>${i.BPM}</span>
						</td>
						
						<td class="source_price"><!--  7. 바로 구매 -->
								<div>
								<img data-source-no='${i.SOURCE_NO}' data-cart-no='${i.CART_NO}' class="buy-button" alt="구매" src="../resources/icon/plus-circle.svg" width="30">

								<!--  마우스 호버 시, 메시지 뜨는거-->
								<p id = "explain">${i.SOURCE_PRICE } credit</p> 
								</div>
						</td>
						
						<td class="popup"><!--  8. 항목 삭제 -->
							<img data-cart-no='${i.CART_NO}' data-source-no='${i.SOURCE_NO}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20" style= "cursor: pointer;">
	
									<!--  삭제 완료 후 떴다 사라지는 메시지 -->
									<!--  html 미완성 -->
									<!--  script 미완성 -->
						</td>
						
					</tr><!--  첫번째 열 End -->
				</tbody><!--  항목들 END-->
				</c:forEach><!--  반복되는 항목들 end-->
				
			</table><!--  orderTable End-->
	
			<script>
			/*  장바구니 항목 구매 시 ajax 구현() */
			$(document).on('click', '.buy-button', function() {
				console.log("개별항목 구매 clicked()")
	// 			var sourceNo = $(this).data('source-no');
	// 			var cartNo = $(this).data('cart-no');
	// 			console.log(cartNo);
	// 			console.log(sourceNo);
				
				//배열선언
				var checkArr = new Array();
				checkArr.push($(this).attr("data-source-no"));
				
				var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
				
				console.log(checkArr);
				console.log($cartItem);
											 
				$.ajax({
					url: "/cart/buy",
					type: "GET",
	// 				data: {
	// 					"cartNo" : cartNo,
	// 					"sourceNo" : sourceNo
	// 				},
					data : { chbox : checkArr },
	// 				dataType : 'json',
					success: function(response) {
						console.log("ajax 성공");
						console.log(sourceNo);
								                    
						$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
					},
					error: function() {
						console.log("AJAX 실패");
						console.error();
					}
				});
			});
			
			
			/*  장바구니 항목 삭제 시 ajax 구현 */
			$(document).on('click', '.delete-button', function() {
				var cartNo = $(this).data('cart-no');
				var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
				console.log(cartNo);
				console.log($cartItem);
				
											 
				$.ajax({
					url: "/cart/delete",
					type: "GET",
					data: { cartNo: cartNo },
					success: function(response) {
						console.log("ajax 성공");
						console.log(cartNo);
								                    
						$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
					},
					error: function() {
						console.log("AJAX 실패")
					}
				});
			});
			/*  하지만 전체 선택 및 부분 선택하여 삭제하는 기능은 미정 ... 수정해야함 !*/						
			</script>
	
		</div>
	</form>
</div>
<c:import url ="../layout/footer.jsp"/>