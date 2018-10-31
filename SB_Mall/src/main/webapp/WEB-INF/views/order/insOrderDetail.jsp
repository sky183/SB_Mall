<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul{
   list-style:none;
}
.orderContainer{
	width: 1200px;
	margin: 0 auto;
}
.orderListBox{
	width: 100%;
	margin: 0 auto;
}
.orderHeaderBox{
	width: 100%;
	margin: 50px 0;
}
.orderHeaderBox h2{
	margin: 30px 20px;
}
.orderImg{
	height: 100px;
	width: 100px;
}
.orderTable{
	width: 1200px;
	border-collapse: collapse;
	margin: 0 auto;
}
.orderTableHeader{
	background-color: #F2F2F2;
}
.orderTable td{
	padding:20px;
	border: 1px solid #a9a9a9;
	text-align: center;
}
.payBtn{
	outline: none;
	border: 0px;
	border-radius: 10px;
	background-color:#FEC828;
	font-size:20px;
	color:white;
	padding:10px 20px;
}
.payBtn:hover{
	cursor: pointer;
}
.payBtn:active{
	box-shadow:0 0 1pt 1pt #5882FA;
}
.orderPayBox{
	width:100%;
	margin: 10px 0;
	border-bottom: 1px solid #a9a9a9;
}
.paymentBox{
	display: inline-block;
	margin: 20px 20px 20px 0;
}
.orderPayment{
	height: 30px;
}
.totalAmount{
	display: inline-block;
	float: right;
	margin: 20px 0 20px 20px;
}
.payBtnBox{
	margin: 10px;
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#insPayBtn').click(function(){
			if($('#orderPayment').val()=="off"){
                alert("결제방식을 선택해주세요");
            }else{
            	$('#payment').val($('#orderPayment').val());
            	$('#hOrderForm')
            	.attr('action','<%=request.getContextPath()%>/order/insOrder/complete');
				$('#hOrderForm').submit();
            }
		});
		
	});
</script>	
</head>
<body>
	<div class="orderContainer">
	<div class="orderListBox">
	<div class="orderHeaderBox">
		<h2>주문</h2>
	<hr>
	</div>
	<table class="orderTable">
		<c:choose>
			<c:when test="${order!=null&&product!=null}">
				<tr class="orderTableHeader">
					<td>상품번호</td>
					<td colspan="2">상품정보</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
				<form id="hOrderForm" method="post">
					<input type="hidden" name="order.productSeq" value="${order.productSeq}">
					<input type="hidden" name="order.quantity" value="${order.quantity}">
					<input type="hidden" name="order.option" value="${order.option}">
					<input type="hidden" name="order.userSeq" value="${order.userSeq}">
					<input type="hidden" name="orderDetail.payment" id="payment">
					<input type="hidden" name="orderDetail.totalAmount" 
					value="${product.price*order.quantity}">
					<input type="hidden" name="orderDetail.userSeq" value="${order.userSeq}">
					
				</form>
				<tr>
					<td>${product.productSeq}</td>
					<td><img src="${product.photo}" alt="이미지없음" class="orderImg"></td>
					<td>
						<ul>
							<li>${product.productName}</li>
							<li>${product.detail}</li>
						</ul>
					</td>
					<td>${product.price}</td>
					<td>${order.option}</td>
					<td>${order.quantity}</td>
					<td><c:out value="${product.price*order.quantity}"></c:out></td>
				</tr>
			</c:when>
			<c:otherwise>
				구매할 상품이 존재하지 않습니다.
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	<div class="orderPayBox">
		<div class="paymentBox">
			<select class="orderPayment" id="orderPayment">
				<option value="off">결제방법</option>
				<option value="0">현금결제</option>
				<option value="1">카드결제</option>
			</select>
		</div>
		<div class="totalAmount">
			<p>결제금액 : ${product.price*order.quantity}</p>
		</div>
		
	</div>
	<div class="payBtnBox">
			<input type="button" class="payBtn" id="insPayBtn" value="결제하기">
		</div>
</div>
</body>
</html>