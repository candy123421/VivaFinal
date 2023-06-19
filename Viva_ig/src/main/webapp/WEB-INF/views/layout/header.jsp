<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | viva</title>

<link rel=”icon” href=”/favicon.ico”>

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
	
<!-- 		목록6: 관리자 -->
	<c:if test="${adminlogin and not empty adminlogin }">
	<li>
      <div class="menu"><i class="fa fa-mobile"></i><a class="subCategory" href="/source/sound">Admin</a><i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
		<li><a href="/admin/boardlist">Board</a></li>
		<li><a href="/qna/list">Q&A</a></li>
		<li><a href="/admin/credit">Credit</a></li>
		<li><a href="/admin/userlist">UserList</a></li>
	  </ul>
	</li>
	
	</c:if>
	
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
	  <a href="/users/login"> <button class="login">Login</button> </a>
	  
	  </c:when>
	  

	  
	  	<c:when test="${not empty adminlogin and adminlogin }">
		<a class="header_icon" id="header_icon_profile">
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
				  		<a class="header_icon" id="header_icon_mySouncds" href="/users/mysource">
		  			<span class="iconName">My Sounds</span>
		  		</a>
			<!--  여기까지 지선 작성 부분 -->
	  	<a href="/users/mypage" style="text-decoration: none;">
	  	<img src="../../../profile/${userProfile}" style="width: 40px; border-radius:50px;">
		<span style="font-size: 1.5em;" class="header_icon"> ${nick }</span></a>님
	  	<a href="/users/logout"><button class="login">Logout</button></a>

	  	
	  	</c:when>
	  
	  
	  </c:choose>
	  </div>
				
				
				</div><!--  container-fluid justify-content-end -->
			</nav><!--  navbar end-->
		
		</div><!--  fixed-top end-->
	</div><!--  header end-->
	
	<div class ="layout_content" id="layout_content"><!--  footer.jsp 에서 닫아줌 -->

