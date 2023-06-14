<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="con">

<c:import url="../layout/header.jsp"/>
<script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<style type="text/css">
#title{
	font-size: 40px;
}
#WrapTop{
	width: 1400px;
	margin: 0 auto;
}
#WrapMiddle{
	width: 1400px;
	margin: 0 auto;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
#category{
	display: grid;
	grid-template-columns: 100px 150px 150px;
	margin-top: 10px;
}
.a{
 	text-decoration: none; 
 	color: black;
}
.midtitle{
	margin-top: 20px;
	margin-bottom: 20px;
}
.content{
	margin: 0px;
	width: 1300px;
	height: 250px;
}
.img{
	width: 150px;
	height: 150px;
}
.slickbtn{
	position: absolute;
}
.slideContent{
	position: relative;
	width: 1300px;
	margin: auto;
}
#slideContent2{
	position: relative;
	width: 1300px;
	margin: auto;
}
#next1{
	top: 64px;
	right: 40px;
	z-index: 5;
}
#prev1{
	top: 64px;
	left: -65px;
}
#next2{
	top: 64px;
	right: 40px;
	z-index: 5;
}
#prev2{
	top: 64px;
	left: -65px;
}
.packName{
	width: 150px;
	text-align: center;
	padding-top: 10px;
}
#wave{
	display: none;
}
.show{ 
 	width: 150px; 
 	height: 210px; 
 } 
.a{
	width: 150px;
	display: block;
}
</style>
<script type="text/javascript">
$(function() {
	
	$(".content").slick({
		infinite: true,
		slidesToShow: 5,
		slidesToScroll: 1,
		arrows: true,
		prevArrow: $("#prev1"),
		nextArrow: $("#next1"),
		autoplay: true,
		autoplaySpeed: 3000
	})
	

	
	// 마우스 이벤트
	$(".img").hover(function() {
		var idx = $(".img").index(this)
		console.log("11")
		$(".img").eq(idx).next().css("backgroundColor","lightgray")
	})

	$(".img").mouseleave(function() {
		$(".packName").css("backgroundColor","white")
	})
	
	$(".packName").hover(function() {
		var idx = $(".packName").index(this)
		$(".packName").eq(idx).css("backgroundColor","lightgray")
	})
	
	$(".packName").mouseleave(function() {
		$(".packName").css("backgroundColor","white")
	})
	
	$(".likeContent").slick({
		infinite: true,
		slidesToShow: 5,
		slidesToScroll: 1,
		arrows: true,
		prevArrow: $("#prev2"),
		nextArrow: $("#next2"),
		autoplay: true,
		autoplaySpeed: 3000
	})
	
})	

</script>
<div id="Wrap">
	<div id="WrapTop">
		<div style="width:1400px; border-bottom:1px solid #ccc;">
			<span id="title">Sound</span>
		</div>
		<div id="category">
			<a class="a" href="/sound/genre"><div><span class="cate">Genre</span></div></a>
			<a class="a" href="/sound/inst"><div><span class="cate">Instrument</span></div></a>
			<a class="a" href="/file/fileupsource"><div><span class="cate">Upload</span></div></a>
		</div>
	</div>
	<div id="WrapMiddle">
		<div class="midtitle">
			<span class="cate">Recent For you</span>
		</div>
		
		<div class="slideContent">
			<div id="prev1" class="slickbtn"><img src="../resources/icon/chevron-left.svg"></div>
			<div class="content">
				<c:forEach items="${list}" var="list">
						<div class="show">
						<a class="a" href="./pack?packNo=${list.PACK_NO }">
						<c:if test="${empty list.PACK_IMG_STOREDNAME }">
							<img class="img" src="../upload/default-image">
						</c:if>
						<c:if test="${not empty list.PACK_IMG_STOREDNAME }">
							<img class="img" src="../upload/${list.PACK_IMG_STOREDNAME }">
						</c:if>
							<div class="packName">${list.PACK_NAME }</div>
						</a>
							<div id="wave${list.PACK_NO }"></div>
						</div>
				</c:forEach>
			</div>
			<div id="next1" class="slickbtn"><img src="../resources/icon/chevron-right.svg"></div>
		</div>
		
		<div class="midtitle">
			<span class="cate">Recommend For you</span>
		</div>
		
		<div id="slideContent2">
			<div id="prev2" class="slickbtn"><img src="../resources/icon/chevron-left.svg"></div>
			<div class="likeContent">
				<c:forEach items="${likelist }" var="likelist">
					<div class="show">
					<a class="a" href="./pack?packNo=${likelist.PACK_NO }">
						<c:if test="${empty likelist.PACK_IMG_STOREDNAME }">
							<img class="img" src="../upload/default-image">
						</c:if>
						<c:if test="${not empty likelist.PACK_IMG_STOREDNAME }">
							<img class="img" src="../upload/${likelist.PACK_IMG_STOREDNAME }">
						</c:if>
							<div class="packName">${likelist.PACK_NAME }</div>
						</a>
							<div id="wave${likelist.PACK_NO }"></div>
					</div>
				</c:forEach>
			</div>	
			<div id="next2" class="slickbtn"><img src="../resources/icon/chevron-right.svg"></div>
		</div>
	</div>
		

</div>


<c:import url="../layout/footer.jsp"/>
</div>