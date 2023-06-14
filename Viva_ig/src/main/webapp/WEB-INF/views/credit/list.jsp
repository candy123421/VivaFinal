<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 


<c:import url="../layout/header.jsp"/>   


<style type="text/css">

.credit_list_wrap {
	width : 1400px;
	margin : 0 auto;
}

#CreditStatus{
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
  	align-items:center;
  	vertical-align:middle;
  	
  	margin-top : 20px;
  	margin-bottom : 50px;
}

#MyCreditAmount {
    width: 582px;
    height: 125px;
    background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 10px;
	  
	display:inline-block;
  	text-align:center;
    
}
#MyCreditAmount div {
	width: 547px;
    height: 137px;
  	margin : 0 auto;
  	padding-top: 30px;

}
#chargeCredit  {	/*  충전하기 버튼 */
	width: 158px;
	height: 63px;

	background: #6DB9FF;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 30px;
	border : none;
	color : white;
	margin-left: 20px;
	font-size : 25px;
}
#exchangeCredit {	/*  환전하기 버튼 */
	width: 158px;
	height: 63px;
/* 	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); */
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 30px;
	font-size : 25px;
	margin-left: 20px;
	
}
/*  ====================================== */
.dealCategory {
	box-sizing: border-box;
	
	width: 59px;
	height: 35px;
	
	background: rgba(255, 255, 255, 0.01);
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 27px;
	
	margin-bottom: 15px;
	color: #7D7A7A;
}
.dealCategory:hover{
	box-sizing: border-box;
	
	width: 59px;
	height: 35px;

	background: #000000;
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 27px;
	margin-bottom: 15px;
	color: #FFFFFF;
	
}
.clicked_menu{ /*클릭 시 적용되는 style 속성*/
	box-sizing: border-box;
	
	width: 59px;
	height: 35px;

	background: #000000;
	border: 2px solid rgba(105, 100, 100, 0.5);
	border-radius: 27px;
	margin-bottom: 15px;
	color: #FFFFFF;
}
/*  ====================================== */
#credit_select_row {
	padding-bottom : 10px;
}
#credit_select_row button {
	margin-left : 10px;
	border: 3px solid transparent;
	border-radius: 27px;
	background : transparent;
	padding : 5px;
}
#credit_select_row button:hover, #credit_select_row button.active {
	margin-left : 10px;
	border: 3px solid transparent;
	border-radius: 27px;
	background : transparent;
	padding : 5px;
}


/*  ====================================== */
.popup img{
	cursor : pointer;
}
/*  ====================================== */
.table>:not(caption)>*>* {
    padding: 1.5rem 2.5rem;
}

