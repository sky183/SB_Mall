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
	border-bottom: 1px solid #a9a9a9;
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
var aa;
	$(document).ready(function() {
		
		$('.cartOrderBtn').click(function() {
			if($('input[name="selectItem"]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				$('#hCartForm').attr('action','<%=request.getContextPath()%>/order/cartOrder');
				$('#hCartForm').submit();
			}else{
				alert('구입하실 물품을 선택해 주세요.');
			}
			
		});
		
		$('.selectItem').click(function () { //체크박스 히든인풋을 활성,비활성하여 상품값을 선택적으로 전송
			var selector = "."+$(this)[0].value;
			if($(this)[0].checked==true){
				$(selector).attr("disabled",false);	
			}else{
				$(selector).attr("disabled",true);
			}
		});
		
		$('#checkAllItems').click(function () { //체크박스 전체
			if($(this)[0].checked==true){
				$("input[name=selectItem]").prop("checked",true);
				$('.hInput').attr("disabled",false);	
			}else{
				$("input[name=selectItem]").prop("checked",false);
				$('.hInput').attr("disabled",true);
			}
			
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
					<td><input type="checkbox" name="checkAllItems" id="checkAllItems"></td>
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
					<td><input type="checkbox" name="selectItem"  class="selectItem"
					value='${cartItem.productSeq}${cartItem.option}'>
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
				class="${cartItem.productSeq}${cartItem.option} hInput" 
				value="${cartItem.productSeq}" disabled>
				<input type="hidden" name="orderList[${i.index}].option" 
				class="${cartItem.productSeq}${cartItem.option} hInput" 
				value="${cartItem.option}" disabled>
				<input type="hidden" name="orderList[${i.index}].userSeq" 
				class="${cartItem.productSeq}${cartItem.option} hInput"  
				value="${cartItem.userSeq}" disabled>
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