<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="./layout/header.jsp"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script type="text/javascript">
$(function() {
	
	$(".content").slick({
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 3000,
		dots: true,
	})
	
	
	$(".rank").hover(function() {
		
		var idx = $(".rank").index(this)
		
		$(".rank").eq(idx).css("backgroundColor","#F8F8FF")
	})
	
	$(".rank").mouseleave(function() {
		
		var idx = $(".rank").index(this)
		
		$(".rank").eq(idx).css("backgroundColor","white")
	})
	
})
</script>
<style type="text/css">
#top{
}
.middle{
	margin: 0 auto;
	display: flex;
	justify-content: center;
	height: 300px;
}
.middle2{
	margin: 0 auto;
	display: flex;
	justify-content: center;
	height: 260px;
}
.content{
	width: 1000px;
	height: 300px;
	margin: 0 auto;
}
.img{
	width: 100%;
}
#slideWrap{
	height: 360px;
}
#rankWrap{
	display: flex;
	flex-flow: row;
	flex-direction: column;
	flex-wrap: wrap;
	height: 255px;
	width: 1000px;
	margin: 0 auto;
}
.rank{
 	display: grid;
 	grid-template-columns: 50px 50px 350px;
	line-height: 1.4;
}
.rank > div {
	height: 50px;
	margin: 0 auto;
}
.rankimg{
	width: 50px;
	border-bottom: 1px solid #ccc;
}
.ranknum{
	width: 50px;
	font-size: 30px;
	text-align: center;
	padding-top: 5px;
	border-bottom: 1px solid #ccc;
}
.rankinfo{
	width: 350px;
	border-bottom: 1px solid #ccc;
	height: 40px;
}
.packname{
	font-size: 14px;
	font-weight: bold;
	margin-top: 10px;
}
.packgenre{
	font-size: 12px;
}
.title{
	font-size: 2em;
	display: flex;
	justify-content: center;
}
.ttext{
	width: 1000px;
	font-weight: bold;
}
.btimg{
	width: 100%
}
.imgwrap{
	width: 200px;
	height: 200px;
}
.namewrap{
	text-align: center;
	font-size: 20px;
}
#mid1{
	height: 255px;
}
#mid2{
	display: grid;
	grid-template-columns: 200px 200px 200px;
	grid-column-gap: 200px;
	width: 1000px;
}
.margin{
	margin: 0 auto;
}
a{
	text-decoration: none;
	color: black;
}
</style>
<div class="Wrap">
	<div id="top">
		<div id="slideWrap">
			<div class="content">
				<img class="img" src="../resources/img/banner_21.png" style="height: 300px">
				<img class="img" src="../resources/img/banner_22.png" style="height: 300px">
				<img class="img" src="../resources/img/banner_23.png" style="height: 300px">
			</div>
		</div>
	</div>
	<div class="title">
		<div class="ttext">Top 3 Pack</div>
	</div>
	<div class="middle">
		<div id="mid2">
			<c:forEach var="list" items="${rank }" begin="0" end="2" varStatus="idx">
			<div class="margin">
				<a href="/source/pack?packNo=${list.PACK_NO }">
					<div class="imgwrap">
						<img class="btimg" src="../upload/${list.PACK_IMG_STOREDNAME }"></div>
					<div class="namewrap">${list.PACK_NAME }</div>
				</a>
			</div>
			</c:forEach>
		</div>
	</div> 	
		
		
	<div class="title"><div class="ttext">Rank</div></div>	
	<div class="middle2">
		<div id="mid1">
			<div id="rankWrap">
				<c:forEach var="rank" items="${rank}" varStatus="idx">
				<div class="rank">
					<div class="rankimg">
						<a href="/source/pack?packNo=${rank.PACK_NO}">
						<c:if test="${not empty rank.PACK_IMG_STOREDNAME }">
							<img src="../upload/${rank.PACK_IMG_STOREDNAME }" style="width: 100%">
						</c:if>
						<c:if test="${empty rank.PACK_IMG_STOREDNAME }">
							<img src="../resources/img/default-image.webp" style="width: 100%">
						</c:if>
						</a>
					</div>
					<div class="ranknum">
						${idx.count}
					</div>
					<a href="/source/pack?packNo=${rank.PACK_NO}">
						<div class="rankinfo">
							<div class="packname">${rank.PACK_NAME }</div>
							<div class="packgenre">${rank.GENRE }</div>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<c:import url ="./layout/footer.jsp"/>