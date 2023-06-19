<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>
<script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>
<script type="text/javascript">
$(function() {
	$(".tagcover").hover(function() {
		$(this).css({
			'background':'#Be3455',
			'color':'white'
		})
	})
	$(".tagcover").mouseout(function() {
		$(this).css({
			'background':'white',
			'color':'black'
		})
	})
	$(".buy").hover(function() {
		$(this).css("cursor","pointer")
	})
})
</script>
<style type="text/css">
#btn{
	font-size: 2.5em;
	height: 70px;
	padding-left: 0px;
}
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
#line{
	width: 1200px;
	border-top: 1px solid #ccc;
	padding-top: 16px;
}
#drop{
	width: 1200px;
}
.width{
	width:1200px;
	padding-bottom: 17px;
	border-bottom: 1px solid #ccc;
}
#tab{
	width: 1300px;
	height: 50px;
	display: grid;
	grid-template-columns: 80px 100px;
}
.cateWrap{
	text-align: center;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
#tagWrap{
	width: 1300px;
	height: 64px;
	border-bottom: 1px solid #ccc;
	display: grid;
	grid-template-columns: 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px ;
	grid-template-rows: 28px 28px;
	
}
.tagcover{
	height: 25px;
	text-align: center;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 2px;
	margin-bottom: 5px;
	margin-right: 5px;
	overflow: hidden;
}
.tagA{
	color: black;
	text-decoration: none;
}
.already{
	font-family:"typeFont", "sans-serif;";
	font-weight: bold;
	color: red;
	line-height: normal;
	text-align: center;
	box-sizing: border-box;
	padding-top: 6px;
}
#SourceWrap{
	display: grid;
	grid-template-columns: 80px 80px 400px 80px 80px 80px 300px 200px;
}
.th{
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding-top: 3px;
	text-align: center;
}
.tr{
	height: 60px;
	text-align: center;
	padding-top: 18px;
	padding-bottom: 18px;
}
.trwave{
	height: 60px;
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
}
.trimg{
	padding-top: 10px;
	margin: 0 auto;
	width: 80px;
	padding-left:20px;
	height:60px;
}
.th2{
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding-top: 3px;
	text-align: center;
}

.filename{
	height: 60px;
	overflow: hidden;
	box-sizing: border-box;
	padding-top: 18.5px;
	padding-bottom: 18.5px;
	vertical-align: middle;
	text-align: center;
}
.time{
	height: 60px;
	overflow: hidden;
	box-sizing: border-box;
	padding-top: 18.5px;
	padding-bottom: 18.5px;
	vertical-align: middle;
	text-align: center;
}
.sourcename{
	height: 60px;
	overflow: hidden;
	box-sizing: border-box;
	padding-top: 18.5px;
	padding-bottom: 18.5px;
	vertical-align: middle;
}
.icons{
	text-align: center;
	padding-top: 18px;
	padding-bottom: 18px;
	display: grid;
	grid-template-areas: 'limg like cart link'
						'cartmsg cartmsg cartmsg cartmsg';
	grid-template-columns: 50px 50px 50px 50px; 
	height: 60px;
}
div[data-itemtype='line']{
	border-bottom: 1px solid #ccc;
}
.cartmsg{
	height: 18px;
	grid-column: span 4;
	font-size: 12px;
	font-weight: bold;
}
.cart{
	cursor: pointer;
}
.like{
	cursor: pointer;
}
#infoline{
	display : grid;
	grid-template-columns: 100px 1200px
}
</style>
<div id="Wrap">
	<div id="WrapTop">
	<div id="drop" class="dropdown">
		<button id="btn" class="btn btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> 
			<c:if test="${empty inst}">
				${det}
			</c:if>
			<c:if test="${not empty inst}">
				${inst}
			</c:if>
		</button>
		
		<ul class="dropdown-menu">
			<li><a class="dropdown-item disabled">Drum</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Drum">Drum</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Kick">Kick</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Snare">Snare</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Hihat">Hihat</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clap">Clap</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Tom">Tom</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Cymbal">Cymbal</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=808">808</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Fills">Fills</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Percussion">Percussion</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Rimshot">Rimshot</a></li>
			
			<li><a class="dropdown-item disabled">Vocal</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Vocal">Vocal</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Female">Female</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Male">Male</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Phrases">Phrases</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Whispers">Whispers</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Screams">Screams</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Dialogue">Dialogue</a></li>
			
			
			<li><a class="dropdown-item disabled">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pad">Pad</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Arp">Arp</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pluck">Pluck</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Chord">Chord</a></li>
			
			
			<li><a class="dropdown-item disabled">Brass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Brass">Brass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Saxophone">Saxophone</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Trumpet">Trumpet</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Trombone">Trombone</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Ensemble">Ensemble</a></li>
			
			
			<li><a class="dropdown-item disabled">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=WoodWinds">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Flute">Flute</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Harmonica">Harmonica</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clarinet">Clarinet</a></li>
			
			
			<li><a class="dropdown-item disabled">Guitar</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Guitar">Guitar</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Clean">Clean</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Dist">Dist</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Rhythm">Rhythm</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Solo">Solo</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Riff">Riff</a></li>
			
			<li><a class="dropdown-item disabled">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Analog">Analog</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Electric">Electric</a></li>
			
			<li><a class="dropdown-item disabled">String</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=String">String</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Violin">Violin</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Viola">Viola</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Cello">Cello</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Contrabass">Contrabass</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Orchestral">Orchestral</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=StringPad">StringPad</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Staccato">Staccato</a></li>
			<li><a class="dropdown-item" href="/source/inst?detail=Pizzicato">Pizzicato</a></li>
			
			<li><a class="dropdown-item disabled">Piano</a></li>
			<li><a class="dropdown-item" href="/source/inst?instrument=Piano">Piano</a></li>
		</ul>
	</div>
	<div id="line"></div>
	
	<div id="tab">
		<div class="cateWrap">
