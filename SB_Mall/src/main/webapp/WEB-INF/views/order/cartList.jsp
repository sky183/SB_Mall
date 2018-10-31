<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
ul{
   list-style:none;
}
#cartListContainer{
	width: 1200px;
	margin: 0 auto;
}
#cartListBox{
	width: 100%;
	margin: 0 auto;
}
#cartHeaderBox{
	width: 100%;
	margin: 50px 0;
}
#cartHeaderBox h2{
	margin: 30px 20px;
}
.cartImg{
	height: 100px;
	width: 100px;
}
#cartTable{
	width: 1200px;
	border-collapse: collapse;
	margin: 0 auto;
}
#cartTableHeader{
	background-color: #F2F2F2;
}
#cartTable td{
	padding:20px;
	border: 1px solid #a9a9a9;
	text-align: center;
}
.cartOrderBtn{
	outline: none;
	border: 0px;
	border-radius: 10px;
	background-color:#FEC828;
	font-size:20px;
	color:white;
	padding:10px 20px;
}
.cartOrderBtn:hover{
	cursor: pointer;
}
.cartOrderBtn:active{
	box-shadow:0 0 1pt 1pt #5882FA;
}
.cartOrderBtnBox{
	width: 120px;
	margin: 20px auto;
}
.orderPayBox{
	width:100%;
	margin: 10px 0;
	border-bottom: 1px solid #a9a9a9;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>
	var hInputArr=[];
	$(document).ready(function() {
		
		$('.cartOrderBtn').click(function() {
			hInputArr=[];
			$('#hCartForm').attr('action','<%=request.getContextPath()%>/order/cartOrder');
			<%-- location.href="<%=request.getContextPath()%>/order/cartOrder"; --%>
			/* var hInputSel=$('input[name=selectItem]:checked');
			for(var i=0;i<hInputSel.length;i++){
				hInputArr.push(hInputSel[i].value);
			} */
			//$('#selProduct').val(hInputArr);
			$('#hCartForm').submit();
		});
		
	});
</script>

<div id="cartListContainer">
	<div id="carListBox">
	<div id="cartHeaderBox">
		<h2>장바구니</h2>
	<hr>
	</div>
	<table id="cartTable">
		<c:choose>
			<c:when test="${cart!=null}">
				<tr id="cartTableHeader">
					<td><input type="checkbox" id="checkAllItems"></td>
					<td>상품번호</td>
					<td colspan="2">상품정보</td>
					<td>상품가격</td>
					<td>옵션</td>
					<td>수량</td>
					<td>주문금액</td>
				</tr>
				<form method="post" id="hCartForm">
					
				<c:forEach var="cartItem" items="${cart}" varStatus="i">
				<tr>
					<td><input type="checkbox" name="selectItem" 
					value="${i.index}">
					</td>
					<td>${cartItem.productSeq}</td>
					<td><img src="${cartItem.photo}" alt="이미지없음" class="cartImg"></td>
					<td>
						<ul>
							<li>${cartItem.productName}</li>
							<li>${cartItem.detail}</li>
						</ul>
					</td>
					<td>
					<fmt:formatNumber value="${cartItem.price}" pattern="###,###,###,###,###"/>
					</td>
					<td>${cartItem.option}</td>
					<td>
					<fmt:formatNumber value="${cartItem.quantity}" pattern="###,###,###,###,###"/>
					</td>
					<td>
					<fmt:formatNumber value="${cartItem.price*cartItem.quantity}" 
					pattern="###,###,###,###,###"/>
					</td>
				</tr>
				<input type="hidden" name="orderList[${i.index}].productSeq" 
				value="${cartItem.productSeq}">
				<input type="hidden" name="orderList[${i.index}].option" 
				value="${cartItem.option}">
				<input type="hidden" name="orderList[${i.index}].userSeq"
				value="${cartItem.userSeq}">
				</c:forEach>
				</form>
			</c:when>
			<c:otherwise>
				장바구니에 담긴 상품이 없습니다.
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	<div class="cartOrderBtnBox">
		<input type="button" class="cartOrderBtn" value="주문하기"> 
	</div>
</div>
<br>