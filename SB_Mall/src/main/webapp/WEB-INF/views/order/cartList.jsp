<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script></script>
<div>
<h2>장바구니</h2>
<hr>
</div>
<div>
	<table style="border:1px solid bladck;">
		<c:choose>
			<c:when test="${cart!=null}">
				<tr>
					<td><input type="checkbox" name="selectItem" id="checkAllItems"></td>
					<td>상품번호</td>
					<td colspan="2">상품정보</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
				<c:forEach var="cartItem" items="${cart}">
					<td><input type="checkbox" name="selectItem"></td>
					<td>${cartItem.productSeq}</td>
					<td>${cartItem.photo}</td>
					<td>
						<ul>
							<li>${cartItem.productName}</li>
							<li>${cartItem.detail}</li>
						</ul>
					</td>
					<td>${cartItem.price}</td>
					<td>${cartItem.option}</td>
					<td>${cartItem.quantity}</td>
					<td><c:out value="${cartItem.price}*${cartItem.quantity}"></c:out></td>
				</c:forEach>
			</c:when>
			<c:otherwise>
				장바구니에 담긴 상품이 없습니다.
			</c:otherwise>
		</c:choose>
	</table>
</div>