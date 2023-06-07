<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../layout/header.jsp"/>   

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<!-- iamport.payment.js -->
<!-- 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->
	 
	<!-- 토스페이먼츠 api -->
	 <script src="https://js.tosspayments.com/v1/payment"></script>

<style type= "text/css">
.ChargeAmountChoose {
	height : 100px;
	display : inline-block;
	width : 300px;
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
    display: inline-block;
    border : 1px solid gray;
    vertical-align: middle;

}
</style>

<!--  금액 선택에 대한 이벤트 처리 -->
<script type="text/javascript">
$(function() {
	
	//충전금액<button>태그가 클릭되었을 때
	$(".choose-btn").click(function() {
		console.log("clicked!!!!()")
		
		// button태그의 data-amount속성의 데이터(HTML)를 .ChargeAmountChoose 객체에 반영한다
		$(".ChargeAmountChoose").html( $(this).attr("data-amount") )
		
		//<button>태그의 페이지 이동(기본 동작) 막기
		return false;
	})
	
	//X표 눌렀을 경우
	$(".delete-button").click(function() {
		console.log("금액초기화()")
		
		// button태그의 data-amount속성의 데이터(HTML)를 .ChargeAmountChoose 객체에 반영한다
		$(".ChargeAmountChoose").html("<h3>충전금액을 눌러주세요</h3>")
		
		//<button>태그의 페이지 이동(기본 동작) 막기
		return false;
	})
	
})
</script>

<!-- ================================================================ -->

<!--  토스페이먼츠 테스트 연동해서 시도해본 코드임 -->
<script>
<!-- // /* API키 ) 테스트 클라이언트 키 (외부에 노출되면 안된다고함...) */ -->
var clientKey = 'test_ck_oeqRGgYO1r5XDApxvq1VQnN2Eyaz' // 상점을 특정하는 키
var tossPayments = TossPayments(clientKey)
console.log(clientKey); 
 	console.log(tossPayments); 
	
<!-- // /*  '결제하기' 버튼 누르면 뜨는 결제창 function*/ -->
$(document).on('click', '#payment-button', function() { 
	console.log("토스 클릭!!!!!") 
  
//  	var $button = document.getElementById('payment-button') // 결제하기 버튼 

//  	button.addEventListener('click', function () { 
 		tossPayments.requestPayment('카드', { 
 			amount: 15000, 
 			orderId: 'L84sqOnguyAQ4rZYlAfl4', 
 			orderName: '크레딧 충전', 
			customerName: '지또닝', 
			successUrl: 'http://localhost:8888/credit/success', 
 			failUrl: 'http://localhost:8888/credit/fail'
 		})
//  	}) 
}); 
</script> 

<!-- ================================================================ -->

<!--  토스 블로그 보고 시도해본 30분안에 결제 페이지 개발하기 코드임 -->
<!-- <script> -->
<!-- //   const clientKey = 'test_ck_oeqRGgYO1r5XDApxvq1VQnN2Eyaz' // 상점을 특정하는 키 -->
<!-- //   const customerKey = 'YbX2HuSlsC9uVJW6NMRMj' // 결제 고객을 특정하는 키 -->
<!-- //   const amount = 15_000 // 결제 금액 -->

<!-- //   /*결제위젯 영역 렌더링*/ -->
<!-- //   const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제 초기화 -->
<!-- //   // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제 초기화 -->
<!-- //   paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount) -->
  
<!-- //   /*약관 영역 렌더링*/ -->
<!-- //   const paymentAgreement = paymentWidget.renderAgreement('#agreement') -->
<!-- </script> -->



<!-- ================================================================ -->



<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<section>
<div class="title">충전금액</div>

<div class="ChargeAmountChoose">
<%-- <input id="chooseAmount" name="chooseAmount"  placeholder="금액을 선택해주세요." type="text" readonly><label>Credit</label><img data-deal-no='${i.dealNo}' class="delete-button" alt="지우기" src="../resources/icon/X.png" width="20"> --%>
	<h3>충전금액을 눌러주세요</h3>
</div>
<label>Credit</label><img data-deal-no='${i.dealNo}' class="delete-button" alt="지우기" src="../resources/icon/X.png" width="40">

<div>
<button class="choose-btn" id="100credit" data-amount="100">+100 Credit</button>
<button class="choose-btn" id="1000credit" data-amount="1000">+1000 Credit</button>
<button class="choose-btn" id="5000credit" data-amount="5000">+5000 Credit</button>
<button class="choose-btn" id="10000credit" data-amount="10000">+10000 Credit</button>
</div>

<div class="title">결제방식</div>
<div id="payment-method">
	<button onclick="requestPay1()">카드결제</button> <!-- 결제하기 버튼 생성 -->
	<button onclick="requestPay2()">계좌이체</button> <!-- 결제하기 버튼 생성 -->
	<button onclick="requestPay3()">휴대폰소액결제</button> <!-- 결제하기 버튼 생성 -->
</div>
<div id="agreement"></div>
<button id="payment-button">결제하기</button>
</section>
<c:import url ="../layout/footer.jsp"/>