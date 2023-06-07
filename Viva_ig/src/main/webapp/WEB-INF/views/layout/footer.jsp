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
	height: 80px;
	position: fixed;
	bottom: 0px;
	color: white;
	z-index: 10;
}
#playbar{
	position: relative;
/* 	pointer-events: none; */
}
#playimg{
	position: absolute;
	visibility: hidden;
	top: 20px;
	left: 450px;
	width: 40px;
	height: 40px;
}
#barbtn{
	position: absolute;
	top: 23px;
	left: 530px;
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
</style>
<div id="footer">
	<div id="cartWrap"></div>
	<div id="playWrap">
		<div id="playbar">
			<img id="playimg" src="">
			<img id="barbtn"src="">
			<script type="text/javascript">
			
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
			</script>
			<span id="barsourcename"></span>
			<span id="barprocess"></span>
			<span id="bar"> | </span>
			<span id="barduration"></span>
		</div>
	</div>	
</div>
    
</body>
</html>