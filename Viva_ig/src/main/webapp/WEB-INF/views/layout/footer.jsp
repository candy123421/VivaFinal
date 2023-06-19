<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	</div><!--  div.item End (header.jsp) -->
</div><!--  div.wrapper End (header.jsp) -->

<style type="text/css">
#footer{
	position: relative;
/* 	pointer-events: none; */
}
#pop{
	position: absolute;
	top: -120px;
	left: 950px;
	display : flex;
	justify-content :center;
	align-items : center;
	color : white;
}
#playWrap{
	width: 100%;
	padding-left: 250px;
/* 	height: 80px; */
	position: fixed;
	bottom: 0px;
	color: white;
	z-index: 10;
}
#playbar{
	position: relative;
}
#playimg{
	position: absolute;
	visibility: hidden;
	top: 20px;
	left: 550px;
	width: 40px;
	height: 40px;
}
#barbtn{
	position: absolute;
	top: 23px;
	left: 440px;
	width: 35px;
	z-index: 100;
}
#barsourcename{
	position: absolute;
	top: 20px;
	left: 600px;
}
#barprocess{
	position: absolute;
	top: 45px;
	left: 600px;
}
#barduration{
	position: absolute;
	top: 45px;
	left: 650px;
}
#cartWrap{
	position: relative;
}
#bar{
	position: absolute;
	top: 45px;
	left: 638px;
}
#next{
	position: absolute;
	top: 23px;
	left: 480px;
	width: 35px;
}
#prev{
	position: absolute;
	top: 23px;
	left: 400px;
	width: 35px;
}
</style>
<div id="footer">
	<div id="cartWrap"></div>
	<div id="playWrap">
		<div id="playbar">
			<img id="playimg" src="">
			<img id="barbtn"src="">
			<img id="next"src="">
			<img id="prev"src="">
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
			
				$("#barbtn").hover(function() {
					$("#barbtn").css("cursor","pointer")
				})
				
				
				$("#barbtn").click(function() {
					console.log("플버튼")
					
					var idx = $("#barsourcename").attr('data-barno')
					
					console.log("푸터 idx",idx)
					
					if(wave[idx].isPlaying() == true) {
						
						wave[idx].pause()
						// 네모 버튼
						$("#barbtn").attr("src","../resources/icon/play-circle.svg")
						$(".tr").eq(idx).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
						
					} else if(wave[idx].isPlaying() == false){
						wave[idx].play()
						// 재생 버튼
						$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
						$(".tr").eq(idx).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
					}
					
				})
				
				$("#next").hover(function() {
					$("#next").css("cursor","pointer")
				})
				
				$("#prev").hover(function() {
					$("#prev").css("cursor","pointer")
				})
				
				$("#next").click(function() {
					
					var idx = Number(1)
					var cur =  Number($("#barsourcename").attr('data-barno'))
							
					for(var i=0; i<wave.length; i++) {
						wave[i].stop()
					}
					
					
					if(wave[cur].isPlaying() == true) {
						wave[cur].stop()
						$(".tr").eq(cur).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
						
						wave[cur+idx].play()
						$(".tr").eq(cur+idx).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
						
					} else if(wave[cur].isPlaying() == false){
						wave[cur+idx].play()
						$(".tr").eq(cur+idx).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
						$(".tr").eq(cur).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
					}
					
					
					$("#barprocess").html("0:00")
					$("#barduration").html("0:00")
					$("#barsourcename").attr("data-barno",cur+idx)
					
					var cname = $(".packname").eq(cur+idx).attr("data-packname")
					$("#barsourcename").html( cname )
					
					var cimg = $(".trimg").eq(cur+idx).attr("data-img")
					
					$("#playimg").attr("src","../upload/"+cimg)
					
// 					if( cimg == 'default-image.webp') {
// 						$("#playimg").attr("src","../resources/img/"+cimg)
// 					}
					
					
 					//음원소스 재생 시간 계산 부분
					var duration5 = document.querySelector("#barduration")
					duration5.textContent = timeCalculator(wave[cur+idx].getDuration());
					
					var current5 = document.querySelector("#barprocess")
					wave[cur+idx].on("audioprocess", function(e) {
						
						current5.textContent = timeCalculator(wave[cur+idx].getCurrentTime());
						
					})
					
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
					
				})
				
				$("#prev").click(function() {
					
					var idx = Number(1)
					var cur =  Number($("#barsourcename").attr('data-barno'))
					console.log("idx == prev", idx)
					console.log("cur == prev", cur)
					
					// 첫 번쨰 트랙에서 사용한 경우 즉시 return 중지
					if( idx > cur ) {
						return
					}
					
					for(var i=0; i<wave.length; i++) {
						wave[i].stop()
					}
					
					
					if(wave[cur].isPlaying() == true) {
						wave[cur].stop()
						$(".tr").eq(cur).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
						
						wave[cur-idx].play()
						$(".tr").eq(cur-idx).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
						
					} else if(wave[cur].isPlaying() == false){
						wave[cur-idx].play()
						$(".tr").eq(cur-idx).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
						$(".tr").eq(cur).html('<img src="../resources/icon/play-circle.svg" style="width:30%">')
					}
					
					
					$("#barprocess").html("0:00")
					$("#barduration").html("0:00")
					$("#barsourcename").attr("data-barno",cur-idx)
					
					var cname = $(".packname").eq(cur-idx).attr("data-packname")
					$("#barsourcename").html( cname )
					
					var cimg = $(".trimg").eq(cur-idx).attr("data-img")
					$("#playimg").attr("src","../upload/"+cimg)
					
 					//음원소스 재생 시간 계산 부분
					var duration5 = document.querySelector("#barduration")
					duration5.textContent = timeCalculator(wave[cur-idx].getDuration());
					
					var current5 = document.querySelector("#barprocess")
					wave[cur-idx].on("audioprocess", function(e) {
						
						current5.textContent = timeCalculator(wave[cur-idx].getCurrentTime());
						
					})
					
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
					
				})
				
				
			</script>
			<span id="barsourcename"></span>
			<span id="barprocess"></span>
			<span id="bar"></span>
			<span id="barduration"></span>
		</div>
	</div>	
</div>
    
</body>
</html>