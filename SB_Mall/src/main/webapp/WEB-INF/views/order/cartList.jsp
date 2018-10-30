<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
ul{
   list-style:none;
}
#cartListContainer{
	width: 1200px;
	margin: 0 auto;
}
.cartImg{
	height: 200px;
	width: 200px;
}
#cartTable{
	border-collapse: collapse;
}
#cartTableHeader{
	border: 1px solid #a9a9a9;
}
#cartTable td{
	padding:20px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script></script>

<div id="cartListContainer">
	<div id="">
		<h2>장바구니</h2>
	<hr>
	</div>
	<table id="cartTable">
		<c:choose>
			<c:when test="${cart!=null}">
				<tr id="cartTableHeader">
					<td><input type="checkbox" name="selectItem" id="checkAllItems"></td>
					<td>상품번호</td>
					<td colspan="2">상품정보</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
				<c:forEach var="cartItem" items="${cart}">
				<tr>
					<td><input type="checkbox" name="selectItem"></td>
					<td>${cartItem.productSeq}</td>
					<td><img src="${cartItem.photo}" alt="이미지없음" class="cartImg"></td>
					<td>
						<ul>
							<li>${cartItem.productName}</li>
							<li>${cartItem.detail}</li>
						</ul>
					</td>
					<td>${cartItem.price}</td>
					<td>${cartItem.option}</td>
					<td>${cartItem.quantity}</td>
					<td><c:out value="${cartItem.price*cartItem.quantity}"></c:out></td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				장바구니에 담긴 상품이 없습니다.
			</c:otherwise>
		</c:choose>
	</table>
</div>