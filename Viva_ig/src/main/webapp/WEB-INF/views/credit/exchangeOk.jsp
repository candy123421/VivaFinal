<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>  
<style type="text/css">

#chargeOk_ment img {
	width: 100px;
}
#chargeOk_ment{
	position: absolute;
	width: 453px;
	height: 271px;
	left: 427px;
	top: 185px;
	
	font-family: 'Noto Sans';
	font-style: normal;
	font-weight: 700;
	font-size: 31px;
	line-height: 42px;
	display: flex;
	align-items: center;
	text-align: center;
	letter-spacing: 0.1em;
	
	color: #000000;
}
h3 {
	font-weight: 600;
}
.chargeOk_chargeInfo {
	position: absolute;
	width: 667px;
	height: 242px;
	left: 345px;
	top: 387px;
	background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 5px;
}

dl {
	display : flex;
	flex-direction : row;
	align-items: flex-start;
	overflow : hidden;
	width : 100%;
	padding : 10px 0px 10px;
	letter-spacing : -0.5px;
}

dt {
	width : 100px; 
	height : 100%;
	line-height : 19px;
}

.price {
	font-weight : 900;
}
.chargeOk_redirect {
	position: absolute;
    left: 345px;
	top: 672px;
	width: 100%;
    text-align: left;
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
<section class="exchangeOk_wrap">
<div id="exchangeOk_ment">
	<div>
		<img alt="exchangeOk" src="/resources/icon/charge_ok_chk.svg">
	</div>
<h3>환전 신청이<br>
완료되었습니다.</h3>
</div>
<div>환전은 신청일로부터 주말, 공휴일 제외 3일 소요됩니다.</div>
<div class="exchangeOk_chargeInfo">
	<dl>
		<dt>환전 받을 크레딧</dt>
		<dd>
			<span class="price">${info.exAmount}</span>
			<span class="price">Credit</span>
		</dd>
	</dl>
	<dl>
		<dt>실제 환전 금액</dt>
		<dd>
			<span class="price">${info.exAmount}</span>
			<span class="price">원</span>
		</dd>
	</dl>
	<dl>
		<dt>크레딧 잔액</dt>
		<dd>
			<span class="price">${info.exAmount}</span>
			<span class="price">Credit</span>
		</dd>
	</dl>
	<dl>
		<dt>환전 받을 계좌</dt>
		<dd>
			<span>${info.bank}</span><br><span>(${info.accNo})</span>
		</dd>
	</dl>
	<dl>
		<dt>예금주</dt>
		<dd>
			<span>${info.holder}</span>
		</dd>
	</dl>
	<dl>
		<dt>환전 신청 일자</dt>
		<dd>
			<span>${info.exDate}</span>
		</dd>
	</dl>
</div>

<div class="exchangeOk_redirect">
	<div><button type="button" id="creditListRedirect" onClick="location.href='./list'">크레딧 내역 조회</button></div>
	
	<!--  크레딧 총계 계산하는 로직 넣기 전까지는 얘를 오픈하지 않도록...ㅠㅠㅠ -->
<!-- 	<div><button type="button" id="exchangeRedirect" onClick="location.href='./exchange'">추가 환전하기</button></div> -->
</div>
</section>

<c:import url ="../layout/footer.jsp"/> 