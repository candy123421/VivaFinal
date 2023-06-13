<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>FileUpPack</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.css" />
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(document).ready(function() {
		$("#cancel").click(function() {
			history.go(-1)
		})

		//form이 있는데 굳이 또 쓰는이유를 잘모르겠어용
// 		$("#btnWrite").click(function() {
// 			submitContents($("#btnWrite"))
			
// 			$("form").submit();
// 		})
	})
	
// 	bpm focus시 출력
	$("#bpm").focus(function(){
		$("#bpm_msg").html("")
	})
// 	bpm focus안할시 msg출력
	$("#bpm").blur(function() {
	  var bpmReg = /^(?:[1-9]|[1-9][0-9]|[12][0-9]{2}|300)$/g;
	  
	  if (!bpmReg.test($("#bpm").val())) {
	    $("#bpm_msg").html("BPM은 숫자 1~300 사이로 입력해주세요!");
	    return false;
	  }
	  
	  if ($("#bpm").val() == "") {
	    $("#bpm_msg").html("BPM은 숫자 1~300 사이로 입력해주세요!");
	    return false;
	  }
	});
	
	$("#bpm").on('input', function() {
	  if ($("#bpm").val() == "") {
	    $("#bpm_msg").remove();
	  }
	});
		
// 	focus시 아무메세지도 출력 x 
	$("#sourceName").focus(function(){
		$("#sourceName_msg").html("")
	})
// 	아무것도 입력안할시 msg출력
	$("#sourceName").blur(function(){
		if($("#sourceName").val()==""){
			$("#sourceName_msg").html("SourceName은 필수 입력 항목입니다. Source Name을 입력해주세요!")
		}
	})
	
	// 	focus시 아무메세지도 출력 x 
	$("#sourceTime").focus(function(){
		$("#sourceTime_msg").html("Time은 0:00 형식으로 입력해주세요!")
	})
// 	아무것도 입력안할시 msg출력
	$("#sourceTime").blur(function(){
		if($("#sourceTime").val()==""){
			$("#sourceTime_msg").html("SourceTime은 필수 입력 항목입니다. Source Time을 0:00 형식으로 입력해주세요!")
		}
	})
})

</script>


<style type="text/css">
	.guide{
	font-size: 1.0em;
	color: red;
	}
	.source{
		color:grey;
		font-size: 1.5em;
		margin-right: 10px;
	}
	
	.pack{
		color:grey;
		font-size: 1.5em;
		text-decoration: none;
	}
	.title{
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	#sourceName{
	display: inline-block;
	width: 505px;
	}
	
	.key{
	display: grid;
	grid-template-columns: 53px 100px;
	margin-left: 0px;
	}
	.instrument{
	display: grid;
	grid-template-columns: 90px 100px;
	margin-left: 0px;
	}
	.detail{
	display: grid;
	grid-template-columns: 90px 100px;
	margin-left: 0px;
	}
	.genre{
	display: grid;
	grid-template-columns: 90px 100px;
	margin-left: 0px;
	}
	.scape{
	display: grid;
	grid-template-columns: 90px 100px;
	margin-left: 0px;
	}
	.fx{
	display: grid;
	grid-template-columns: 90px 100px;
	margin-left: 0px;
	}
	
	
	
	
	
	#bpm{
	display: inline-block;
	width: 505px;
	}
	#price{
	display: inline-block;
	width: 505px;
	}
	#sourceTime{
	display: inline-block;
	width: 505px;
	}
	
	
	#content{
	display: inline-block;
	resize: none;
	}
	
	label{
	display: inline-block;
	width:50px;
	text-align: left;
	}
	
	#container{
	display: grid;
	grid-template-columns: 48% 50%;
	margin-left: 0px;
/*  	grid-row:span 1;   */
	}
	
	#containerid{
	margin-left: 0px;
	}
	
/*  	.preview{  */
/*  /* 	grid-row:span 2; 그리드 합치기 */ */
/*  	border: 1px solid #d3d3d3;  */
/*  	border-radius: 10px;  */
/*  	}  */
	
