<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/header.jsp"/>
<script src="https://unpkg.com/wavesurfer.js@6.6.3/dist/wavesurfer.js"></script>
<style type="text/css">
#wrap{
	width: 1400px;
	margin: 0 auto;
}
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
#midWrap{
	width: 1384px;
	margin: 0 auto;
}
.title{
	font-size: 26px;
	padding-left: 10px;
	margin-top: 30px;
}
#sgrid{
	width: 1384px;
	display: grid;
	grid-template-columns: 80px 80px 410px 80px 80px 80px 300px 200px;
}
.th2{
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	padding-top: 3px;
	text-align: center;
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
.sourcename{
	height: 60px;
	overflow: hidden;
	box-sizing: border-box;
	padding-top: 18.5px;
	padding-bottom: 18.5px;
	vertical-align: middle;
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
.filename{
	height: 60px;
	overflow: hidden;
	box-sizing: border-box;
	padding-top: 18.5px;
	padding-bottom: 18.5px;
	vertical-align: middle;
	text-align: center;
}
.trwave{
	height: 60px;
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
}
.icons{
	text-align: center;
	padding-top: 18px;
	padding-bottom: 18px;
	display: grid;
	grid-template-columns: 100px 100px; 
	height: 60px;
}
div[data-itemtype='line'] {
	border-bottom: 1px solid #ccc;
}
.trimg{
	padding-top: 10px;
	margin: 0 auto;
	width: 80px;
	padding-left:20px;
	height:60px;
}
</style>

<div id="wrap">
	<div id="grid">
		<div id="colgrid">
			<div class="items"><h1>마이페이지</h1></div>
			<div class="items"><a href="./mypage">회원정보</a></div>
			<div class="items"><a href="">내가 쓴글</a></div>
			<div class="items"><a href="./mysource">내 음원</a></div>
			<div class="items"><a href="">결제내역</a></div>
			<div class="items"><a href="./question">문의하기</a></div>
		</div>	
		</div>
	</div>
	
	
	<div id="midWrap">
		<div class="title">내가 받은 음원</div>
		<div class="title">Result :  ${list.size() }</div>
		<div id="sgrid">
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
				<c:when test="${empty list.PACK_IMG_STOREDNAME }">
					<div class="trimg" data-itemtype="line" data-img="${list.SOURCE_IMG_STOREDNAME}"><img src="../upload/${list.SOURCE_IMG_STOREDNAME}" style="width:40px; height: 40px;"></div>
				</c:when>
				<c:otherwise>
					<div class="trimg" data-itemtype="line" data-img="${list.PACK_IMG_STOREDNAME}"><a href="/source/pack?packNo=${list.PACK_NO }"><img src="../upload/${list.PACK_IMG_STOREDNAME}" style="width:40px; height: 40px;"></a></div>
				</c:otherwise>
			</c:choose>
			
			<div class="tr" data-itemtype="line"><img src="../resources/icon/play-circle.svg" style="width: 30%"></div>
			<div class="sourcename" data-itemtype="line" data-sourcename="${list.SOURCE_NAME}"><span>${list.SOURCE_NAME}</span></div>
			<div class="time" data-itemtype="line"><span class="timespace">${list.SOURCE_TIME}</span></div>
			<div class="filename" data-itemtype="line"><span>${list.KEY}</span></div>
			<div class="filename" data-itemtype="line"><span>${list.BPM}</span></div>
			<div class="trwave" data-itemtype="line">
				<div id="wave${list.SOURCE_NO}" data-no="${list.SOURCE_NO}" data-name="${list.FILE_STOREDNAME}"></div>
			</div>
			
			<div class="icons" data-itemtype="line">
				<div><a href="/source/redown?sourceNo=${list.SOURCE_NO }"><img src="../resources/icon/plus-circle.svg" style="width: 25%"></a></div>
				<div><a href="/source/pack?packNo=${list.PACK_NO }"><img src="../resources/icon/three-dots.svg" style="width: 25%"></a></div>
			</div>
			
			</c:forEach>
			
			<script type="text/javascript">
				//음원소스 시간 계산기
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
					}
					
						wave[waveno].play()	
						$(".tr").eq(waveno).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
					
					})
					
					
// 				})
				
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
						return
					} 
					
					// 재생
					wave[btnplay].play()
				    $(".tr").eq(btnplay).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
					
					
	 			})
			</script>
			
			
		
		</div>
	</div>
<c:import url="../layout/footer.jsp" />