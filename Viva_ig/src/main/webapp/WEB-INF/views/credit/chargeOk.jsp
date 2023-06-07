<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<c:import url="../layout/header.jsp"/>  
<style>
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
	width: 330px;
	height: 72px;
	left: 286px;
	top: 672px;
}


#chargeRedirect {
box-sizing: border-box;

position: absolute;
width: 330px;
height: 54.86px;
left: calc(50% - 330px/2 - 149px);
top: 672px;

background: #FFFFFF;
border: 1px solid #BFBCBC;
border-radius: 5px;

}
#creditListRedirect {
position: absolute;
width: 330px;
height: 54.86px;
left: calc(50% - 330px/2 + 280px);
top: 672px;

background: #6DB9FF;
border-radius: 5px;
font-weight: 700;
font-size: 24px;
line-height: 33px;
display: flex;
align-items: center;
text-align: center;
letter-spacing: 0.1em;

color: #FFFFFF;

}

</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>
<section>
<div id="chargeOk_ment">
	<div>
		<img alt="checkOk" src="/resources/icon/checkOk.svg">
	</div>
	
<h3>크레딧 충전이<br>
완료되었습니다.</h3>
</div>
<div class="chargeOk_chargeInfo">
	<dl>
		<dt>크레딧 잔액</dt>
		<dd>
			<span class="price">{크레딧}</span>
			<span class="price">Credit</span>
		</dd>
	</dl>
	<dl>
		<dt>결제 방식</dt>
		<dd>
			<span>{카드}</span>
			<span>{국민}</span>
			<span>{번호}</span>
		</dd>
	</dl>
	<dl>
		<dt>실제 결제 금액</dt>
		<dd>
			<span>{금액}</span>
			<span>원</span>
		</dd>
	</dl>
</div>

<div class="chargeOk_redirect">
	<button type="button" class="btn btn-primary btn-lg" id="chargeRedirect" >추가 충전하기</button>
	<button type="button" class="btn btn-secondary btn-lg" id="creditListRedirect">크레딧 내역 조회</button>
</div>
</section>

<c:import url ="../layout/footer.jsp"/> 