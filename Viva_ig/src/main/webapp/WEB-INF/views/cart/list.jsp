<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>   


<style type="text/css">
.cart_wrap {
	width: 1400px;
	margin : 0 auto;
	font-size : 18px;
}
/*  ========================================= */
.cart_select_btn {
	padding : 10px;
}
.cart_select_btn button {
	margin-left : 10px;
	border: 3px solid transparent;
	border-radius: 27px;
	background : transparent;
	padding : 5px;
}
.cart_select_btn button:hover {
	background: transparent;
 	border: 3px solid rgba(105, 100, 100, 0.3); 
	border-radius: 27px;
	padding : 5px;
}

/*  ========================================= */
.source_price {
  width: 200px;
  margin: 100px auto;
  background: #333333b0;
}
.source_price div {
  position: relative;
  display: inline-block;
}
.source_price img {
	cursor: pointer;
	display: flex;	/*  안해도 될것 같은데... 모르겠네 */
}

/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
#explain{ 
/* 	display : none; */
  	position: absolute; 
	opacity: 0;
	width: 100px;
	padding: 8px;
	left : 0;
/* 	-webkit-border-radius: 8px;  */
/* 	-moz-border-radius: 8px;  */
	border-radius: 8px; 
	background: rgba(51, 51, 51, 0.9002);
	color: #fff;
	font-size: 17px;
	margin-top: 20px;
	margin-left : -35px;
	text-align : center;
} 
.source_price:hover #explain{ 
  opacity: 1; 
  
}

#explain:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: ' ';
  border-bottom-color: #333333b0;
}
/*  ========================================= */
.table>:not(caption)>*>* {
    padding: 1.5rem 2.5rem;
}

th {
	font-size:22px;
}
</style>
<div class="FunctionTitle">
   Cart
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>


