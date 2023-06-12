<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>
<script type="text/javascript">
// $(function() {
	
// 	$(".cate").hover(function() {
// 		$(this).css({
// 			'borderBottom':'3px solid #ccc'
// 		})
// 	})
	
// 	$(".cate").mouseleave(function() {
// 		$(this).css({
// 			'borderBottom':'none'
// 		})
// 	})
	
	
})

</script>
<style type="text/css">
#Wrap{
}
#WrapTop{
	width: 1400px;
	margin: 0 auto;
}
#WrapMiddle{
	width: 1400px;
	margin: 0 auto;
}
#category{
	display: grid;
	grid-template-columns: 100px 150px 150px;
	margin-top: 10px;
	margin-bottom: 10px;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	text-decoration: none;
}
.a{
	text-decoration: none;
	color: black;
}
#title{
	font-size: 40px;
}
#grid{
	display: grid;
	grid-template-columns: 600px 600px;
	grid-column-gap: 100px;
	grid-row-gap: 50px;
	margin-top:20px;
}
.contentWrap{
	display: grid;
	grid-template-columns: 200px 400px;
}
.gimg{
	width:100%
}
.imgcontent{
	width:200px;
	height: 200px;
}
.content{
	background: lightgray;
	
}
.ctitle{
	font-size: 2.0em;
	font-weight: bold;
	padding-left: 20px;
	padding-top: 10px;
}
.hipgrid{
	display: grid;
	grid-template-columns: 200px 200px;
	grid-row-gap: 20px;
	margin-top: 20px;
}
#lgrid{
	display: grid;
	grid-template-columns: 125px 125px 125px;
	grid-row-gap: 20px;
	margin-top: 20px;
}
.text{
	text-align: center;
	font-size: 1.2em;
	
}
.a{
	text-decoration: none;
	color: black;
}
#GridWrap{
	width: 1400px;
	margin: 0 auto;
}
</style>

<div id="Wrap">
	<div id="WrapTop">
		<div style="width: 1300px;">
			<div style="width:1300px; border-bottom:1px solid #ccc;">
				<span id="title">Sound</span>
			</div>
			<div id="category">
				<c:if test="${not empty genre}">
					<a class="a" href="/sound/genre"><div><span class="cate" style="border-bottom: 3px solid #ccc">Genre</span></div></a>
				</c:if>
				<a class="a" href="/sound/inst"><div><span class="cate" >Instrument</span></div></a>
				<a class="a" href="/file/fileupsource"><div><span class="cate" >Upload</span></div></a>
			</div>
		</div>	
	</div>
	
	<div id="WrapMiddle">
		<div id="GridWrap">
			<div id="grid">
				<div class="contentWrap">
					<div class="imgcontent"><img class="gimg" src="../resources/img/hiphip.jpg"></div>				
					<div class="content">
						<div class="ctitle">Hip Hop</div>
						<div class="hipgrid">
							<a class="a" href="/source/genre?genre=Trap"><div class="text">Trap</div></a>
							<a class="a" href="/source/genre?genre=RnB"><div class="text">R&B</div></a>
							<a class="a" href="/source/genre?genre=Soul"><div class="text">Soul</div></a>
							<a class="a" href="/source/genre?genre=BoomBap"><div class="text">BoomBap</div></a>
						</div>
					</div>
				</div>
				<div class="contentWrap">
					<div class="imgcontent"><img class="gimg" src="../resources/img/live.jpg"></div>				
					<div class="content">
						<div class="ctitle">Live</div>
						<div id="lgrid">
							<a class="a" href="/source/genre?genre=Rock"><div class="text">Rock</div></a>
							<a class="a" href="/source/genre?genre=Jazz"><div class="text">Jazz</div></a>
							<a class="a" href="/source/genre?genre=Funk"><div class="text">Funk</div></a>
							<a class="a" href="/source/genre?genre=Reggae"><div class="text">Reggae</div></a>
							<a class="a" href="/source/genre?genre=Folk"><div class="text">Folk</div></a>
							<a class="a" href="/source/genre?genre=HeavyMetal"><div class="text">HeavyMetal</div></a>
						</div>
					</div>
				</div>
				<div class="contentWrap">
					<div class="imgcontent"><img class="gimg" src="../resources/img/pop.jpg"></div>				
					<div class="content">
						<div class="ctitle">Pop</div>
						<div class="hipgrid">
							<a class="a" href="/source/genre?genre=Pop"><div class="text">Pop</div></a>
							<a class="a" href="/source/genre?genre=Edm"><div class="text">EDM</div></a>
							<a class="a" href="/source/genre?genre=TropicalHouse"><div class="text">Tropical House</div></a>
						</div>
					</div>
				</div>
				<div class="contentWrap">
					<div class="imgcontent"><img class="gimg" src="../resources/img/house.jpg"></div>				
					<div class="content">
						<div class="ctitle">House</div>
						<div class="hipgrid">
							<a class="a" href="/source/genre?genre=House"><div class="text">House</div></a>
							<a class="a" href="/source/genre?genre=Disco"><div class="text">Disco</div></a>
							<a class="a" href="/source/genre?genre=Electro"><div class="text">Electro</div></a>
						</div>
					</div>
				</div>
				<div class="contentWrap">
					<div class="imgcontent"><img class="gimg" src="../resources/img/bassmusic.jpg"></div>				
					<div class="content">
						<div class="ctitle">Bass Music</div>
						<div class="hipgrid">
							<a class="a" href="/source/genre?genre=BasMusic"><div class="text">Bass Music</div></a>
							<a class="a" href="/source/genre?genre=DrumAndBass"><div class="text">Drum And Bass</div></a>
							<a class="a" href="/source/genre?genre=Jungle"><div class="text">Jungle</div></a>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	
	
	
	
	</div>
</div>
<c:import url="../layout/footer.jsp"/>