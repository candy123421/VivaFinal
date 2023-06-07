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
	$("form").submit(function(){
		
		//이벤트 처리 중단 ->submit은 동작함
// 		return 
		
		//이벤트 처리 중단 ->submit도 중단한다
// 		return false

		//-----------------------------------
		//유효성 검증 결과에 따라 submit 중단
		if(!validate() ){
			
			console.log("submit 중단")
			return false
		}
		
		//submit을 진행한다
		console.log("submit 진행")
		alret(2)
	})
	
	//유효성 검증 에러 메시지 초기화
	
	$("#bpm").focus(function(){
		$("#bpm_msg").html("focus메세지")
	})
	
	$("#bpm").blur(function(){
		if($("#bpm").val()==""){
			$("#bpmd_msg").html("blur메세지 ")
			
		}
	})
})

//input데이터의 유효성검증
function validate(){
	
	//id유효성 검증
	//아이디를 입력했는지 검증
	if($("#bpm").val()==''){
// 		alert('아이디를 입력하세요')
		$("#bpm_msg").html("필수 입력 항목입니다")
		
		return false
	}
	
	//패스워드 입력값 검증 

	var bpmReg=/^(?:[1-9]|[1-9][0-9]|[12][0-9]{2}|300)$/g
	
	if(!bpmReg.test($("#bpm").val())){
		$("#bpm_msg").html("숫자 1부터 300까지가능합니다")
		return false;
	}
	
	//유효성 검증성공(submit 수행)
	return true
	
}

</script>


<style type="text/css">
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
	width: 400px;
	}
	#key{
	display: inline-block;
	width: 505px;
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
	grid-template-columns: 50% 50%;
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
	grid-template-columns: 20% 20%;
	margin-left: 0px;
	}
	

	
/* ------------------------------------------------ */
	 .tagify{    
  width: 400px;
  border-radius: 10px;
  margin-right: 0px;
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
<div class=body>
<!-- container : div안에있는것들 다 가운데 -->
<div id="containerid" class="container" >
<h2> 자신만의 Source로 세상을 움직여주세요!</h2>
<hr>
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br>



<form action="/file/fileupsource" method="post" enctype="multipart/form-data">


<div id="container" >
	
	
	
	<div class="item">
	
		<label>Name</label>
		<input type="text" id="sourceName" name="sourceName" class="form-control" placeholder="Source Name을 써주세요!"> <br>
		<span id="sourceName_msg" class="msg"></span>
		<br>
		
		<label>Key</label>
		<input type="text" id="key" name="key" class="form-control" placeholder="Key를 입력해주세요!"><br>
		<span id="key_msg" class="msg"></span>
		<br>
		
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
  <label>장르</label>
  	 <input name='genre' class='some_class_name' placeholder='장르를 선택해주세요!' >
  <script>
  

  
//   var input = document.querySelector('input[name="genre"]');
  var inputElm = document.querySelector('input[name="genre"]');

  var whitelist = ["Trap", "R&B", "Soul", "boombap", "Rock", "Jazz", "House", "Heavy Metal", "Funk", "Reggae", "Folk", "Electro", "House", "Disco", "Pop", "EDM", "Tropical House", "Drum and Bass", "Jungle"];

//   var tagify = new Tagify(input, {
//         whitelist:whitelist,
//         maxTags: 1,
//         dropdown: {
//           maxItems: 20,          
//           classname: "tags-look", 
//           enabled: 0,            
//           closeOnSelect: true   
//         }
//       })
  
  
//   var tagify = new Tagify(input, {
// 	  whitelist:whitelist,
//       maxTags: 1,
//       dropdown: {
//         maxItems: 20,          
//         classname: "tags-look", 
//         enabled: 0,            
//         closeOnSelect: true   
//       }
// // 	  originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
// 	})
 
  tagify = new Tagify (inputElm, {
      whitelist:whitelist,
      maxTags: 1,
      dropdown: {
        maxItems: 20,          
        classname: "tags-look", 
        enabled: 0,            
        closeOnSelect: true   
      }
    })

	inputElm.addEventListener('change', onChange)
	
	function onChange(e){
	// outputs a String
	console.log(e.target.value)
	}

  
  </script>
 
  
  
  <label>악기</label>
  	 <input name='instrument' class='some_class_name' placeholder='악기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="instrument"]');

  var whitelist = ["Drum", "Vocal", "Synth", "Brass", "Woodwinds", "Guitar", "Bass", "String", "ABSET", "Piano"];

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
  
    <label class="detail" style="width: 500px;">악기세부분류</label>
  	 <input name='detail' class='some_class_name' placeholder='세부악기를 선택해주세요!'>
  <script>
//   if($('input[name="instrument"]').val()=="Drum"){
	  
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
  
//   }

  </script>
  

  
    <label>분위기</label>
  	 <input name='scape' class='some_class_name' placeholder='분위기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="scape"]');

  var whitelist = ["Wet", "Dry", "Powerful", "Soul", "Beautiful"];

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
  
      <label>Fx</label>
  	 <input name='fx' class='some_class_name' placeholder='Fx를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="fx"]');

  var whitelist = ["Ambience", "Transportation", "Science Fiction", "Animal"];

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
	<button id="btnWrite" class="btn btn-outline-secondary">Upload</button>
	<button id="btnCancel" class="btn btn-outline-danger">Cancel</button>
</div>
</form>
</div>
</div>

</body>
</html>