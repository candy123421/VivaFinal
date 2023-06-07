<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | viva</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
// $(function () {
//     $(".nav").hide();
//     $("#content").click(function () {
//         $(".nav").fadeToggle(300);
//     });
//     // 왼쪽메뉴 드롭다운
//     $(".nav ul.small_menu").hide();
//     $(".nav li.category").click(function () {
//         $("ul", this).slideToggle(300);
//     });
// });
</script>

<style type="text/css">
* { 
	font-family:"typeFont"; 
}
@font-face { 
    font-family: "typeFont"; 
    src: url('../../../resources/font/BalooBhaina2-VariableFont_wght.ttf') format("truetype"); 
} 
.logo {
	display : block;
	width: 250px;
	padding: 25px;
	overflow: hidden;
	box-sizing: unset;
}
.FunctionTitle {
/* 	position: absolute; */
/*  각 Title의 길이에 따라 그라데이션 표현이 달라짐.. 각자에게 매기는 방법을 찾아봐야할것 같음... */
 	width: 200px; 
	height: 50px;
/* 	left: calc(50% - 115px/2 + 833.5px); */
/* 	top: 286px; */    
	margin-left: 50px;
	
	font-family: "typeFont";
	font-style: normal;
	font-weight: 600;
	font-size: 50px;
	line-height: 15px;
	/* identical to box height, or 30% */
	display: flex;
	align-items: center;
	text-align: center;
	letter-spacing: 0.13em;
	
	background: linear-gradient(251.88deg, #BE3455 30.85%, #532AA2 78.35%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	text-fill-color: transparent;
	
}

.FunctionTitleLine {
	margin-left: 50px;
	mar
}

.wrapper {
	display: grid;
	grid-template-columns: 250px 1670px;
	grid-template-rows: 65px 1015px;
	grid-gap:0px;
}
/*  로고 그리드만 고정 크기로. */
#sidebar {
	display: grid;	
	grid-template-rows:  150px 1fr;
	grid-row: auto / span 2;
	grid-gap:0px;
/* 	background-image: url('../../../resources/img/Rectangle10.svg'); */
/* 	background-image: url('../../../resources/img/side_10.png'); */
	background-image: url('../../../resources/img/wow.svg');
	z-index: 1031;
}
#header {
	background : #FFFFFF;
	text-align: right;
	padding-top: 20px;
}
/*  메인 메뉴 - 1 Depth*/
ul.nav {
	/*  ul태그의 기본 리스트스타일(disc) 제거 */
	list-style-type: none;
	
	width: 250px;
	display: list-item;
	/*  ul 태그의 기본 여백 제거 */
	padding: 0;
	margin:0;
}
ul.nav > li {
	margin-top : 20px;
}
/*  메인 메뉴 전체의 자식 항목의 자식 (a태그) */
/*  메인 메뉴의 항목 텍스트 */
ul.nav > li >a {
	/*  글자 (a태그) 색상 */
	color: white;
	/* 글자 꾸밈선(underline) 제거 (a 태그 밑줄))*/
	text-decoration: none;
	font-size: 30px;
	font-weight: bold;	/*  글자 두께: 굵게 */
	/*  내부 여백 (링크 클릭이 가능한 영역)*/
	padding: 10px 15px;
	/*  외부 여백 (링크 클릭이 불가능한 영역) */
	margin: 0px 5px;
}
/* ====================================================  */
/*  메인 메뉴의 항목 텍스트에 마우스가 올라갔을 때 */
ul.nav > li > a:hover {
	color: white;
}

/* 서브메뉴 */
ul.nav > li > ul {
	
/*  ul 태그의 기본 리스트스타일(circle) 제거 */
	list-style-type: none;

/*  ul태그의 기본 여백 제거 */
	padding:0;
	margin: 0;


/*  서브 메뉴 영역의 너비 */
/*  자식요소가 커지면 부모 요소도 커질수 밖에 없어! */
	width: 200px;
	
	position: absolute;
	
/* 	display: none; */
	
	/*  서브메뉴의 위치 설정 */
	left : 10px;
	
}
/* Sounds 메뉴 클릭시 2 열로 small menu 보이게 하기 */
/* .category : nth-child(2) { */
/* 	display:flex; */
/* 	align-content:flex-start;  */
/* 	flex-direction:column;  */
/* 	flex-wrap:wrap;  */
/* 	overflow:auto; */
/* } */

