<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="../layout/header.jsp"/>   

<style type="text/css">

#CreditStatus{
	width : 800px;
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
}

#MyCreditAmount {
	border : 1px solid gray;
    display: inline-block;
}
</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<!--  코드 완성되면 지울 내용들 ↓ -->
전체 내역 조회만 구현해놨음<br>
선택 삭제 및 충전/사용/수익/환전 에 따른 필터 구현해야함<br>
회원등급 : <c:if test="${grade eq '0'}"><c:out value="일반회원" /></c:if>
<c:if test="${grade eq '1'}"><c:out value="사운드디자이너 회원" /></c:if>
<!--  코드 완성되면 지울 내용들 ↑ -->


<!--  회원의 크레딧 상태 보여주는 공간-->
<div id="CreditStatus">

	<!--  회원의 현재 크레딧 잔액 보여주기 -->	
	<div id="MyCreditAmount">
		<span>보유한 크레딧 : ${creditAcc } </span>
		<a href="./charge"><button id="chargeCredit" class="charge-button">충전하기</button></a>
	</div>
	
	
	<!--  회원 등급 0 or 1인지에 따라 visible hidden 처리 조건문 -->
	<!--  일반회원일 경우 : 환전버튼 hidden -->
	<c:if test="${grade eq '0'}">
	    <a href="./exchange"><button id="exchangeCredit" class="exchange-button" hidden="hidden"><c:out value="환전하기" /></button></a>
	</c:if>
	
	
	<!--  사운드디자이너일 경우 : 환전버튼 visible -->
	<c:if test="${grade eq '1'}">
	
		<!--  환전크레딧조건 충족 시 : 환전버튼 active -->
		<c:if test="${creditAcc >= 100}"><a href="./exchange">
			<button id="exchangeCredit" class="exchange-button"><c:out value="환전하기" /></button></a>
		</c:if>
		<!--  환전크레딧조건 불충족 시 : 환전버튼 disabled -->
		<c:if test="${creditAcc < 100}">
			<a href="./exchange"><button id="exchangeCredit" class="exchange-button" disabled><c:out value="환전하기" /></button></a>
		</c:if>
		
	<!--  일단은 100크레딧(1,000원) 이상일 때 환전 가능하다고 가상 제약조건 가정할거임 -->
	</c:if>
</div> <!--  CreditStatus 끝 -->


<!--  내역 조회 -->
<section id = "creditContent">

	<div>	
		<label for="allCheck">전체 선택</label>
		<button type="button" class="selectDelete_btn">선택 삭제</button>
	</div>
	
	<!--  테이블 내용 -->
	<div id="order">
		<table class="table">

		  <!--  테이블 헤드라인 -->
		  <thead class="table-light">
		    <tr>
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" data-deal-no="${i.dealNo}" id="flexCheckDefault" name="allCheck" >
				  <label class="form-check-label" for="flexCheckDefault"></label>
			  		
			  		<!--  전체선택 클릭에 대한 이벤트 -->
			  		<script>
					$("#flexCheckDefault").click(function(){
						 var chk = $("#flexCheckDefault").prop("checked");
						 if(chk) {
						  $(".form-check-input").prop("checked", true);
						 } else {
						  $(".form-check-input").prop("checked", false);
						 }
					});
					</script>
				</div>
		      </th>
		      <th scope="col">사용일자</th>
		      <th scope="col">내역</th>
		      <th scope="col">금액</th>
		      <th scope="col">delete</th>
		    </tr>
		  </thead>
		  
		  
		  <!--  테이블 데이터 -->
		  <c:forEach var="i" items="${list}">
		  <tbody>
				<tr class="cart-item"><!--  첫번째 열 시작-->
					<td><!--  1. 체크박스 -->
						<div class="checkBox">
						  <input class="form-check-input chBox" type="checkbox" name="chBox" data-deal-no="${i.dealNo}">
						  
						  <!--  항목선택 클릭에 대한 이벤트 -->
					  		<script>
							$(".chBox").click(function(){
								  $("#flexCheckDefault").prop("checked", false);
							});
							</script>
						</div>
				 	</td>
	
					<td><!--  2. 사용일자 -->
						<span>${i.dealDate}</span>
					</td>
					
					<td><!--  4. 내용 -->	  	  
						<c:if test="${i.dealCategory eq '1'}"><c:out value="크레딧 충전" /></c:if>
				  		<c:if test="${i.dealCategory eq '2'}"><c:out value="음원 구매" /></c:if>
						<c:if test="${i.dealCategory eq '3'}"><c:out value="음원 수익" /></c:if>
						<c:if test="${i.dealCategory eq '4'}"><c:out value="크레딧 환전" /></c:if>
					</td>
					
					<td><!--  5. 금액 -->
						<span>${i.amount} Credit</span>
					</td>
					
					<td class="popup"><!--  6. delete -->
						<img data-deal-no='${i.dealNo}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20">
							<!--  삭제 완료 후 떴다 사라지는 메시지 -->
							<!--  html 미완성 -->
							<!--  script 미완성 -->
							<script>
							/*  장바구니 항목 삭제 시 ajax 구현 */
							$(document).on('click', '.delete-button', function() {
								var cartNo = $(this).data('cart-no');
								var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
								console.log(cartNo);
								console.log($cartItem);
								
								$.ajax({
									url: "/credit/delete",
									type: "GET",
									data: { cartNo: cartNo },
									success: function(response) {
										console.log("ajax 성공");
										console.log(cartNo);
												                    
										$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
									},
									error: function() {
										console.log("AJAX 실패")
									}
								});
							});
							/*  하지만 전체 선택 및 부분 선택하여 삭제하는 기능은 미정 ... 수정해야함 !*/						
							</script>
								
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach><!--  반복되는 항목들 end-->
			
		</table><!--  orderTable End-->

		
	</div>
</section> <!--  creditContent 끝 -->	
<c:import url ="../layout/footer.jsp"/>