th {
	font-size:22px;
}
</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<div class="credit_list_wrap">

	<!--  코드 완성되면 지울 내용들 ↓ -->
	회원등급 : <c:if test="${grade eq '0'}"><c:out value="일반회원" /></c:if>
	<c:if test="${grade eq '1'}"><c:out value="사운드디자이너 회원" /></c:if>
	<!--  코드 완성되면 지울 내용들 ↑ -->
	
	
	<!--  회원의 크레딧 상태 보여주는 공간-->
	<div id="CreditStatus">
	
		<!--  회원의 현재 크레딧 잔액 보여주기 -->	
		<div id="MyCreditAmount">
			<div>
			<span>보유한 크레딧  :  ${creditAcc } </span>
			<a href="./charge"><button id="chargeCredit" class="charge-button">충전하기</button></a>
			</div>
		</div>
		
		
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
	
	<!--  내역 조회 필터 기능 -->
	<div>
		<!--  1. 전체 : 디폴트 -->
		<button class="dealCategory">전체</button>
		<!--  2. 충전 -->
		<button class="dealCategory">충전</button>
		<!--  3. 구매 -->
		<button class="dealCategory">구매</button>
		
		
		<!--  4. 수익 : 업로더에게만 보이는 필터 -->
		<!--  5. 환전 : 업로더에게만 보이는 필터 -->
		<c:if test="${grade eq '1'}">
			<button class="dealCategory">수익</button>
			<button class="dealCategory">환전</button>
		</c:if>

	</div>
	
	<script type="text/javascript">
	/*  ======= 카테고리 버튼 눌렀을 때 눌린 상태 유지하게하기 */
	$(".dealCategory").each(function(index){
		$(this).attr('menu-index', index);
		
		/*  위의 설정을 다 거치고 클릭을 해주면 아래의 코드가 실행된다. */	
	}).click(function(){
			console.log("카테고리 click")
			console.log($(this).attr('menu-index'))
			
			//ajax로 보낼 데이터
			var state = $(this).html();
			console.log(state);
			 
			/*클릭된 <div>의 menu-index 값을 index 변수에 할당한다.*/
		    var index = $(this).attr('menu-index');
			console.log(index)
		    /*클릭한 <div>에  clicked_menu 클래스 추가*/
			$('.dealCategory[menu-index=' + index + ']').addClass('clicked_menu'); 
		    /*그 외 <div>는  clicked_menu 클래스 삭제*/
			$('.dealCategory[menu-index!=' + index + ']').removeClass('clicked_menu');
		    
		    
			//ajax 로 해당 url 에 데이터 전송하기
			$.ajax({
				url : "/credit/category"
				, type : "post"
				, data : {state : state}
				, dataType : "json"
				, success : function(data) {
						console.log("ajax 성공!");
						console.log(data);
// 						$('body').html("없어요");
// 						$('#order').html( $('#order'));


						 // 서버에서 받아온 데이터를 테이블에 적용하는 로직 작성
    					var list = data; // 서버에서 받아온 ArrayList
  					  	var tableBody = $("#order").find("tbody"); // 테이블의 tbody 요소 선택
  						// 기존의 tbody 내용 제거
  					    tableBody.empty();
  					  	
  						// 데이터를 반복하면서 테이블에 행을 추가
  					    $.each(list, function(index, item) {
  					      var row = $("<tr>").addClass("deal-item");
  					      
  					 // 각 열에 데이터 추가
  					      var checkBox = $("<td>").html('<div class="checkBox"><input class="form-check-input chBox" type="checkbox" name="chBox" data-deal-no="' + item.dealNo + '"></div>');
  					    var dealDate = $("<td>").html('<span>' + item.dealDate + '</span>');
  					    console.log(item.dealDate)
  					  var dealCategory = $("<td>")
					console.log(item.dealCategory);
  					if (item.dealCategory === 1) {
  					  dealCategory.html('<span>크레딧 충전</span>');
  					} else if (item.dealCategory === 2) {
  					  dealCategory.html('<span>음원 구매</span>');
  					} else if (item.dealCategory === 3) {
  					  dealCategory.html('<span>음원 수익</span>');
  					} else if (item.dealCategory === 4) {
  					  dealCategory.html('<span>크레딧 환전</span>');
  					}

  					var amount = $("<td>").html('<span>' + item.amount + ' Credit</span>');

  					var deleteButton = $("<td>").addClass("popup").html('<img data-deal-no="' + item.dealNo + '" class="delete-' + item.dealNo + 'button" alt="삭제" src="../resources/icon/X.png" width="20">');
  					 
  					
  				// 행을 테이블에 추가
  					row.append(checkBox, dealDate, dealCategory, amount, deleteButton);
  					tableBody.append(row);   
  					
  					    })
  					    
  					    
// 						let str = JSON.stringify(result); // <> parse()
						/*  list는 for문에 넣어서 each 문으로 돌려줘야 한다!!! */
// 						for(var i=0; i<result.length; i++) {
// 							var map = result[i];
// 							console.log(map)
// 							console.log(map.dealCategory)
// 							$('#order').load(map);
// 						}
						
// 						$.each(result, function(index, item) { // 데이터 =item
// 							$("#order").append(index + " "); // index가 끝날때까지 
// 							$("#order").append(item.dealNo + " ");
// 							$("#order").append(item.dealDate + " ");
// 							$("#order").append(item.dealCategory + " ");
// 							$("#order").append(item.amount + "<br>");
// 						});
						
						
						
				}	/*  success End*/
				
			}) /*  ajax End */

		});	/*  click function() End */

	</script>
	
	<!--  내역 조회 -->
	<div id="credit_select_row">	
		<label for="allCheck">전체 선택</label>
		<button type="button" class="selectDelete_btn">선택 삭제</button>
		
		<!--  선택 삭제에 대한 script -->
		<script>
			$(".selectDelete_btn").click(function() {
				console.log("선택 삭제 clicked()");
				
				var confirm_val = confirm("삭제된 내역은 복구할 수 없습니다. 정말로 삭제하시겠습니까?");
				
				//삭제 - 확인 눌렀을 경우 -> true
				if(confirm_val) {
					console.log("삭제 확인 clicked()");
					
					//checkArr 배열 생성
					var checkArr = new Array();
					console.log(checkArr);
					
					//삭제될 항목..?
// 					var removeArr = new Array();
					
					//체크 상태 항목 각각에 걸어놓은 메소드. 
					//data-deal-no 요소(attr), 즉 dealNo를 
					//checkArr 배열의 끝에 요소를 추가하고, 추가된 배열의 길이를 반환하겠다.
					//class명이 2개일때는 상태가 적용이 안되었다.. 그래서 name 으로 선택자를 지정해준거다.
					$("input[name='chBox']:checked").each(function(){
						
						console.log("체크항목들 각각에 대한 동작");
						checkArr.push($(this).attr("data-deal-no"));
						//각 배열의 수에 따라 n+1 개씩 추가되어 계속해서 출력됨을 알 수 있었다.
						//['147'] / (2) ['147', '138']/ (3) ['147', '138', '144']
						console.log(checkArr);
						
					});
					
					//ajax 로 해당 url 에 데이터 전송하기
					$.ajax({
						url : "/credit/delete"
						//get이 없는데 냅다 post 로 써도 될랑가? => 가능하군..
						, type : "post"
						, data : {chbox : checkArr}
						, success : function() {
							console.log("ajax 성공!");
							location.href = "/credit/list";
								
						},
						error : function() {
							console.log("AJAX 실패")
						}
					})
				}
			})
		
		</script>
	</div>
		
	<!--  테이블 내용 -->
	<div id="order">
		<table  class="table">

		  <!--  테이블 헤드라인 -->
		  <thead class="table-light">
		    <tr>
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="allCheck" >
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
				<tr class="deal-item"><!--  첫번째 열 시작-->
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
					
					<td> <!--  3. 내용 --> 	  
						<c:if test="${i.dealCategory eq '1'}"><span><c:out value="크레딧 충전" /></span></c:if>
				  		<c:if test="${i.dealCategory eq '2'}"><span><c:out value="음원 구매" /></span></c:if>
						<c:if test="${i.dealCategory eq '3'}"><span><c:out value="음원 수익" /></span></c:if>
						<c:if test="${i.dealCategory eq '4'}"><span><c:out value="크레딧 환전" /></span></c:if>
					</td>

					
					<td><!--  5. 금액 -->
						<span>${i.amount} Credit</span>
					</td>
					
					<td class="popup"><!--  6. delete -->
						<img data-deal-no='${i.dealNo}' class="delete-${i.dealNo}button" alt="삭제" src="../resources/icon/X.png" width="20">
							<!--  삭제 완료 후 떴다 사라지는 메시지 -->
							<!--  html 미완성 -->
							<!--  script 미완성 -->
							
							<script>
							/*  크레딧 이용내역 항목 삭제 시 ajax 구현 */
							/*  사실은 실제 데이터를 지우는게 아니라 hidden 으로 상태변경하여, 사용자에게는 삭제된 척 할거임. */
							$(document).on('click', '.delete-${i.dealNo}button', function() {
								console.log("항목 삭제 clicked()");
								
								var confirm_val = confirm("삭제된 내역은 복구할 수 없습니다. 정말로 삭제하시겠습니까?");
								//삭제 - 확인 눌렀을 경우 -> true
								if(confirm_val) {
									console.log("삭제 확인 clicked()");
									
									//여러 항목 삭제 메소드와 같이 코드를 쓰려고 굳이 한개의 항목도 배열에 넣는거다.
									var checkArr = new Array();
									checkArr.push($(this).attr("data-deal-no"));

									var $dealItem = $(this).closest('.deal-item'); // .deal-item을 찾아서 저장
									console.log(checkArr);
									console.log($dealItem);
								
									//ajax 로 해당 url 에 데이터 전송하기
									$.ajax({
										url : "/credit/delete"
										, type : "post"
										, data : {chbox : checkArr}
										, success : function(result) {
											
												console.log("ajax 성공");
												$dealItem.remove(); // $dealItem 변수를 사용하여 항목 제거
											}
											
										})
									}
							});
							</script>
								
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach><!--  반복되는 항목들 end-->
			
		</table><!--  orderTable End-->
	</div>
</div><!--  credit_list_wrap End -->
<c:import url ="../layout/footer.jsp"/>