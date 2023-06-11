<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>   
<!--  누적 금액을 누르기도 전에 'ㅇㅇ원'이라는 글자가 나온다. 이걸 처리해야한다.. -->



<!-- 토스페이먼츠 결제위젯 연동하기 -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>



<style type= "text/css">
.charge_wrap {
	width : 1400px;
	margin : 0 auto;
}
.ChargeAmountChoose {	/*  금액이 보이는 칸 */
	height : 100px;
	display : inline-block;
	width : 428px;
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
    font-weight : 700;
    display: inline-block;
    vertical-align: middle;
    padding-top: 32px;
    margin-right: 15px;
    
/*     width: 538px; */
/* 	height: 107px; */

	background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 10px;
}

#charge_amount_section {
	width : 1200px;
	margin : 0 auto;
	padding: 24px 24px 24px 24px;

}

.title{		/*  충전금액 헤드라인 */
    font-size: 20px;
    font-weight: 700;
    color: #333d4b;
    width: 80px;
    margin-bottom: 20px;
}

/*  ========================================================= */


#button-area {
	width : 989px;
	margin : 0 atuo;
}
.choose-btn {	/*  금액 버튼 */
	box-sizing: border-box;
	
    width: 230px;
    height: 52px;
	
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 27px;
	
	margin-bottom: 15px;
	color: #7D7A7A;
	font-weight: 600;
    font-size: 25px;
    margin-right: 13px;
    margin-top: 22px;
}
.choose-btn:hover{
	box-sizing: border-box;
	
    width: 230px;
    height: 52px;

	background: #000000;
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 27px;
	margin-bottom: 15px;
	color: #FFFFFF;
	font-weight: 600;
    font-size: 25px;
    margin-right: 13px;
    margin-top: 22px;
	
}
.delete-button {
	cursor : pointer;
	margin-left : 20px;
}
#cash_result{
	display: inline-block;
    width: 150px;
    text-align: end;
    margin-left: 254px;
}
#real_cash {
    padding-top: 15px;
    font-size: 20px;
}
span {
    position: absolute;
    left: 920px;
    margin-left: 10px;
}
/*  ============================================= */
#payment-method, #agreement{
	width : 1200px;
	    margin-inline: auto;
}

#payment-button{	/*  결제하기 버튼 */
	background: linear-gradient(195.21deg, #514C9C -15.38%, #653A99 -1.72%, #683287 12.65%, #783487 27.7%, rgba(124, 45, 121, 0.95) 46.93%, #78377F 69.15%, #814A7D 80.49%, #8E4669 91.96%, #8E5D7A 99.28%);
	border-radius: 60px;
	border: none;
    width: 379px;
    height: 59px;
    color: white;
    font-size: 28px;
    letter-spacing: 0.1em;
    margin: 0 auto;
}
#charge_last_button {	/*  결제하기 버튼을 감싸는 div */
    width: 380px;
    margin: 0 auto;
}
</style>

<!--  금액 선택에 대한 이벤트 처리 -->
<script type="text/javascript">

</script>


<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<section class="charge_wrap">
	<div id="charge_amount_section">
		<div class="title">충전금액</div>
		
		<div class="ChargeAmountChoose">
		<%-- <input id="chooseAmount" name="chooseAmount"  placeholder="금액을 선택해주세요." type="text" readonly><label>Credit</label><img data-deal-no='${i.dealNo}' class="delete-button" alt="지우기" src="../resources/icon/X.png" width="20"> --%>
			<h3>충전금액을 눌러주세요</h3>
		</div>
		<label>Credit</label><img data-deal-no='${i.dealNo}' class="delete-button" alt="지우기" src="../resources/icon/X.png" width="25">
		
		<div id="real_cash">
			<div id="cash_result" value="0"></div><span>원</span>
		</div>

		<div id="button-area">
		<!--  버튼의 클릭이 누적될 때마다 (0 + data-amount) 이 되어야하지않을까? -->
			<button class="choose-btn" id="100credit" data-amount="100">+ 100 Credit</button>
			<button class="choose-btn" id="1000credit" data-amount="1000">+ 1000 Credit</button>
			<button class="choose-btn" id="5000credit" data-amount="5000">+ 5000 Credit</button>
			<button class="choose-btn" id="10000credit" data-amount="10000">+ 10000 Credit</button>
		</div>
	</div>
	
	<!-- 결제위젯, 이용약관 영역 -->
	<div id="payment-method"></div>
	<div id="agreement"></div>
	
	<div id="charge_last_button"><button id="payment-button">결제하기</button></div>
	
	<script>
	  var sum = 0;
	  var cash = 0;
	$(function() {
		  // 누적값을 저장할 변수 <- 외부에서 선언함으로써, 누적값이 계속 유지되고 업데이트됨.
		  // 충전금액 <button> 태그가 클릭되었을 때
		  $(".choose-btn").click(function(e) {
		    console.log("clicked!!!!()")

		    // 클릭한 버튼의 데이터 값을 가져와서 누적값에 더함
		    var tCount = Number($(this).attr("data-amount"));
		    sum += tCount;

		    // 누적값을 .ChargeAmountChoose 객체에 반영
		    $(".ChargeAmountChoose").html(sum);

		    /*  누적크레딧에 대한 실제 환산 금액 */
		   	cash = (10 * sum);
		    console.log(cash);
		    $("#cash_result").html(cash);

		    // <button> 태그의 페이지 이동(기본 동작) 막기
		    return cash;
		  })
			console.log("cash:",cash);
		  // X표 눌렀을 경우
		  $(".delete-button").click(function() {
		    console.log("금액초기화()")

		    // 누적값과 .ChargeAmountChoose 객체 초기화
		    sum = 0;
		    $(".ChargeAmountChoose").html("<h3>충전금액을 눌러주세요</h3>");
		    $("#cash_result").html('');

		    // <button> 태그의 페이지 이동(기본 동작) 막기
		    return false;
		  })
	})
	/*  숫자를 ajax 를 통해 보내도 컨트롤러에서 답이 없던 이유? */
	/*  Ajax를 통해 데이터를 전달할 때, 일반적으로는 문자열 형태로 데이터를 전송하기 때문!  */

	// 	기본적으로 jQuery Ajax에서는 데이터를 JSON 형식으로 전송하도록 설정되어 있기 때문에, 
	// 	컨트롤러에서 @RequestParam 어노테이션을 사용하여 데이터를 받으려면 
	// 	JSON 형식의 데이터를 정확히 처리해야 한다.
	
	</script>	
	<script>	
	$(document).on('click', '#payment-button', function() {
		    console.log("결제하기 clicked!!!!()")  
		    console.log("cash : ", cash)
			
		    var	payment=0;
		    var obj;
			//ajax 로 해당 url 에 데이터 전송하기
			$.ajax({
				url : "/credit/toss",
				type : "post",
				data: {cash : cash} , 
				success: function(result) {
					console.log("ajax 성공");
					console.log(result)
					
					
				}
				
			});
		    
		 });
	
</script>
	


</section>
<c:import url ="../layout/footer.jsp"/>