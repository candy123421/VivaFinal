<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
#Wrap{
	padding-left: 16px;
	box-sizing: border-box;
}
#WrapTop{
	display: grid;
	grid-template-columns: 200px 1100px;
	width: 1400px;
	margin: 0 auto;
	
}
#WrapMiddle{
	width: 1400px;
	margin: 0 auto;
}
.packimg{
	width: 200px;
	height: 200px;
}
.img{
	width: 100%;
}
.packname{
	padding-left: 30px;
	padding-top: 30px;
}
.get{
	background: #BB2649;
	color: white;
	border: 1px solid #BB2649;
	width: 85px;
	height: 37px;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
	padding-top:7px;
}
.space{
	height: 75px;
	padding-top: 10px;
}
#WrapContent{
	width: 1400px;
	margin: 0 auto;

}
#explain{
	margin-top: 10px;
	margin-bottom: 10px;
}
#explainText{
	font-size: 17px;
}
.tagWrap{
	width: 1300px;
	height: 96px;
	border-bottom: 1px solid #ccc;
	display: grid;
	grid-template-columns: 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px 85px ;
	grid-template-rows: 28px 28px 28px;
	overflow: hidden;
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
.tagA {
	text-decoration: none;
	color: black;
}
#infoline{
	display : grid;
	grid-template-columns: 200px 1100px
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
.cart{
	cursor: pointer;
}
.like{
	cursor: pointer;
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
	display: grid;
	grid-template-areas: 'limg like cart link'
						'cartmsg cartmsg cartmsg cartmsg';
	grid-template-columns: 50px 50px 50px 50px; 
	height: 60px;
}
#SourceWrap{
	display: grid;
	grid-template-columns: 80px 80px 400px 80px 80px 80px 300px 200px;
}
.cartmsg{
	height: 18px;
	grid-column: span 4;
	font-size: 12px;
	font-weight: bold;
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
div[data-itemtype='line']{
	border-bottom: 1px solid #ccc;
}
.cate{
	color: black;
	font-size: 1.4em;
	line-height: normal;
	height: 40px;
}
#packlike{
	width: 85px;
	height: 37px;
	display: inline-block;
	text-align: center;
	padding-top:7px; 
}
#cartpackmsg{
	display: inline-block;
	font-weight: bold;
	background: linear-gradient(251.88deg, #BE3455 30.85%, #532AA2 78.35%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
</style>
<div id="Wrap">
	<div id="WrapTop">
		<c:if test="${single ne 10 }">
			<div class="packimg"><img class="img" src="../upload/${info.PACK_IMG_STOREDNAME }"></div>
			<div class="packname">
				<h1>${info.PACK_NAME }</h1>
				<div class="space">
					<div id="explain">
						<div id="explainText">${info.PACK_CONTENT}</div>
					</div>
				</div>
				<div id="getpack" class="get">Get Pack</div>		
				<div id="packlike" style="margin-left: 15px;">
				<c:if test="${pLike == true }">
					<img id="likepack" src="../resources/icon/heart-fill.svg" style="width: 40%">
				</c:if>
				<c:if test="${pLike == false }">
					<img id="likepack" src="../resources/icon/heart.svg" style="width: 40%">
				</c:if>
					<span style="margin-left:5px; font-size:20px;">${like }</span>
				</div>	
				<div id="cartpackmsg"></div>
			</div>
		</c:if>	
		<c:if test="${single eq 10 }">
			<div class="packimg"><img class="img" src="../resources/img/default-image.webp"></div>
			<div class="packname">
				<h1>Single Source Page</h1>
				<div class="space">
					<div id="explain">
						<div id="explainText">Pack에 없는 단일 음원 Source 입니다!</div>
					</div>
				</div>
			</div>
		</c:if>	
	</div>
	
	<div id="WrapContent">
		<img class="FunctionTilteLine" src="../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1300px;">
		
		<div class="tagWrap">
			<!-- 메인 Pack View로 가는 태그 -->
			<a class="tagA" href="/source/pack?packNo=${packNo}"><div class="tagcover">Main</div></a>
			
			<c:forEach var="tag" items="${genre }" >
				<c:if test="${empty tag.GENRE}">
					${tag.GENRE }
				</c:if>
				<c:if test="${not empty tag.GENRE }">
					<a class="tagA" href="/source/pack?packNo=${tag.PACK_NO}&genre=${tag.GENRE}"><div class="tagcover">${tag.GENRE}</div></a>
				</c:if>
			</c:forEach>
			
			<c:forEach var="tag" items="${inst }" >
				<c:if test="${empty tag.INSTRUMENT }">
					${tag.INSTRUMENT }
				</c:if>
				<c:if test="${not empty tag.INSTRUMENT }">
					<a class="tagA" href="/source/pack?packNo=${tag.PACK_NO}&instrument=${tag.INSTRUMENT}"><div class="tagcover">${tag.INSTRUMENT}</div></a>
				</c:if>
			</c:forEach>
			
			<c:forEach var="tag" items="${scape }" >
				<c:if test="${empty tag.SCAPE }">
					${tag.SCAPE }
				</c:if>
				<c:if test="${not empty tag.SCAPE }">
					<a class="tagA" href="/source/pack?packNo=${tag.PACK_NO }&scape=${tag.SCAPE}"><div class="tagcover">${tag.SCAPE}</div></a> 
				</c:if>
			</c:forEach>
				
			<c:forEach var="tag" items="${detail }" >
				<c:if test="${empty tag.DETAIL }">
					${tag.DETAIL }
				</c:if>
				<c:if test="${not empty tag.DETAIL }">
					<a class="tagA" href="/source/pack?packNo=${tag.PACK_NO }&detail=${tag.DETAIL}"><div class="tagcover">${tag.DETAIL}</div></a> 
				</c:if>
			</c:forEach>
				
			<c:forEach var="tag" items="${fx }" >
				<c:if test="${empty tag.FX }">
					${tag.FX }
				</c:if>
				<c:if test="${not empty tag.FX }">
					<a class="tagA" href="/source/pack?packNo=${tag.PACK_NO}&fx=${tag.FX}"><div class="tagcover">${tag.FX}</div></a> 
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
					<c:when test="${empty list.PACK_IMG_STOREDNAME }">
						<div class="trimg" data-itemtype="line" data-img="default-image.webp"><img src="../resources/img/default-image.webp" style="width:40px; height: 40px;"></div>
					</c:when>
					<c:otherwise>
						<div class="trimg" data-itemtype="line" data-img="${list.PACK_IMG_STOREDNAME}"><a href="./pack?packNo=${list.PACK_NO }"><img src="../upload/${list.PACK_IMG_STOREDNAME}" style="width:40px; height: 40px;"></a></div>
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
					<div class="like" data-like="${list.SOURCE_NO}"><img src="../resources/icon/heart.svg" style="width: 45%"></div>
					<div class="cart" data-cart="${list.SOURCE_NO }"><img src="../resources/icon/shopping-cart.png" style="width: 45%"></div>
					<div><a href="./pack?packNo=${list.PACK_NO }"><img src="../resources/icon/three-dots.svg" style="width: 45%"></a></div>
					<div class="cartmsg"></div>
				</div>
			
			</c:forEach>
	
			<div id="addheight"></div>
	
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
					    $("#barbtn").attr("src","../resources/icon/stop-circle.svg")
					}
					
					
					wave[waveno].play()	
					$(".tr").eq(waveno).html('<img src="../resources/icon/stop-circle.svg" style="width:30%">')
					$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
					
					$("#playWrap").css({
						"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
						"height":"80px"
					})
					
					$("#addheight").css("height","100px")
					
					// 플레이바 구현
					$("#playimg").attr("src","../upload/"+imgSrc)
					$("#playimg").css("visibility","visible")
					
					if(wave[waveno].isPlaying() == true) {
						$("#barbtn").attr("src","../resources/icon/stop-circle.svg")
					} else if(wave[waveno].isPlaying() == false){
						$("#barbtn").attr("src","../resources/icon/play-circle.svg")
					}
					
					$("#next").attr("src","../resources/icon/skip-end-circle.svg")
					$("#prev").attr("src","../resources/icon/skip-start-circle.svg")
					$("#barprocess").html("0:00")
					$("#barduration").html("0:00")
					$("#barsourcename").html(sourcename)
					$("#barsourcename").attr("data-barno",waveno)
					
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
					
					// 플레이바 설정
					$("#playWrap").css({
						"background":"linear-gradient(263.28deg, #514C9C 7.05%, #653A99 16.72%, #6E388C 25.66%, rgba(117, 37, 114, 0.76) 38.08%, rgba(174, 106, 166, 0.84) 78.14%, #8E4B6D 93.97%)",
						"height":"80px"
					})
					
					$("#addheight").css("height","100px")
					
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
				
				// 음원소스 좋아요 구현
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
				
				  
				  // Pack 좋아요 구현
				  $("#likepack").click(function() {
					  
					console.log("pack좋아요 클릭")
					
					$.ajax({
						type: "get",
						url: "./pack/like",
						data: {
							"userNo" : ${userNo},
							"packNo" : ${info.PACK_NO}
						},
						dataType: "json",
						success: function(res) {
							if(res.result == true) {
								// 좋아요 추가
								$("#likepack").attr("src","../resources/icon/heart-fill.svg")
								$("#packlike").children(2).eq(1).html(res.cnt)
								
							} else if( res.result == false) {
								// 좋아요 삭제
								$("#likepack").attr("src","../resources/icon/heart.svg")
								$("#packlike").children(2).eq(1).html(res.cnt)
								
							}
						}
					})
				  })
				  
				  // 다운로드?
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
								location.href = "/source/download?sourceNo="+bsourceNo+"&packNo="+bpackNo
								
							} else if (res.result == false) {
								
								$("#headerCreditStatus").text(res.credit + " credits")
								location.href = "/source/download?sourceNo="+bsourceNo+"&packNo="+bpackNo
							}
							
						}
					
					  })
					  
				  })
				  // 장바구니 구현
				  var carts = document.querySelectorAll("div[data-cart]");
				  
				  $(".cart").click(function() {
					  
					  console.log("장바구니를 넣고 싶어하군요")
					  // 인덱스 변수 확인
					  var cidx = $(".cart").index(this)
					  console.log("cidx : ", cidx)
					  
					  // SourceNo 확인
					  var csourceNo = carts[cidx].getAttribute('data-cart')
					  console.log("csourceNo : ", csourceNo)
					  
					  
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
					  		console.log(res)
					  		/*  res 반환값을 true / false 로 주려고 해서 ... 아래의 내용을 수정함 - 지선 */
//	 				  		if(res.result == true) {
					  		if(res) {
						  		$(".cartmsg").eq(cidx).text('Get Source!')
						  		$(".cartmsg").eq(cidx).css("display","block")
						  		
					  		} else if (res.result == false) {
					  			
	                        	 $(".cartmsg").eq(cidx).text('You already have!')
	                         	 $(".cartmsg").eq(cidx).css("display","block")
		                         var result = confirm ("이미 구매한 항목입니다. 구매항목을 확인하시겠습니까?")
		                         
		                         if(result) {
		                             //yes => 내가 받은 음원 페이지로 이동함
		                              location.replace('/users/mysource');
		                         }

					  	  	}
					  		
					  		 $(".cartmsg").eq(cidx).fadeOut(1000)
					  	  } 
					  , error : function() {
						  $(".cartmsg").eq(cidx).css("display","block")
						  $(".cartmsg").eq(cidx).text('You already have!')
						  $(".cartmsg").eq(cidx).fadeOut(1000)
					  	  }
					  }) // ajax End
				  }) // click end
				  
				  // Get Pack ( 전체 음원소스 장바구니 구현)
				  // CartController 로 전달
				  $("#getpack").click(function() {
					  
					  console.log("getpack 클릭")
					  
					  var sourceArr = []
					  
					  // 전체 source_no를 배열로 받아야함
					  for(var s=0; s<carts.length; s++) {
						  
						  var csourceNo = carts[s].getAttribute('data-cart')
						  
						  sourceArr.push(csourceNo);
						  
					  }
					  
					  
					  $.ajax({
						  type:"get",
						  url:"/cart/addPack",	
						  data: {
							  "userNo" : ${userNo},
							  "sourceNo" : sourceArr
						  },
						  dataType: "json",
						  success : function(res) {
							console.log("ajax 성공") 
							console.log(res)
							if(res == true) {
								$("#cartpackmsg").css("display","inline-block")
								$("#cartpackmsg").text("You get a Pack!");
								
							} else if(res == false) {
								$("#cartpackmsg").css("display","inline-block")
								$("#cartpackmsg").text("You Already get a Pack!");
							}
								$("#cartpackmsg").fadeOut(2500)
						  },
						  error: function() {
							  console.log("ajax 실패")
						  	$("#cartpackmsg").text("You Already get a Pack!");
						  }
					  })
				  })
				  
				  $(".already").fadeOut(2500)
			</script>
	</div>
</div>
</div>



















































<c:import url="../layout/footer.jsp"/>