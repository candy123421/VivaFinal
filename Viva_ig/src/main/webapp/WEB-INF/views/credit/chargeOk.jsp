<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>  

<style type="text/css">

#chargeOk_wrap {
	width:1400px;
	margin : 0 auto;
}

#chargeOk_ment img {	/*  상단 체크 */
	width: 100px;
    padding: 15px;
}
#chargeOk_ment{
	width: 453px;
	height: 237px;
	margin: 0 auto;
	font-family: 'Noto Sans';
	font-style: normal;
	font-weight: 700;
	font-size: 31px;
	line-height: 42px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.1em;
    margin-top: 67px;
	
	color: #000000;
}
h3 {
	font-weight: 600;
}
.chargeOk_chargeInfo {
	font-size : 20px;
	width: 667px;
	height: 242px;
    padding: 35px;
    margin: 0 auto;
	background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 5px;
	margin-bottom: 75px;
}

.chargeOk_chargeInfo dl {
	display : flex;
	flex-direction : row;
	align-items: flex-start;
	overflow : hidden;
	width : 100%;
	padding : 10px 0px 10px;
	letter-spacing : -0.5px;
}

.chargeOk_chargeInfo dt {
	width: 204px;
	height : 100%;
}

.price {
	font-weight : 900;
}
.chargeOk_redirect {
	width: 666px;
    text-align: left;
    margin : 0 auto;
}

.chargeOk_redirect div {
	display : inline-block;
}

#chargeRedirect {
	box-sizing: border-box;
	width: 330px;
	height: 55px;
	background: #FFFFFF;
	border: 2px solid #BFBCBC;
	border-radius: 10px;
	font-weight: 700;
	font-size: 20px;
	line-height: 33px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.29em;
	color: #918E8E;
}
#creditListRedirect {
	width: 330px;
	height: 55px;
	background: linear-gradient(197.94deg, #514C9C 5.28%, #653A99 16.47%, #683287 28.24%, #783487 40.56%, rgba(124, 45, 121, 0.95) 56.31%, #78377F 74.5%, #814A7D 83.79%, #8E4669 93.18%, #8E5D7A 99.18%);
	font-weight: 700;
	font-size: 20px;
	line-height: 33px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.29em;
	color: #FFFFFF;
	border-radius: 10px;
	border: 2px solid rgba(129, 74, 125, 0.6);
}

</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<div id="chargeOk_wrap">

	<div id="chargeOk_ment">
		<div>
			<img alt="checkOk" src="/resources/icon/charge_ok_chk.svg">
		</div>
		
	<h3>크레딧 충전이<br>
	완료되었습니다.</h3>
	</div>
	<div class="chargeOk_chargeInfo">
		<dl>
			<dt>충전된 크레딧</dt>
			<dd>
				<span class="price">${info.AMOUNT}</span>
				<span class="price">Credit</span>
			</dd>
		</dl>
		<dl>
			<dt>결제 방식</dt>
			<dd>
				<span>${info.METHOD}</span>
			</dd>
		</dl>
		<dl>
			<dt>실제 결제 금액</dt>
			<dd>
				<span id="money">${info.TOTAL_AMOUNT}</span>
				<span>원</span>
			</dd>
		</dl>
	</div>
	
	<div class="chargeOk_redirect">
		<div><button type="button" id="chargeRedirect" onClick="location.href='./charge'">추가 충전하기</button></div>
		<div><button type="button" id="creditListRedirect" onClick="location.href='./list'">크레딧 내역 조회</button></div>
	</div>
</div>
<script>
/*  실제 결제 금액에 콤마 찍어주기 */
var money = $('#money').text();
/*  3번째 자리에 콤마 찍기 */
var money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
$('#money').text(money2);
console.log(money)
console.log(money2)
</script>
<c:import url ="../layout/footer.jsp"/> 