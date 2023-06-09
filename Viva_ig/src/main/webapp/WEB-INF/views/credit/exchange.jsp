<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>   

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type= "text/css">
/*  전체에 대한 중앙정렬 */
.exchange_wrap {
	width : 1400px;
	margin : 0 auto;
}
/*  상단 '환전 크레딧'에 대한 설정 */
.exchange_title {
	margin: 0 auto;
    width: 600px;
    font-size: 40px;
    padding-top: 30px;
    padding-bottom: 90px;
    font-weight: 600; 
}

/*  입력 부분에 대한 설정 */
.exchange_info {
	width : 600px;
	margin : 0 auto;
 	font-size: 25px;
 	margin-bottom: 50px;
}
.exchange_info div{
	text-align: -webkit-center;
}

/*  input 입력창에 대한 설정 */
.exchange_input {
	border : none;
    width: 300px;
    height: 50px;
    left : 50px
}
.exchange_info hr {
	margin: 0 auto;
}
/*  고정된 텍스트 */
.exchange_info label {
    margin-right: 125px;
}
/*  지우기 버튼 */
.delete-button img{
	width: 25px;
	cursor: pointer;
}
input:focus {outline: none;} 

.exchange_info button {
    width: 600px;
    height : 50px;
    border : none;
    background: linear-gradient(195.21deg, #514C9C -15.38%, #653A99 -1.72%, #683287 12.65%, #783487 27.7%, rgba(124, 45, 121, 0.95) 46.93%, #78377F 69.15%, #814A7D 80.49%, #8E4669 91.96%, #8E5D7A 99.28%);
	border-radius: 10px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.29em;
	color : white;
}
</style>

<script type="text/javascript">
$(function(){
	$(".delete-button").click(function(){
		console.log("금액초기화()")
		
		//사용하고자 하는 함수
		clearInput();
		
	});
});	

function clearInput(){
	console.log("clearInput()")
	
	/* 텍스트박스 지우는 부분 */
	var input = $(".exchange_input") // jQuery 
	
	for(var i=0; i<input.length; i++){
		input[i].value = '';
	}
}
</script>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="/resources/icon/Line.svg">
</div>

<div class="exchange_wrap"><!--  width : 1400 -->
	<div class="exchange_title">환전크레딧</div><!--  width : 600 -->
	
	
	<form action="./exchangeOk" method="post">
		<div class="exchange_info"><!--  width : 600 -->
			<div><!--  width : 600-->
			<input id="exchange_inputAmount" class="exchange_input"name="exchange_inputAmount"  placeholder="금액을 입력해주세요." type="text" ><label>credit</label><img class="delete-button" alt="지우기" src="../resources/icon/X.png" width="20" style="cursor:pointer">
			</div>
			<hr>
		</div>
	
		<div class="exchange_info"><!--  width : 600 -->
			<div><!--  width : 600-->
				
				<select name="account_bank_id">
		            <option value="">은행명을 선택하세요</option>
		            <option value="35">경남은행</option>
		            <option value="29">광주은행</option>
		            <option value="7">국민은행</option>
		            <option value="5">기업은행</option>
		            <option value="15">농협중앙회</option>
		            <option value="17">농협회원조합</option>
		            <option value="25">대구은행</option>
		            <option value="47">도이치은행</option>
		            <option value="27">부산은행</option>
		            <option value="3">산업은행</option>
		            <option value="41">상호저축은행</option>
		            <option value="37">새마을금고</option>
		            <option value="11">수협중앙회</option>
		            <option value="36">신한금융투자</option>
		            <option value="60">신한은행</option>
		            <option value="39">신협중앙회</option>
		            <option value="9">외환은행</option>
		            <option value="19">우리은행</option>
		            <option value="56">우체국</option>
		            <option value="33">전북은행</option>
		            <option value="31">제주은행</option>
		            <option value="68">카카오뱅크</option>
		            <option value="67">케이뱅크</option>
		            <option value="59">하나은행</option>
		            <option value="23">한국씨티은행</option>
		            <option value="45">HSBC은행</option>
		            <option value="21">SC제일은행</option>
				</select>
				<input id="exchange_transfer" class="exchange_input"name="exchange_transfer"  placeholder="계좌번호를 입력해주세요." type="text" ><img class="delete-button" data-no="2" alt="지우기" src="../resources/icon/X.png" width="20" style="cursor:pointer">
			</div>
			<hr>
		</div>
		
		<div class="exchange_info"><!--  width : 600 -->
			<div><!--  width : 600-->
				<input id="exchange_name" class="exchange_input"name="exchange_name"  placeholder="예금주를 입력해주세요." type="text" ><img class="delete-button" data-no="3" alt="지우기" src="../resources/icon/X.png" width="20" style="cursor:pointer">
			</div>
			<hr>
		</div>
		<div class="exchange_info"><!--  width : 600 -->
			<button>환전하기</button>
		</div>
	</form>
	
	
</div>
<c:import url ="../layout/footer.jsp"/>