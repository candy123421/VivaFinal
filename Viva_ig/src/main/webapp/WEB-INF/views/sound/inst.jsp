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
		
	
// })

</script>
<style type="text/css">
#Wrap{
}
#WrapTop{
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
.text{
	text-align: center;
	font-size: 1.2em;
	
}
.a{
	text-decoration: none;
	color: black;
}
#grid{
	display: grid;
	grid-template-columns: 400px 400px 400px;
	grid-column-gap: 50px;
	grid-row-gap: 30px;
	margin-top: 20px;
	width: 1300px;
	margin: 0 auto;
}
.compo{
	display: grid;
	grid-template-rows: 50px 300px
}
.compotext{
	display: grid;
	grid-template-columns: 120px 120px 120px;
	grid-column-gap: 20px;
	background: lightgray; 
	place-items: center;
}
.ctitle{
	font-size: 2.0em;
	font-weight: bold;
}
</style>

<div id="Wrap">
	<div id="WrapTop">
		<div style="width: 1300px;">
			<div style="width:1300px; border-bottom:1px solid #ccc;">
				<span id="title">Sound</span>
			</div>
			<div id="category">
				<a class="a" href="/sound/genre"><div><span class="cate">Genre</span></div></a>
				<c:if test="${not empty inst}">
					<a class="a" href="/sound/inst"><div><span class="cate" style="border-bottom: 3px solid #ccc">Instrument</span></div></a>
				</c:if>
				<a class="a" href="/file/fileupsource"><div><span class="cate" >Upload</span></div></a>
			</div>
		</div>	
	</div>
	
	<div id="WrapMiddle">
		<div class="wrap">
			<div id="grid">
				<div class="compo">
					<div class="ctitle">Guitar</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Electric"><div class="text">Electric</div></a>
						<a class="a" href="/source/inst?detail=Acoustic"><div class="text">Acoustic</div></a>
						<a class="a" href="/source/inst?detail=Clean"><div class="text">Clean</div></a>
						<a class="a" href="/source/inst?detail=Dist"><div class="text">Dist</div></a>
						<a class="a" href="/source/inst?detail=Lead"><div class="text">Lead</div></a>
						<a class="a" href="/source/inst?detail=Rhythm"><div class="text">Rhythm</div></a>
						<a class="a" href="/source/inst?detail=Solo"><div class="text">Solo</div></a>
						<a class="a" href="/source/inst?detail=Riff"><div class="text">Riff</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">Drum</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Kick"><div class="text">Kick</div></a>
						<a class="a" href="/source/inst?detail=Snare"><div class="text">Snare</div></a>
						<a class="a" href="/source/inst?detail=Rimshot"><div class="text">Rimshot</div></a>
						<a class="a" href="/source/inst?detail=Hihat"><div class="text">Hihat</div></a>
						<a class="a" href="/source/inst?detail=Clap"><div class="text">Clap</div></a>
						<a class="a" href="/source/inst?detail=Tom"><div class="text">Tom</div></a>
						<a class="a" href="/source/inst?detail=Cymbal"><div class="text">Cymbal</div></a>
						<a class="a" href="/source/inst?detail=Fills"><div class="text">Fills</div></a>
						<a class="a" href="/source/inst?detail=Percussion"><div class="text">Percussion</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">Vocal</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Female"><div class="text">Female</div></a>
						<a class="a" href="/source/inst?detail=Male"><div class="text">Male</div></a>
						<a class="a" href="/source/inst?detail=Phrases"><div class="text">Phrases</div></a>
						<a class="a" href="/source/inst?detail=Whispers"><div class="text">Whispers</div></a>
						<a class="a" href="/source/inst?detail=Screams"><div class="text">Screams</div></a>
						<a class="a" href="/source/inst?detail=Dialogue"><div class="text">Dialogue</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">Synth</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Lead"><div class="text">Lead</div></a>
						<a class="a" href="/source/inst?detail=Pad"><div class="text">Pad</div></a>
						<a class="a" href="/source/inst?detail=Arp"><div class="text">Arp</div></a>
						<a class="a" href="/source/inst?detail=Pluck"><div class="text">Pluck</div></a>
						<a class="a" href="/source/inst?detail=Chord"><div class="text">Chord</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">Bass</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Synth"><div class="text">Synth</div></a>
						<a class="a" href="/source/inst?detail=Analog"><div class="text">Analog</div></a>
						<a class="a" href="/source/inst?detail=Electric"><div class="text">Electric</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">Brass</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Saxophone"><div class="text">Saxophone</div></a>
						<a class="a" href="/source/inst?detail=Trumpet"><div class="text">Trumpet</div></a>
						<a class="a" href="/source/inst?detail=Trombone"><div class="text">Trombone</div></a>
						<a class="a" href="/source/inst?detail=Ensemble"><div class="text">Ensemble</div></a>
					</div>
				</div>
				<div class="compo">
					<div class="ctitle">WoodWinds</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Flute"><div class="text">Flute</div></a>
						<a class="a" href="/source/inst?detail=Clarinet"><div class="text">Clarinet</div></a>
						<a class="a" href="/source/inst?detail=Harmonica"><div class="text">Harmonica</div></a>
					</div>
				</div>
					<div class="compo">
					<div class="ctitle">String</div>			
					<div class="compotext">
						<a class="a" href="/source/inst?detail=Violin"><div class="text">Violin</div></a>
						<a class="a" href="/source/inst?detail=Cello"><div class="text">Cello</div></a>
						<a class="a" href="/source/inst?detail=Viola"><div class="text">Viola</div></a>
						<a class="a" href="/source/inst?detail=Contrabass"><div class="text">Contrabass</div></a>
						<a class="a" href="/source/inst?detail=Orchestral"><div class="text">Orchestral</div></a>
						<a class="a" href="/source/inst?detail=StringPad"><div class="text">StringPad</div></a>
						<a class="a" href="/source/inst?detail=Staccato"><div class="text">Staccato</div></a>
						<a class="a" href="/source/inst?detail=Pizzicato"><div class="text">Pizzicato</div></a>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>
<c:import url="../layout/footer.jsp"/>