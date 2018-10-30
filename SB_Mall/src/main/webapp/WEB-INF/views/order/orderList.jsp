<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" class="memList">
	<tr>
		<td>주문상세번호</td>
		<td>주문번호</td>
		<td>회원번호</td>
		<td>품목번호</td>
		<td>주문수량</td>
		<td>옵션</td>
		<td>주문금액</td>
	</tr>
	<c:forEach var="order" items="${orders}">
		<tr>
			<td>${order.orderDetailNum}</td>
			<td>${order.orderSeq}</td>
			<td>${order.userSeq}</td>
			<td>${order.productSeq}</td>
			<td>${order.quantity}</td>
			<td>${order.option}</td>
			<td>${order.salePrice}</td>
<%-- 			<td><a
				href="<%=request.getContextPath()%>/memberInfo/member?userSeq=${orderDetail.userSeq}">${orderDetail.userSeq}</a>
			</td>
			<td><c:choose>
					<c:when test="${orderDetail.payment == 0}">
			무통장
			</c:when>
					<c:otherwise>
			카드
			</c:otherwise>
				</c:choose></td>

			<td>${orderDetail.orderTime}</td>
			<td><a
				href="<%=request.getContextPath()%>/orderDetailStatus/${orderDetail.orderDetailNum}">
					<c:choose>
						<c:when test="${orderDetail.status == 0}">
							<button class="button">입금미확인</button>
						</c:when>
						<c:when test="${orderDetail.status == 1}">
							<button class="button">결제완료</button>
						</c:when>
						<c:when test="${orderDetail.status == 2}">
							<button class="button">배송전</button>
						</c:when>
						<c:when test="${orderDetail.status == 3}">
							<button class="button">배송중</button>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
			</a> <button id="order" name="${orderDetail.orderDetailNum}">주문상세</button>
			</td> --%>
		</tr>
	</c:forEach>
	
</table>
<script>

$('#order').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/orderDetail/' + $(this).attr('name'),
	/* 	data : {
			viewType : $(this).val()
		}, */
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});
</script>