<div class="cart_wrap"><!--  전체 구성물 -->
	
	<!--  jsp를 통해 파일 다운로드 도전! -->
	<form action="fileDownloadProc.jsp" method="post">
	
		<div class="cart_select_btn">	
			<label for="allCheck">전체선택</label>
			<button type="button" class="selectDelete_btn">선택삭제</button>
			<button type="button" class="selectBuy-btn">구매하기</button>
		</div>
	
		<!--  테이블 내용 -->
		<div id="order">
			<table class="table">
			
			  <!--  테이블 헤드라인 -->
			  <thead class="table-light">
			    <tr>
			    
			      <th scope="col">
			      	<div class="form-check">
					  <input class="form-check-input" type="checkbox" data-cart-no="${i.CART_NO}" data-source-no="${i.SOURCE_NO}" id="flexCheckDefault">
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
			      <th scope="col">pack</th>
			      <th scope="col">name</th>
			      <th scope="col">Tag</th>
			      <th scope="col">Time</th>
			      <th scope="col">Key</th>
			      <th scope="col">Bpm</th>
			      <th scope="col">buy</th>
			      <th scope="col">delete</th>
			    </tr>
			  </thead>
			  
			  <c:forEach var="i" items="${list}">
			  
			  <tbody>
					<tr class="cart-item"><!--  첫번째 행 시작-->
					
						<td><!--  1. 체크박스 -->
							<div class="checkBox">
							  <input class="form-check-input chBox" type="checkbox" name="chBox" data-cart-no='${i.CART_NO}' data-source-no='${i.SOURCE_NO}'>
								<!--  항목선택 클릭에 대한 이벤트 -->
						  		<script>
								$(".chBox").click(function(){
									  $("#flexCheckDefault").prop("checked", false);
								});
								</script>
							</div>
					 	</td>
		
						<td> <!-- 2. pack 및 소스 앨범아트 -->
							<div class="product_img">
								<!--  조건. 팩 이미지는 팩 우선. 없으면 개별 소스 이미지 찾기 -->
								<c:choose>
									<c:when test="${!empty i.PACK_IMG_STOREDNAME }">
										<a href="/source/pack?packNo=${i.PACK_NO}" ><img alt="img" src="../upload/${i.PACK_IMG_STOREDNAME }" width="50" height="50"></a>
									</c:when>
									
									<c:otherwise>
										<a href="/source/pack?packNo=${i.PACK_NO}" ><img alt="img" src="../upload/${i.SOURCE_IMG_STOREDNAME }" width="50" height="50"></a>
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						
						<td><!--  3. 음원 title -->
							<a href="/source/pack?packNo=${i.PACK_NO}" style="text-decoration-line: none; color:black;"><span id="source_title">${i.SOURCE_NAME}</span></a>
						</td>
						
						<td><!--  4. 태그 -->
						
						<!--  조건. 태그는 소스 우선 -->
							<c:choose>
								<c:when test="${!empty i.SOSURCETAG }">
									<span id="cart_tag">${i.SOURCETAG}</span>
								</c:when>
								<c:otherwise>
									<span id="cart_tag">${i.PACKTAG}</span>
								</c:otherwise>
							</c:choose>
						</td>
						
						<td><!--  5. Time -->
							<span class="timespace"></span>
						</td>
						
						<td><!--  6. Key -->
							<span>${i.KEY}</span>
						</td>
						
						<td><!--  7. Bpm -->
							<span>${i.BPM}</span>
						</td>
						
						<td class="source_price"><!--  8. 바로 구매 -->
								<div>
								<img data-source-no='${i.SOURCE_NO}' data-cart-no='${i.CART_NO}' class="buy-button" alt="구매" src="../resources/icon/plus-circle.svg" width="30">

								<!--  마우스 호버 시, 메시지 뜨는거-->
								<p id = "explain">${i.SOURCE_PRICE } credit</p> 
								</div>
						</td>
						
						<td class="popup"><!--  9. 항목 삭제 -->
							<img data-cart-no='${i.CART_NO}' data-source-no='${i.SOURCE_NO}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20" style= "cursor: pointer;">
	
									<!--  삭제 완료 후 떴다 사라지는 메시지 -->
									<!--  html 미완성 -->
									<!--  script 미완성 -->
						</td>
						
					</tr><!--  첫번째 열 End -->
				</tbody><!--  항목들 END-->
				</c:forEach><!--  반복되는 항목들 end-->
				
			</table><!--  orderTable End-->
			
			<script>
			/*  ==========선택 삭제에 대한 스크립트 ============= */
			 $('.selectDelete_btn').click(function(){
				 console.log("선택 삭제 clicked()")
			  
				//배열선언
				var checkArr = new Array();
				 
				//체크박스의 name (attr)이 체크된 상태인 항목 각각에 대한 동작
				$("input[name='chBox']:checked").each(function(){
					
					//밖에서 선언한 배열변수에 체크박스의 cartNo 요소를 추가해주며
					//추가된 배열의 길이를 반환.
					checkArr.push($(this).attr("data-cart-no"));
				});
				console.log(checkArr);
			    
				//ajax로 데이터 전달하기
				$.ajax({
			    	url : "/cart/deleteChk",
			    	type : "POST",
			    	data : { chbox : checkArr },
			    	success: function(response) {
			    	console.log("ajax 성공");
					location.href = "/cart/list";		                    
				},
				error: function() {
					console.log("AJAX 실패")
				}
				});
			});
			
			 /*  ==========선택 구매에 대한 스크립트 ============= */
			 $('.selectBuy-btn').click(function(){
				 console.log("선택항목 구매 clicked()")
				 
				//배열선언 (빈 배열)
				var checkArr = [];
			
				//체크박스의 name (attr)이 체크된 상태인 항목 각각에 대한 동작
				$("input[name='chBox']:checked").each(function(index){
					//밖에서 선언한 배열변수에 체크박스의 cartNo 요소를 추가해주며
					//추가된 배열의 길이를 반환.
					checkArr.push($(this).attr("data-source-no"));
					console.log(index)
				});
					console.log("배열", checkArr);
					console.log("배열", checkArr[0]);
			    
				//ajax로 데이터 전달하기
				$.ajax({
			    	url : "/cart/buy",
			    	type : "GET",
			    	data : { chbox : checkArr },
			    	success: function(response) {
			    	console.log("ajax 성공");
					
					console.log("응답 : ",response);
					
					if(response == 1) {
						console.log("전부 구매했었던 소스입니다.")
						reloadCartList();	//리스트 부분 리로드 하기!
						
						reloadHeaderCredit(); //헤더 크레딧 잔액 변경
						var result = confirm ("이미 구매한 항목입니다. 구매항목을 확인하시겠습니까?")
				  			
					  		if(result) {
					           //yes => 내가 받은 음원 페이지로 이동함
					            location.replace('/users/mysource');
					  		} else {
					            //no
					        }
					}
					
					if(response == 2) {
						console.log("아주 깨끗하게 산적 없는 소스들만 선택했군요!")
						reloadHeaderCredit(); //헤더 크레딧 잔액 변경
						
						//다운로드 진행..ㅠㅠ
					}
					if(response == 3) {
						console.log("잔액 부족..ㅠㅠ")
						reloadHeaderCredit(); //헤더 크레딧 잔액 변경
						
						var result = confirm ("크레딧이 부족합니다. 크레딧을 충전하시겠습니까?")
				  			
					  		if(result) {
					           //yes => 내가 받은 음원 페이지로 이동함
					            location.replace('/credit/charge');
					        
					  		} else {
					            //no
					        }
						
					}
				},
				error: function() {
					console.log("AJAX 실패")
				}
				});
				 
			 });


			/*  ========= 항목 삭제 시 ajax 구현 ========= */
			$(document).on('click', '.delete-button', function() {
				var cartNo = $(this).data('cart-no');
				var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
				console.log(cartNo);
				console.log($cartItem);
											 
				$.ajax({
					url: "/cart/delete",
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
			
			
			/*  ==========항목 구매에 대한 스크립트 ============= */
			$(document).on('click', '.buy-button', function() {
				console.log("항목 구매 clicked()")
	// 			var sourceNo = $(this).data('source-no');
	// 			var cartNo = $(this).data('cart-no');
	// 			console.log(cartNo);
	// 			console.log(sourceNo);
				
				//배열선언
				var checkArr = new Array();
				checkArr.push($(this).attr("data-source-no"));
				
				var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
				
				console.log("배열 : ", checkArr);
				console.log("지워질 항목 : ", $cartItem);
											 
				$.ajax({
					url: "/cart/buy",
					type: "GET",
					data : { chbox : checkArr },
	// 				dataType : 'json',
					success: function(response) {
						console.log("ajax 성공");
						console.log("응답 : ",response);

						if(response == 1) {
							console.log("전부 구매했었던 소스입니다.")
							
							reloadHeaderCredit(); //헤더 크레딧 잔액 변경
							
							$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
							
							var result = confirm ("이미 구매한 항목입니다. 구매항목을 확인하시겠습니까?")
					  			
						  		if(result) {
						           //yes => 내가 받은 음원 페이지로 이동함
						            location.replace('/users/mysource');
						        
						  		} else {
						            //no
						        }
						}
						
						if(response == 2) {
							console.log("아주 깨끗하게 산적 없는 소스들만 선택했군요!")
							reloadHeaderCredit(); //헤더 크레딧 잔액 변경
							//다운로드 진행..ㅠㅠ
							$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
						}

						if(response == 3) {
							console.log("잔액 부족..ㅠㅠ")
							var result = confirm ("크레딧이 부족합니다. 크레딧을 충전하시겠습니까?")
							reloadHeaderCredit(); //헤더 크레딧 잔액 변경
					  			
						  		if(result) {
						           //yes => 내가 받은 음원 페이지로 이동함
						            location.replace('/credit/charge');
						        
						  		} else {
						            //no
						        }
						}
							
						reloadHeaderCredit(); //헤더 크레딧 잔액 변경
						
						
					},
					error: function() {
						console.log("AJAX 실패");
						console.error();
					}
				});
			});
			
			
			function reloadCartList() {
				 console.log("리스트 부분을 리로드하겠다.")
				 $('#order').load(location.href + ' #order')
				
			}
			function reloadHeaderCredit() {
				 console.log("리로드하고싶다")
				 /*  주의 ! location.href+ 이후 특정 영역을 입력해줄 때, 빈 칸 하나를 입력해주지 않으면 오류 발생한다 */
				 $('#headerCreditStatus').load(location.href +' #headerCreditStatus');
				 
			 }
			</script>
	
		</div>
	</form>
</div>
<c:import url ="../layout/footer.jsp"/>