/* 	.tag{ */
/* 	display: inline-block; */
/* 	border: 1px solid #d3d3d3; */
/* 	border-radius: 10px; */
/* 	width: 505px; */
/* 	height: 230px; */
/* 	} */
	

	
	.imgfile{
	margin-left: 55px;
	}
	
	#file{
	width: 237px;
	}
	
	.msg{
	color:red;
	font-size: 0.7em;
	padding-left: 80px;
	}
	
	.inputfile{
	display: grid;
	grid-template-columns: 22% 22%;
	margin-left: 50px;
	}
	
		.upload{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #9E66A4;
	}
	.upload:focus{
	outline: none;
	}

	.upload:hover{
	background: linear-gradient(208.73deg, #4C469F -24.94%, #7857A2 24.61%, rgba(190, 52, 85, 0.9) 90.77%, #9E66A4 101.89%);
	border: 2px solid #9E66A4;
	border-radius: 10px;
	width:70px;
	height:40px;
	color: white;
	}
	
	.cancel{
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid #F88080;
	border-radius: 10px;
	width:70px;
	height:40px;
	transition: all 0.4s;
	color: #F88080;
	}
	.cancel:focus{
	outline: none;
	}

	.cancel:hover{

	background: linear-gradient(270deg, rgba(245, 174, 108, 0.929575) 4.09%, rgba(255, 43, 91, 0.812201) 99.99%, #4200FF 100%);
	color: white;
	}

	

	
/* ------------------------------------------------ */
	 .tagify{    
  width: 505px;
  border-radius: 6px;
  margin-right: 0px;
  margin-bottom: 20px;
}

/* 드롭다운아래에 나오는 애들  */
.tags-look .tagify__dropdown__item{
  display: inline-block;
  padding: .3em .5em;
  border: 1px solid #CCC;
  border-radius: 10px;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}



.tags-look .tagify__dropdown__item--active{
  color: #BB2649;
  border-radius: 10px;
  
}

/* 드롭다운의 whitelist(내가 설정한 애들) */
.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
}
  </style>


</head>

<body>
<c:choose>
	<c:when test="${empty adminlogin and empty login }">
	<h1>Source / Pack Upload</h1>
	<hr>
	 로그인 후 이용해주세요!
	  <a href="/viva/login"> <button class="btn btn-outline-secondary btn-sm">Login</button> </a>
	</c:when>
	
	
	<c:when test="${login or adminlogin}">
	<div class=body>
<!-- container : div안에있는것들 다 가운데 -->
<div id="containerid" class="container" >
<h2> 자신만의 Source로 세상을 움직여주세요!</h2>
<div class="guide">
Source를 올리기전에 <a href="/file/guide">가이드</a>를 확인해주세요!
</div>
	<img class="FunctionTilteLine" src="../resources/icon/Line.svg" style="margin-top:15px; margin-bottom: 15px; width:1300px;">
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br><br>



<form action="/file/fileupsource" method="post" enctype="multipart/form-data">


<div id="container" >
	
	
	
	<div class="item">
	
		<label>Name</label>
		<input type="text" id="sourceName" name="sourceName" class="form-control" placeholder="Source Name을 써주세요!"> <br>
		<span id="sourceName_msg" class="msg"></span>
		<br>
		

		<div class="key">
		  <label>Key</label>
  	 <input name='key' class='some_class_name' placeholder='Key를 선택해주세요!'>
  	<script>	
		  var input = document.querySelector('input[name="key"]');
		
		  var whitelist = ["C", "F", "Bb", "Eb", "Ab", "Db", "Gb", "B", "E", "A","D","G","None"];
		
		  var tagify = new Tagify(input, {
		        whitelist:whitelist,
		        maxTags: 1, //최대 허용 태그 갯수 
		        dropdown: {
		          maxItems: 20,  			//드롭다운 메뉴에서 몇개정도 항목을 보여줄지         
		          classname: "tags-look", 	// 단어 몇글자 입력했을떄 추천 드롭다운 메뉴가 나타날지
		          enabled: 0,           	// 단어 몇글자 입력했을떄 추천 드롭다운 메뉴가 나타날지
		          closeOnSelect: true  		// 드롭다운 메뉴에서 태그 선택하면 자동으로 꺼지는지 안꺼지는지
		        }
		      })
		  
  	</script>
		</div>
		<label>BPM</label>
		<input type="text" id="bpm" name="bpm" class="form-control" placeholder="BPM를 입력해주세요!"><br>
		<span id="bpm_msg" class="msg"></span>
		<br>
		
		<label>Time</label>
		<input type="text" id="sourceTime" name="sourceTime" class="form-control" placeholder="Time을 입력해주세요!"><br>
		<span id="sourceTime_msg" class="msg"></span>
		<br>
		
		<label>Price</label>
		<input type="text" id="price" name="price" class="form-control" placeholder="Price" value="30 Credit" disabled="disabled"><br>
		<br>
	
		
	</div>
	
	
	<div class="tag">

 
  
  <div class="instrument">
  <label style="width: 500px; text-align: left;">Instrument</label>
  	 <input id="instrument" name='instrument' class='some_class_name' placeholder='악기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="instrument"]');

  var whitelist = ["None","Drum", "Vocal", "Synth", "Brass", "Woodwinds", "Guitar", "Bass", "String" ,"Piano"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 1,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
  
  </script>
  </div>
  
  <div class="detail">
    <label class="detail" style="width: 500px; text-align: left;">Detail</label>
  	 <input id="detail" name='detail' class='form-control' placeholder='악기를 선택후 세부악기를 선택해주세요!' data-boolean="false"
  	 style="width: 505px; height: 40px; margin-bottom: 20px;">

  	
  <script type="text/javascript">

  	$(".tagify__input").eq(1).blur(function(){
//   	$("input[name='instrument']").change(function(){
  		
  		console.log("blur 입니다!")
  		
  		if($("tag").attr('title') == 'None' && $("#detail").attr("data-boolean") == 'false'){
  			
  			$("#detail").attr("data-boolean","true")
  			
  			  var input = document.querySelector('input[name="detail"]');
  			  var whitelist = ["None"];
  			  var tagify = new Tagify(input, {
  			        whitelist:whitelist,
  			        maxTags: 1,
  			        dropdown: {
  			          maxItems: 20,          
  			          classname: "tags-look", 
  			          enabled: 0,            
  			          closeOnSelect: true   
  			        }
  			      })
  			
  		} else if($("tag").attr('title')=="Drum" && $("#detail").attr("data-boolean") == 'false'){
  			
 			 $("#detail").attr("data-boolean","true")
 			
 			  var input = document.querySelector('input[name="detail"]');
 			  var whitelist = ["Kick","Snare","Hihat","Clap","Tom","Cymbal","Acoustic","808","Fills","Percussion","rimshot"];
 			  var tagify = new Tagify(input, {
 			        whitelist:whitelist,
 			        maxTags: 1,
 			        dropdown: {
 			          maxItems: 20,          
 			          classname: "tags-look", 
 			          enabled: 0,            
 			          closeOnSelect: true   
 			        }
 			      })
 			
 		}else if($("tag").attr('title')=="Vocal" && $("#detail").attr("data-boolean") == 'false'){
  			
  			 $("#detail").attr("data-boolean","true")
  			
  			  var input = document.querySelector('input[name="detail"]');
  			  var whitelist = ["Female","Male","Phrases","Whispers","Screams","Screams"];
  			  var tagify = new Tagify(input, {
  			        whitelist:whitelist,
  			        maxTags: 1,
  			        dropdown: {
  			          maxItems: 20,          
  			          classname: "tags-look", 
  			          enabled: 0,            
  			          closeOnSelect: true   
  			        }
  			      })
  			
  		}  else if($("tag").attr('title')=="Synth" && $("#detail").attr("data-boolean") == 'false'){
  			
 			 $("#detail").attr("data-boolean","true")
 			
 			  var input = document.querySelector('input[name="detail"]');
 			  var whitelist = ["Bass","Lead","Pad","Arp","Pluck","Melody","Fx","Chord"];
 			  var tagify = new Tagify(input, {
 			        whitelist:whitelist,
 			        maxTags: 1,
 			        dropdown: {
 			          maxItems: 20,          
 			          classname: "tags-look", 
 			          enabled: 0,            
 			          closeOnSelect: true   
 			        }
 			      })
 
  		} else if($("tag").attr('title')=="Brass" && $("#detail").attr("data-boolean") == 'false'){
  			
			 $("#detail").attr("data-boolean","true")
			
			  var input = document.querySelector('input[name="detail"]');
			  var whitelist = ["Saxophone","Trumpet","Trombone","Pad","Ensemble"];
			  var tagify = new Tagify(input, {
			        whitelist:whitelist,
			        maxTags: 1,
			        dropdown: {
			          maxItems: 20,          
			          classname: "tags-look", 
			          enabled: 0,            
			          closeOnSelect: true   
			        }
			      })
			  
  		}else if($("tag").attr('title')=="Woodwinds" && $("#detail").attr("data-boolean") == 'false'){
  			
			 $("#detail").attr("data-boolean","true")
			
			  var input = document.querySelector('input[name="detail"]');
			  var whitelist = ["Flute","Harmonica","Clarinet"];
			  var tagify = new Tagify(input, {
			        whitelist:whitelist,
			        maxTags: 1,
			        dropdown: {
			          maxItems: 20,          
			          classname: "tags-look", 
			          enabled: 0,            
			          closeOnSelect: true   
			        }
			      })
  		}else if($("tag").attr('title')=="Gutiar" && $("#detail").attr("data-boolean") == 'false'){
  			
			 $("#detail").attr("data-boolean","true")
			
			  var input = document.querySelector('input[name="detail"]');
			  var whitelist = ["Electric","Acoustic","Clean","Dist","Lead","Rhythm","Melody","Riff"];
			  var tagify = new Tagify(input, {
			        whitelist:whitelist,
			        maxTags: 1,
			        dropdown: {
			          maxItems: 20,          
			          classname: "tags-look", 
			          enabled: 0,            
			          closeOnSelect: true   
			        }
			      })
			  
 		}else if($("tag").attr('title')=="Bass" && $("#detail").attr("data-boolean") == 'false'){
  			
			 $("#detail").attr("data-boolean","true")
			
			  var input = document.querySelector('input[name="detail"]');
			  var whitelist = ["Synth","Analog","Acoustic","Electric"];
			  var tagify = new Tagify(input, {
			        whitelist:whitelist,
			        maxTags: 1,
			        dropdown: {
			          maxItems: 20,          
			          classname: "tags-look", 
			          enabled: 0,            
			          closeOnSelect: true   
			        }
			      })
			  
		}else if($("tag").attr('title')=="String" && $("#detail").attr("data-boolean") == 'false'){
  			
			 $("#detail").attr("data-boolean","true")
			
			  var input = document.querySelector('input[name="detail"]');
			  var whitelist = ["Violin","Cello","Viola","Contrabass","Orchestral","Synth","StringPad","Staccato","Pizzicato"];
			  var tagify = new Tagify(input, {
			        whitelist:whitelist,
			        maxTags: 1,
			        dropdown: {
			          maxItems: 20,          
			          classname: "tags-look", 
			          enabled: 0,            
			          closeOnSelect: true   
			        }
			      })
		}

  		
  	})

  	 
  	 </script>
  	 </div>
  	 
  	 <div class="genre">
  	 
	  <label>Genre</label>
	  <input name='genre' class='some_class_name' placeholder='장르를 선택해주세요!' >
	  
	  <script>
	  var input = document.querySelector('input[name="genre"]');
	
	  var whitelist = ["None","Trap", "R&B", "Soul", "Boombap", "Rock", "Jazz", "House", "Heavy Metal", "Funk", "Reggae", "Folk", "Electro", "House", "Disco", "Pop", "EDM", "Tropical House", "Drum and Bass", "Jungle"];
	 
	  tagify = new Tagify (input, {
	      whitelist:whitelist,
	      maxTags: 1,
	      dropdown: {
	        maxItems: 20,          
	        classname: "tags-look", 
	        enabled: 0,            
	        closeOnSelect: true   
	      }
	    })
	  </script>
  	  </div>

  	<div class="scape">
    <label>Scape</label>
  	 <input name='scape' class='some_class_name' placeholder='분위기를 선택해주세요!'>
	  <script>
	  var input = document.querySelector('input[name="scape"]');
	
	  var whitelist = ["None","Wet", "Dry", "Powerful", "Soul", "Beautiful"];
	
	  var tagify = new Tagify(input, {
	        whitelist:whitelist,
	        maxTags: 1,
	        dropdown: {
	          maxItems: 20,          
	          classname: "tags-look", 
	          enabled: 0,            
	          closeOnSelect: true   
	        }
	      })
	  </script>
  </div>
  
  <div class="fx">
      <label>Fx</label>
  	 <input name='fx' class='some_class_name' placeholder='Fx를 선택해주세요!'>
	  <script>
	  var input = document.querySelector('input[name="fx"]');
	
	  var whitelist = ["None","Ambience", "Transportation", "Science Fiction", "Animal"];
	
	  var tagify = new Tagify(input, {
	        whitelist:whitelist,
	        maxTags: 1,
	        dropdown: {
	          maxItems: 20,          
	          classname: "tags-look", 
	          enabled: 0,            
	          closeOnSelect: true   
	        }
	      })
	  </script>
	</div>
	
	</div>
	
</div> <!-- container -->



<!-- mb 마진바텀 -->
<div class="inputfile">
<div >
이미지파일
<input type="file" id="imgfile" name="imgfile" class="form-control" style="width: 237px;">
</div>
<div>
음원파일 
<input type="file" id="file" name="file" class="form-control">
</div>

</div>



<div class="text-center">
	<button id="btnWrite" class="upload">Upload</button>
			<input type="reset" id="cancel" class="cancel" value="Cancel">
</div>
</form>
</div>
</div>
	
	
	</c:when>
	
</c:choose>





</body>
</html>