/*  서브 메뉴의 항목 */
ul.nav > li > ul > li {
	
	width: 100px;
	float: left;
	
	/*  내부 여백 - 항목의 크기 변경 */
/* 	padding: 10px;  */
	padding-left: 30px;
	
	
	/*  평소에 안보이도록 설정하기 - 방법 1 */
/* 	display: none; */

	/*  평소에 안보이도록 설정하기 - 방법 2 */
	height: 0;
	font-size: 0;
	/*  글자도 없애주고, 글자가 차지하는 공간도 없애줘야해!*/
	line-height: 0;
	
}


/*  메인 메뉴 항목에 마우스를 올렸을 때 */
ul.nav > li:hover > ul > li {
/* ul.nav > li > ul > li { */
	
	/*  서브 메뉴 항목이 다시 보이도록 설정하기 - 방법 1 */
/* 	display: list-item; */

	/*  서브 메뉴 항목이 다시 보이도록 설정하기 - 방법 2 */
	height: 40px;
	font-size:20px;
	line-height:2em;
}

/*  서브 메뉴의 항목 텍스트 */
ul.nav > li > ul > li > a {
	
	/*  부모 <li> 태그의 크기만큼 영역을 차지하도록 설정하기 */
	display: block;
	
	/*  글자 색상 */
	color: white;
	
	/* 글자 꾸밈선(underline) 제거 */
	text-decoration: none;
}

/*  서브 메뉴의 항목 텍스트에 마우스가 올라갔을 때 */
ul.nav > li > ul > li > a:hover {
	
	/*  글자색 변환 */
	color: white;
	font-weight: bold;
	
	
}
.item {
	display : inline-block;
	/* float : right; */
/*     cursor: pointer; */
}
.icon img{
    width: 36px;
    height: 36px;
}


.icon {
	/* position: absolute; */
	
	font-family: 'Bahnschrift';
	font-style: normal;
	font-weight: 700;
	font-size: 25px;
	line-height: 15px;
	/* identical to box height, or 60% */
	/* display: flex; */
	align-items: center;
	text-align: center;
	letter-spacing: -0.04em;
	
	background: linear-gradient(251.88deg, #BE3455 30.85%, #532AA2 78.35%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
	text-fill-color: transparent;
}
.iconName{
 	margin-left: 30px;
}
</style>
</head>
<body>

<div class="wrapper"> <!--  footer.jsp 에서 닫아줌 -->
	  <div id="sidebar">
	  	<div>
	  		<img class="logo" src="../../../resources/icon/Group 4.svg">
	  	</div>
	  	<ul class="nav">

			<!--  목록1 : 메인 홈 -->
			<li class="category">
				<a href="">Home</a>
			</li>
			
	  		<!--  목록2 : 음원소스 -->
			<li class="category">
				<a href="/source/sound">Sounds</a>	
				<ul>
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
			<li class="category">
				<a href="/board/list">Community</a>
				<ul class="small_menu">
					<li class="comm"><a href="/board/list">Free Board</a></li>
					<li class="comm"><a href="">Hot</a></li>
				</ul>
			</li>
	  
		</ul>
	  </div>
	
	  <div class = "item" id="header">
<!-- 	  	<a class="icon" href=""><img src="../../../resources/icon/shopping-cart.png" alt="cart"></a> -->
	  	<a class="icon" id="sound" href="/cart/test"><span class="iconName">Cart</span></a>
	  	<a class="icon" id="sound" href=""><span class="iconName">My Sounds</span></a>
	  	<a class="icon" id="sound" href="/credit/test"><span class="iconName">Credits</span></a>
	  	<a class="icon" id="sound" href=""><span class="iconName">user</span></a>
	  </div>
	  
	  <div class = "item" id="content"><!--  footer.jsp 에서 닫아줌 -->
	