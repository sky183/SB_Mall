<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#insPayBtn').click(function(){
			if($('#orderPayment').val()=="off"){
                alert("결제방식을 선택해주세요");
            }else{
            	$('#payment').val($('#orderPayment').val());
            	$('#hOrderForm').attr('action','<%=request.getContextPath()%>/order/insOrder/complete');
				$('#hOrderForm').submit();
			};
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
					<c:when test="${orders!=null}">
						<tr class="orderTableHeader">
							<td>상품번호</td>
							<td colspan="2">상품정보</td>
							<td>상품가격</td>
							<td>옵션</td>
							<td>수량</td>
							<td>주문금액</td>
						</tr>

						<tr>
							<td>${product.productSeq}</td>
							<td><img src="${product.photo}" alt="이미지없음" class="orderImg"></td>
							<td>
								<ul>
									<li>${product.productName}</li>
									<li>${product.detail}</li>
								</ul>
							</td>
							<td><fmt:formatNumber value="${product.price}"
									pattern="###,###,###,###,###" /></td>
							<td>${order.option}</td>
							<td><fmt:formatNumber value="${order.quantity}"
									pattern="###,###,###,###,###" /></td>
							<td><fmt:formatNumber
									value="${product.price*order.quantity}"
									pattern="###,###,###,###,###" />
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
				<p>
					결제금액 :
					<fmt:formatNumber value="${orders.price*order.quantity}" pattern="###,###,###,###,###" />
				</p>
			</div>

		</div>
		<div class="payBtnBox">
			<input type="button" class="payBtn storeBtn" id="insPayBtn" value="결제하기">
		</div>
	</div>
	<form id="hOrderForm" method="post"></form>
</body>
</html>