<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#insPayBtn').click(function(){
			if($('#orderPayment').val()=="off"){
                alert("결제방식을 선택해주세요");
            }else{
            	$('#payment').val($('#orderPayment').val());
            	$('#hOrderForm')
            	.attr('action','<%=request.getContextPath()%>/order/cartOrder/complete');
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
			<c:when test="${orders!=null}">
				<tr class="orderTableHeader">
					<td>상품번호</td>
					<td colspan="2">상품정보</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
				<c:forEach var="order" items="${orders}">
				<tr>
					<td>
					${order.productSeq}
					</td>
					<td><img src="${order.photo}" alt="이미지없음" class="orderImg"></td>
					<td>
						<ul>
							<li>${order.productName}</li>
							<li>${order.detail}</li>
						</ul>
					</td>
					<td>
					<fmt:formatNumber value="${order.price}" pattern="#,###"/>
					</td>
					<td>${order.option}</td>
					<td>
					<fmt:formatNumber value="${order.quantity}" pattern="#,###"/>
					</td>
					<td>
					<fmt:formatNumber value="${order.salePrice}" 
					pattern="#,###"/>
					</td>
				</tr>
				</c:forEach>
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
			<p>결제금액 : <fmt:formatNumber value="${totalAmount}" 
			pattern="#,###"/></p>

		</div>
		
	</div>
	<div class="payBtnBox">
			<input type="button" class="payBtn storeBtn" id="insPayBtn" value="결제하기">
		</div>
</div>

<form id="hOrderForm" method="post"> <!-- 컨트롤러전달 객체생성용 히든폼 -->
	<input type="hidden" name="orderDetail.payment" id="payment">
	<input type="hidden" name="orderDetail.totalAmount" id="totalAmount" value="${totalAmount}">
	<c:forEach var="order" items="${orders}" varStatus="i">
		<c:if test="${i.index==0}">
			<input type="hidden" name="orderDetail.userSeq" id="userSeq" value="${order.userSeq}">
		</c:if>
		<input type="hidden" name="orders[${i.index}].userSeq" value="${order.userSeq}">
		<input type="hidden" name="orders[${i.index}].productSeq" value="${order.productSeq}">
		<input type="hidden" name="orders[${i.index}].quantity" value="${order.quantity}">
		<input type="hidden" name="orders[${i.index}].option" value="${order.option}">
	</c:forEach>
</form>
</body>
</html>