<%-- 			<c:if test="${empty source }"> --%>
<%-- 				<a href="/source/inst?instrument=${dinst}"><span class="cate">Source</span></a> --%>
<%-- 			</c:if> --%>
			<c:if test="${ empty inst}">
				<a style="text-decoration:none; text-decoration-color:#ccc;" href="/source/inst?detail=${det}"><span class="cate" style="border-bottom: 3px solid #ccc">Source</span></a>
			</c:if>
			<c:if test="${ not empty inst}">
				<a style="text-decoration:none; text-decoration-color:#ccc;" href="/source/inst?instrument=${dinst}"><span class="cate" style="border-bottom: 3px solid #ccc">Source</span></a>
			</c:if>
		</div>
		<div class="cateWrap">
			<c:if test="${empty inst }">
				<a style="text-decoration:none; " href="/pack/inst?detail=${det}"><span class="cate">Pack</span></a>
			</c:if>
			<c:if test="${not empty inst }">
				<a style="text-decoration:none; " href="/pack/inst?instrument=${inst}"><span class="cate">Pack</span></a>
			</c:if>
		</div>	
	</div>
	
	<div id="tagWrap">
		<c:forEach var="tag" items="${genre }" >
			<c:if test="${empty tag.genre }">
				${tag.genre }
			</c:if>
			<c:if test="${not empty tag.genre && empty inst && tag.genre ne cgenre}">
				<a class="tagA" href="/source/inst?detail=${det}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
			<c:if test="${not empty tag.genre && not empty inst && tag.genre ne cgenre}">
				<a class="tagA" href="/source/inst?instrument=${inst}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
		</c:forEach>
		
		<c:forEach var="tag" items="${scape }" >
			<c:if test="${empty tag.scape }">
				${tag.scape }
			</c:if>
			<c:if test="${not empty tag.scape && empty inst  && tag.scape ne cscape}">
				<a class="tagA" href="/source/inst?detail=${det}&scape=${tag.scape}"><div class="tagcover">${tag.scape}</div></a> 
			</c:if>
			<c:if test="${not empty tag.scape && not empty inst && tag.scape ne cscape}">
				<a class="tagA" href="/source/inst?instrument=${inst}&scape=${tag.scape}"><div class="tagcover">${tag.scape}</div></a>
			</c:if>
		</c:forEach>
			
			
		<c:forEach var="tag" items="${detail }" >
			<c:if test="${empty tag.detail }">
				${tag.detail }
			</c:if>
			<c:if test="${not empty tag.detail && empty inst && tag.detail ne cdetail}">
				<a class="tagA" href="/source/inst?detail=${det}&detail=${tag.detail}"><div class="tagcover">${tag.detail}</div></a> 
			</c:if>
			<c:if test="${not empty tag.detail && not empty inst && tag.detail ne cdetail}">
				<a class="tagA" href="/source/inst?instrument=${inst}&detail=${tag.detail}"><div class="tagcover">${tag.detail}</div></a>
			</c:if>
		</c:forEach>
			
			
		<c:forEach var="tag" items="${fx }" >
			<c:if test="${empty tag.fx }">
				${tag.fx }
			</c:if>
			<c:if test="${not empty tag.fx && empty inst && tag.fx ne cfx}">
				<a class="tagA" href="/source/inst?detail=${det}&fx=${tag.fx}"><div class="tagcover">${tag.fx}</div></a> 
			</c:if>
			<c:if test="${not empty tag.fx && not empty inst && tag.fx ne cfx}">
				<a class="tagA" href="/source/inst?instrument=${inst}&fx=${tag.fx}"><div class="tagcover">${tag.fx}</div></a> 
			</c:if>
		</c:forEach>
	</div>
	</div>
	
	<div id="WrapMiddle">
	<div id="infoline"><div class="cate">Result : ${list.size()}</div>
		<c:if test="${not empty msg}">
		<div class="already">${msg }</div>
		</c:if>
	</div>
	
	<div id="SourceWrap">
		<div class="th"><span>Pack</span></div>
		<div class="th"><span>Play</span></div>
		<div class="th2"><span>Fimename</span></div>
		<div class="th2"><span>Time</span></div>
		<div class="th2"><span>Key</span></div>
		<div class="th2"><span>Bpm</span></div>
		<div class="th"><span>wave</span></div>
		<div class="th"><span>icon</span></div>
		
		<c:forEach var="list" items="${list}">
			
			<c:choose>
				<c:when test="${empty list.PACK_IMG_STOREDNAME && list.SOURCE_IMG_STOREDNAME ne null }">
					<div class="trimg" data-itemtype="line" data-img="${list.SOURCE_IMG_STOREDNAME}"><img src="../upload/${list.SOURCE_IMG_STOREDNAME}" style="width:40px; height: 40px;"></div>
				</c:when>
				<c:when test="${not empty list.PACK_IMG_STOREDNAME }">
					<div class="trimg" data-itemtype="line" data-img="${list.PACK_IMG_STOREDNAME}"><a href="./pack?packNo=${list.PACK_NO }"><img src="../upload/${list.PACK_IMG_STOREDNAME}" style="width:40px; height: 40px;"></a></div>
				</c:when>
				<c:otherwise>
					<div class="trimg" data-itemtype="line" data-img="default-image.webp"><a href="./pack?packNo=10"><img src="../resources/img/default-image.webp" style="width:40px; height: 40px;"></a></div>
				</c:otherwise>
			</c:choose>
			
			<div class="tr" data-itemtype="line"><img src="../resources/icon/play-circle.svg" style="width: 30%"></div>
			<div class="sourcename" data-itemtype="line" data-sourcename="${list.FILE_ORIGINNAME}"><span>${list.FILE_ORIGINNAME}</span></div>
			<div class="time" data-itemtype="line"><span class="timespace">${list.SOURCE_TIME}</span></div>
			<div class="filename" data-itemtype="line"><span>${list.KEY}</span></div>
			<div class="filename" data-itemtype="line"><span>${list.BPM}</span></div>
			<div class="trwave" data-itemtype="line">
				<div id="wave${list.SOURCE_NO}" data-no="${list.SOURCE_NO}" data-name="${list.FILE_STOREDNAME}"></div>
			</div>
			
			<div class="icons" data-itemtype="line">
				<div class="buy" data-buy="${list.SOURCE_NO }" data-buy2="${list.PACK_NO }"><img src="../resources/icon/plus-circle.svg" style="width: 45%"></div>
				<div class="like" data-like="${list.SOURCE_NO}">
					<c:if test="${list.CNT <= 0 }">
						<img src="../resources/icon/heart.svg" style="width: 45%">
					</c:if>
					<c:if test="${list.CNT > 0 }">
						<img src="../resources/icon/heart-fill.svg" style="width: 45%">
					</c:if>
				</div>
				<div class="cart" data-cart="${list.SOURCE_NO }"><img src="../resources/icon/shopping-cart.png" style="width: 45%"></div>
				<div><a href="./pack?packNo=${list.PACK_NO }"><img src="../resources/icon/three-dots.svg" style="width: 45%"></a></div>
				<div class="cartmsg"></div>
			</div>
			
		</c:forEach>
		<script type="text/javascript">
		
			// 음원소스 시간 계산기
			var timeCalculator = function(value){
	        	second = Math.floor(value % 60);
	        	minute = Math.floor((value / 60) % 60);
	        	
	        	if (second <10 ){
	        		second = "0" + second;
	        	} 
	        	
	        	return minute + ":" + second;
	        };
	
	        // 음원소스 번호 리스트 배열 선언
			var conA = document.querySelectorAll("div[data-no]");
			var conB = document.querySelectorAll("div[data-name]");
		
			
			// 음원소스 시각화
			var wave = [];
		
			for( var i = 0; i<${list.size()}; i++) { 
		
				 wave[i] = WaveSurfer.create({ 
				 container: '#wave'+conA[i].getAttribute("data-no"),
				 waveColor: 'gray', 
				 progressColor: '#BB2649', 
				 barWidth: 2, 
				 reposive: true, 
				 barHeight: 1.5, 
				 pixelRatio: 30, 
				 normalize: true, 
				 barMinHeight: 50
				});
				 
			
			  wave[i].setHeight(30); 
			  wave[i].setCursorColor('white'); 
			  wave[i].load('../upload/'+conB[i].getAttribute("data-name"))
			}
		
			// 파형 누를 시 재생	
			$(".trwave").click(function() {
				
				//console.log($(".trwave").index(this))
				// 음원소스 위치 알아내기
				var waveno = $(".trwave").index(this)
				
				// 이미지 위치 알아내기
				var imgno = $(".tr").index(this)
				
				var imgSrc = $(".trimg").eq(waveno).attr('data-img')
				
				var sourcename = $(".sourcename").eq(waveno).attr('data-sourcename')
				
				// 다른 음원 재생 시 모두 종료 후 현재 클릭한 음원소스 재생
				for(var w=0; w<wave.length; w++) {
					
			       	$(".tr").eq(w).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
			       	
					if( w != waveno && wave[w].isPlaying() == true ) {
					 	wave[w].pause()
					} 
				}
				
				if(wave[waveno].isPlaying() == true) {
					wave[waveno].pause()
				    $(".tr").eq(waveno).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
				    $("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				}
				
				
				wave[waveno].play()	
				$(".tr").eq(waveno).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
				$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				
				$("#playWrap").css({
					"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
					"height":"80px"
				})
				
				// 플레이바 구현
				$("#playimg").attr("src","../upload/"+imgSrc)
				$("#playimg").css("visibility","visible")
				
				if(wave[waveno].isPlaying() == true) {
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				} else if(wave[waveno].isPlaying() == false){
					$("#barbtn").attr("src","../resources/icon/play-circle.svg")
				}
				
				$("#addheight").css("height","100px")
				
				$("#barprocess").html("0:00")
				$("#barduration").html("0:00")
				$("#barsourcename").html(sourcename)
				$("#barsourcename").attr("data-barno",waveno)
				$("#next").attr("src","../resources/icon/skip-end-circle.svg")
				$("#prev").attr("src","../resources/icon/skip-start-circle.svg")
				
// 				음원소스 재생 시간 계산 부분
				var duration1 = document.querySelector("#barduration")
				duration1.textContent = timeCalculator(wave[waveno].getDuration());
				
				var current1 = document.querySelector("#barprocess")
				wave[waveno].on("audioprocess", function(e) {
					
				current1.textContent = timeCalculator(wave[waveno].getCurrentTime());
					
				})
				
				
			})
			
			// 재생 아이콘 누를 시 재생
			$(".tr").click(function() {
				
// 				console.log($(".tr").index(this))
				var btnplay = $(".tr").index(this)
				
				var sourcename = $(".sourcename").eq(btnplay).attr('data-sourcename')
// 				console.log("음원 Name 추적", sourcename)
				
				var imgSrc = $(".trimg").eq(btnplay).attr('data-img')
// 				console.log("이미지 경로 추적",imgSrc)
	
				// 현재 음원소스 재생 외 다른 소스 전부 pause
				for(var w=0; w<wave.length; w++) {
			       	$(".tr").eq(w).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
			       	
					if( w != btnplay && wave[w].isPlaying() == true ) {
					 	wave[w].pause()
					} 
				}
				
				if(wave[btnplay].isPlaying() == true) {
					wave[btnplay].pause()
				    $(".tr").eq(btnplay).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
					$("#barbtn").attr("src","../resources/icon/play-circle.svg")
					return
				} 
				
				// 재생
				wave[btnplay].play()
			    $(".tr").eq(btnplay).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
				$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				
				$("#addheight").css("height","100px")
				
				// 플레이바 설정
				$("#playWrap").css({
					"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
					"height":"80px"
				})
				$("#playimg").attr("src","../upload/"+imgSrc)
				$("#playimg").css("visibility","visible")
				$("#barprocess").html("0:00")
				$("#barduration").html("0:00")
				$("#barsourcename").html(sourcename)
				$("#barsourcename").attr("data-barno",btnplay)
				$("#next").attr("src","../resources/icon/skip-end-circle.svg")
				$("#prev").attr("src","../resources/icon/skip-start-circle.svg")
				
				
				var duration = document.querySelector("#barduration")
				duration.textContent = timeCalculator(wave[btnplay].getDuration());
				
				var current = document.querySelector("#barprocess")
				wave[btnplay].on("audioprocess", function(e) {
					
					current.textContent = timeCalculator(wave[btnplay].getCurrentTime());
					
				})
				
 			})
			
			// 좋아요 구현
			var likes = document.querySelectorAll("div[data-like]");
			
			$(".like").click(function() {
				
				// 인덱스 변수
				var idx = $(".like").index(this)
				
				// SourceNo 변수
				var sourceno = likes[idx].getAttribute('data-like')
				
				$.ajax({
					type: "get"
					, url: "./genre/like"
					, data: {
						"userNo" : ${userNo},
						"sourceNo" : sourceno
					}
					, dataType: "json"
					, success: function( res ) {
						
						if(res.result == true) {
							
							$(".like").eq(idx).html('<img src="../resources/icon/heart-fill.svg" style="width:45%">')
							
						} 	else if (res.result == false) {
							
								$(".like").eq(idx).html('<img src="../resources/icon/heart.svg" style="width:45%">')
							
							}
						}
			     })
			  })
			
			   // 다운로드
				  var buys = document.querySelectorAll("div[data-buy]");
				  var buys2 = document.querySelectorAll("div[data-buy2]");
				  
				  $(".buy").click(function() {
					
					  var bidx = $(".buy").index(this)
					  var bsourceNo = buys[bidx].getAttribute('data-buy')
					  var bpackNo = buys2[bidx].getAttribute('data-buy2')
					  
					  console.log("인덱스",bidx)
					  console.log("소스넘",bsourceNo)
					  console.log("팩넘",bpackNo)
					  
					  $.ajax({
						type:"get",
						url:"/source/credit",
						data: {
							"userNo" : ${userNo},
							"sourceNo" : bsourceNo
						},
						dataType: "json",
						success : function(res) {
							
							if(res.result == true) {
								
								$("#headerCreditStatus").text(res.credit + " credits")
								location.href = "/source/download?inst=true&sourceNo="+bsourceNo
								
							} else if (res.result == false) {
								
								$("#headerCreditStatus").text(res.credit + " credits")
								location.href = "/source/download?inst=true&sourceNo="+bsourceNo
							}
					
						}
					
					  })
					  
				  })
			  
			  // 장바구니 구현
			  var carts = document.querySelectorAll("div[data-cart]");
			  
			  $(".cart").click(function() {
				  
				  // 인덱스 변수 확인
				  var cidx = $(".cart").index(this)
				  
				  // SourceNo 확인
				  var csourceNo = carts[cidx].getAttribute('data-cart')
				  
				  $.ajax({
					type :"get"
					, url :"/cart/add"
					, data : {
						"userNo" : ${userNo},
						"sourceNo" : csourceNo
					}
				  	, dataType :"json"
				  	, success : function(res) {
				  		console.log("장바구니 ajax 성공")
				  		if(res == true) {
				  			
				  			$(".cartmsg").eq(cidx).text('Get Source!')
					  		$(".cartmsg").eq(cidx).css("display","block")
					  		
				  		}	else if (!res) {
	                        $(".cartmsg").eq(cidx).text('You already have!')
	                        $(".cartmsg").eq(cidx).css("display","block")
	                        
	                        var result = confirm ("이미 구매한 항목입니다. 구매항목을 확인하시겠습니까?")
	                        
	                        if(result) {
	                             //yes => 내가 받은 음원 페이지로 이동함
	                              location.replace('/users/mysource');
	                         }
				  	  	}
				  		
				  		$(".cartmsg").eq(cidx).fadeOut(1000)
				  		
				  	}, error : function(res) {
				  		console.log("장바구니 ajax 실패")
				  		
					  		$(".cartmsg").eq(cidx).css("display","block")
							$(".cartmsg").eq(cidx).text('You already have!')
							$(".cartmsg").eq(cidx).fadeOut(1000)
							
				  		$(".cartmsg").eq(cidx).fadeOut(1000)
				  	}
				  }) // ajax End
			  }) // click end
			  
			  $(".already").fadeOut(5000)
			  
		</script> 
	</div>
</div>	
<div id="addheight"></div>	
</div><!-- Wrap END -->

<c:import url="../layout/footer.jsp"/>