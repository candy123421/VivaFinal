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
	
	$(".packname").hover(function() {
		$(this).css({
			'background':'lightgrey',
			'color':'black'
		})
	})
	
	$(".packname").mouseout(function() {
		$(this).css({
			'background':'white',
			'color':'black'
		})
	})
	
	
})
</script>
<style type="text/css">
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
.cateWrap{
	text-align: center;
}
#WrapTop{
	width: 1400px;
	margin: 0 auto;
}
#WrapMiddle{
	width: 1400px;
	margin : 0 auto;
}
#btn{
	font-size: 2.5em;
	height: 70px;
	padding-left: 0px;
}
#Wrap{
}
#line{
	width: 1300px;
	border-top: 1px solid #ccc;
	padding-top: 16px;
}
#drop{
	width: 1300px;
}
.width{
	width:1300px;
	padding-bottom: 17px;
}
#tab{
	width: 1300px;
	height: 50px;
	display: grid;
	grid-template-columns: 80px 100px;
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
#SourceWrap{
	display: grid;
	grid-template-columns: 80px 80px 400px 80px 80px 80px 300px 200px;
}

div[data-itemtype='line']{
	border-bottom: 1px solid #ccc;
}
a{
	text-decoration: none;
}
#grid{
	display: grid;
	grid-template-columns : 200px 200px 200px 200px 200px;
	grid-column-gap: 30px;
	grid-row-gap: 30px;
	width: 1300px;
	place-content: center;
}
.trimg{
	width: 200px;
	height: 200px;
}
.packname{
	font-size: 20px;
	text-align: center;
}
.wavewrap{
	display: none;
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
			<li><a class="dropdown-item" href="/pack/inst?instrument=Drum">Drum</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Kick">Kick</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Snare">Snare</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Hihat">Hihat</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Clap">Clap</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Tom">Tom</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Cymbal">Cymbal</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=808">808</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Fills">Fills</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Percussion">Percussion</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Rimshot">Rimshot</a></li>
			
			<li><a class="dropdown-item disabled">Vocal</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=Vocal">Vocal</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Female">Female</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Male">Male</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Phrases">Phrases</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Whispers">Whispers</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Screams">Screams</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Dialogue">Dialogue</a></li>
			
			
			<li><a class="dropdown-item disabled">Synth</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Pad">Pad</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Arp">Arp</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Pluck">Pluck</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Fx">Fx</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Chord">Chord</a></li>
			
			
			<li><a class="dropdown-item disabled">Brass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=Brass">Brass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Saxophone">Saxophone</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Trumpet">Trumpet</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Trombone">Trombone</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Pad">Pad</a></li>
			
			
			<li><a class="dropdown-item disabled">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=WoodWinds">WoodWinds</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Flute">Flute</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Harmonica">Harmonica</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Clarinet">Clarinet</a></li>
			
			
			<li><a class="dropdown-item disabled">Guitar</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=Guitar">Guitar</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Electric">Electric</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Clean">Clean</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Dist">Dist</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Lead">Lead</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Rhythm">Rhythm</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Melody">Melody</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Riff">Riff</a></li>
			
			<li><a class="dropdown-item disabled">Bass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=Bass">Bass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Synth">Synth</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Analog">Analog</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Acoustic">Acoustic</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=ElectricBass">Electric Bass</a></li>
			
			<li><a class="dropdown-item disabled">String</a></li>
			<li><a class="dropdown-item" href="/pack/inst?instrument=String">String</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Violin">Violin</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Viola">Viola</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Contrabass">Contrabass</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Orchestral">Orchestral</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=StringPad">StringPad</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Staccato">Staccato</a></li>
			<li><a class="dropdown-item" href="/pack/inst?detail=Pizzicato">Pizzicato</a></li>
			
			<li><a class="dropdown-item disabled">Piano</a></li>
			<li><a class="dropdown-item" href="/pack/inst?inst=Piano">Piano</a></li>
		</ul>
</div>

	<div id="line"></div>
	<div id="tab">
		<div class="cateWrap">
			<c:if test="${empty detail }">
				<a href="/source/inst?instrument=${inst}"><span class="cate" >Source</span></a>
			</c:if>
			<c:if test="${not empty detail }">
				<a href="/source/inst?detail=${detail}"><span class="cate" >Source</span></a>
			</c:if>
		</div>
		<div class="cateWrap">
			<c:if test="${empty detail }">
				<a class="a" href="/pack/inst?instrument=${inst}"><span class="cate" style="border-bottom: 3px solid #ccc">Pack</span></a>
			</c:if>
			<c:if test="${not empty detail }">
				<a class="a" href="/pack/inst?detail=${detail}" style="border-bottom: 3px solid #ccc"><span class="cate">Pack</span></a>
			</c:if>			
		</div>	
	</div>
	
	<div id="tagWrap">
		<c:forEach var="tag" items="${genre }" >
			<c:if test="${empty tag.genre }">
				${tag.genre }
			</c:if>
			<c:if test="${not empty tag.genre && tag.genre ne cgenre && not empty inst}">
				<a class="tagA" href="/pack/inst?instrument=${inst}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
			<c:if test="${not empty tag.genre && tag.genre ne cgenre} ">
				<a class="tagA" href="/pack/inst?detail=${det}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
			<c:if test="${empty inst && not empty tag.genre && tag.genre ne cgenre}">
				<a class="tagA" href="/pack/inst?detail=${det}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
			<c:if test="${not empty detail } ">
				<a class="tagA" href="/pack/inst?instrument=${dinst }&detail=${det}&genre=${tag.genre}"><div class="tagcover">${tag.genre}</div></a>
			</c:if>
		</c:forEach>
	</div>
	
</div><!-- WrapTop End -->

<div id="WrapMiddle">
	<div id="infoline"><div class="cate">Result : ${list.size()}</div>
		<c:if test="${not empty msg}">
		<div class="already">${msg }</div>
		</c:if>
	</div>
	
	<div id="gridWrap">
		<div id="grid">
			<c:forEach items="${list }" var="list">
				<div class="content">
					<c:if test="${list.PACK_IMG_STOREDNAME eq null }">
						<div class="trimg" data-img="default-image.webp" ><img src="../resources/img/default-image.webp" style="width: 100%"></div>
					</c:if>
					<c:if test="${list.PACK_IMG_STOREDNAME ne null }">
						<div class="trimg" data-img="${list.PACK_IMG_STOREDNAME }" ><img src="../upload/${list.PACK_IMG_STOREDNAME }" style="width: 100%"></div>
					</c:if>
					<div class="packname" data-no="${list.PACK_NO }" data-packname="${list.PACK_NAME }" data-name="${list.FILE_STOREDNAME }">${list.PACK_NAME }</div>
					<div class="wavewrap"><div id="wave${list.PACK_NO }"></div>
					</div>
				</div>
			</c:forEach>
		</div>
	
	</div>

			
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
		
			// 마우스 오버, 플레이 버튼
			$(".trimg").hover(function() {
				
				var idx = $(".trimg").index(this)
				
				$(".trimg").eq(idx).css("cursor","pointer")
				
			})
			
			// 이미지 누를 시 재생	
			$(".trimg").click(function() {
				
				//console.log($(".trwave").index(this))
				// 음원소스 위치 알아내기
				var waveno = $(".trimg").index(this)
				
				// 이미지 위치 알아내기
				var imgno = $(".tr").index(this)
				
				var imgSrc = $(".trimg").eq(waveno).attr('data-img')
				
				var packname = $(".packname").eq(waveno).attr('data-packname')
				
				if(wave[waveno].isPlaying() == true) {
					wave[waveno].pause()
					console.log("제어문 동작 하는거지?")
				    $("#barbtn").attr("src","../resources/icon/play-circle.svg")
				    
				    return
				}
				
				// 다른 음원 재생 시 모두 종료 후 현재 클릭한 음원소스 재생
				for(var w=0; w<wave.length; w++) {
					if( w != waveno && wave[w].isPlaying() == true ) {
					 	wave[w].pause()
					} 
				}
				
				wave[waveno].play()	
				$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				
				// 플레이바 구현
				$("#playWrap").css({
					"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
					"height":"80px"
				})
				
				$("#addheight").css("height","100px")
				$("#playimg").attr("src","../upload/"+imgSrc)
				$("#playimg").css("visibility","visible")
				
				if(wave[waveno].isPlaying() == true) {
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
				} else if(wave[waveno].isPlaying() == false){
					$("#barbtn").attr("src","../resources/icon/play-circle.svg")
				}
				
				$("#barprocess").html("0:00")
				$("#barduration").html("0:00")
				$("#barsourcename").html(packname)
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
			  
		</script> 


</div> <!-- Wrap Middle End -->
<div id="addheight"></div>
</div> <!-- Wrap End -->
<c:import url="../layout/footer.jsp"/>