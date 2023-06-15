<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>   
<!--  누적 금액을 누르기도 전에 'ㅇㅇ원'이라는 글자가 나온다. 이걸 처리해야한다.. -->



<!-- 토스페이먼츠 결제위젯 연동하기 -->
<!-- <script src="https://js.tosspayments.com/v1/payment-widget"></script> -->
<script src="https://js.tosspayments.com/v1/payment"></script>



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

	background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 10px;
    margin: 0 0px 0px 204px;
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
    margin-left: 205px;
}

/*  ========================================================= */


.button-area {	/*  금액 버튼 공간 */
	width: 778px;
	margin: 0 auto;
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
    margin-left: 13px;
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
.method-btn {	/*  결제방식 버튼 */
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
    margin-left: 13px;
    margin-top: 22px;
}
.method-btn:hover{
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
.clicked_menu{ /*클릭 시 적용되는 style 속성*/
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

/*  =================================================  */
#cash_result{
	display: inline-block;
    width: 150px;
    text-align: end;
    margin-left: 461px;
    font-weight: 700;
}
#real_cash {
    padding-top: 15px;
    font-size: 20px;
}

#credit_result{
	display: inline-block;
    width: 150px;
    text-align: end;
    margin-left: 461px;
    font-weight: 700;
}
#after_credit {
    font-size: 20px;
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
   Credit ${grade }
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<section class="charge_wrap">
	<div id="charge_amount_section">
		<div class="title">충전금액</div>
		
		<div class="ChargeAmountChoose">
			<h3>충전금액을 눌러주세요</h3>
		</div>
		<label style="padding: 0px 6px 0px 21px; font-size: 34px;">Credit</label><img data-deal-no='${i.dealNo}' class="delete-button" alt="지우기" src="../resources/icon/X.png" width="25">
		
		<div id="real_cash">	<!--  실제 결제될 금액 -->
			<div id="cash_result" value="0"></div>
		</div>
		<div id="after_credit">	<!--  충전된 후 크레딧 -->
			<div id="credit_result" value="0"></div>
		</div>
		
		<div class="button-area">
			<button class="choose-btn" id="1000credit" data-amount="1000">+ 1000 Credit</button>
			<button class="choose-btn" id="5000credit" data-amount="5000">+ 5000 Credit</button>
			<button class="choose-btn" id="10000credit" data-amount="10000">+ 10000 Credit</button>
		</div>

		<div class="button-area">
			<button class="method-btn" id="card" value="card" >카드</button>
			<button class="method-btn" id="phone" value="phone">휴대폰</button>
			<button class="method-btn" id="transfer" value="transfer">계좌이체</button>
		</div>
		
	</div>
	
	<!-- 결제위젯, 이용약관 영역 -->
	<div id="payment-method"></div>
	<div id="agreement"></div>
	
	<div id="charge_last_button"><button id="payment-button">결제하기</button></div>
	
	<script>
 	var sum = 0;	//크레딧 합계
    var cash = 0;	//실제금액 합계
    var future = 0; //충전 후 크레딧 총계
    var method;		//결제 방식 
    var name;	//주문자 이름
    var email;	//주문자 이메일
    
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
			    
			    /*  실제 금액의 콤마 찍어주기 */
				/*  3번째 자리에 콤마 찍기 */
				var money2 = cash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				console.log(money2)
			    $("#cash_result").html(money2 + " 원");
	
				/*  충전된 이후의 예상 크레딧 */
				future = sum + ${creditAcc}
				console.log("what? : ",${creditAcc})
				console.log(future)
				/*  충전후 크레딧을 보여주기 */
				$("#credit_result").html(future + " credit");
				
			    // <button> 태그의 페이지 이동(기본 동작) 막기
			    return cash;
		  })
		  
		  /*  ======= 결제방식 눌렀을 경우 ======== */
		  /* 결제방식 버튼 각각에게 함수를 움직이게 해준 것 */
		  /*  이 과정을 거치면, html 코드에 menu-index 라는 속성을 부여해줄 수 있다. 0,1,2 */
			$('.method-btn').each(function(index){
				$(this).attr('menu-index', index);
				
			/*  위의 설정을 다 거치고 클릭을 해주면 아래의 코드가 실행된다. */	
			}).click(function(){
				 console.log("결제수단 클릭!!!!()")
				 console.log($(this).attr('menu-index'))
				 
				 method = $(this).attr('value')
			  	 console.log(method);
				 
				/*클릭된 <div>의 menu-index 값을 index 변수에 할당한다.*/
			    var index = $(this).attr('menu-index');
				console.log(index)
			    /*클릭한 <div>에  clicked_menu 클래스 추가*/
				$('.method-btn[menu-index=' + index + ']').addClass('clicked_menu'); 
			    /*그 외 <div>는  clicked_menu 클래스 삭제*/
				$('.method-btn[menu-index!=' + index + ']').removeClass('clicked_menu');
			});
		  
		  
		  // X표 눌렀을 경우 
		  $(".delete-button").click(function() {
		    console.log("금액초기화()")

		    
		    // 누적값과 .ChargeAmountChoose 객체 초기화
		    sum = 0;
		    $(".ChargeAmountChoose").html("<h3>충전금액을 눌러주세요</h3>");
		    $("#cash_result").html('');
		    $("#credit_result").html('');
		    

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
			
		    var	payment=0;	//
		    
			//ajax 로 해당 url 에 데이터 전송하기
			$.ajax({
				url : "/credit/toss",
				type : "post",
				data: {cash : cash, method: method}, 
				dataType: "json",
				success: function(res) {
					
					console.log("ajax 성공");
					console.log(res)
					console.log(res.cash)
					payment = res.cash;
					method = res.method;
					name = res.name;
					email = res.email;
					
					console.log("?", cash)
					console.log("??", method)
					console.log("???", name)
					console.log("????", email)
// 					console.log(payment)
					
					<!--  결제위젯 연동하기 페이지 보면서 다시 해보기 -->
					   //* API키 준비하기 
					   //토스페이먼츠랑 계약하지않았으면 아래의 키로 써야한다.
					   // const clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
					   // const secretKey = 'test_sk_zXLkKEypNArWmo50nX3lmeaxYG5R'

					   //* 1. 결제위젯 그리기
					   const clientKey = 'test_ck_oeqRGgYO1r5XDApxvq1VQnN2Eyaz'
					   const customerKey = "NuP2QXfUsVFhfP5_UWzOI" // 내 상점의 고객을 식별하는 고유한 키
// 					   const button = document.getElementById("payment-button")
					   
					   // ------  결제위젯 초기화 ------ 
					   // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
					   const tossPayments = TossPayments(clientKey, customerKey) // 회원 결제
					   // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
					   
					   
					   // ------  결제위젯 렌더링 ------ 
					   // 결제위젯이 렌더링될 DOM 요소를 지정하는 CSS 선택자 및 결제 금액을 넣어주세요. 
					   // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
// 					   paymentWidget.renderPaymentMethods("#payment-method", { value: payment })
					   
					   // ------  이용약관 렌더링 ------
					    // 이용약관이 렌더링될 DOM 요소를 지정하는 CSS 선택자를 넣어주세요.
					    // https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
// 					    paymentWidget.renderAgreement('#agreement')
					    
					    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
					    // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
					    // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
					      tossPayments.requestPayment(method, { //(카드, 계좌이체, 가상계좌, 휴대폰 등)
					    	amount : payment,
					        orderId: "${id}",            // uuid 난수로 컨트롤러에서 받아옴
					        orderName: "크레딧 충전",                 // 주문명
					        successUrl: 'http://localhost:8888/credit/charging',    // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
					     	failUrl: 'http://localhost:8888/credit/fail',         // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
					        customerEmail: email,
					        customerName: name
					      })
					}
					,error: function () {
						console.log("AJAX fail")
					}
				
			});
		    
		 });
	
</script>
	


</section>
<c:import url ="../layout/footer.jsp"/>