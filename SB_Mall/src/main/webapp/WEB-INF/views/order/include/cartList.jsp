<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		$('.cartdeleteBtn').click(function() {
			if($('input[name="selectItem"]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				if (confirm("정말 삭제하시겠습니까??") == true){
					$('#hCartForm').attr('action','<%=request.getContextPath()%>/order/deleteCart');
					$('#hCartForm').submit();
				}else{//취소
				    return;
				}
			}else{
				alert('삭제하실 물품을 선택해 주세요.');
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
				</c:forEach>
				
			</c:when>
			<c:otherwise>
				장바구니에 담긴 상품이 없습니다.
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	<div class="cartSubBtnBox">
	<input type="button" class="cartdeleteBtn storeBtn" value="선택상품삭제"> 
	</div>
	<div class="cartOrderBtnBox">
		<input type="button" class="cartOrderBtn storeBtn" value="주문하기"> 
	</div>
	<form method="post" id="hCartForm">
		<c:if test="${cart!=null}">
			<c:forEach var="cartItem" items="${cart}" varStatus="i">
				<input type="hidden" name="orders[${i.index}].productSeq"
					class="${cartItem.productSeq}${cartItem.option} hInput"
					value="${cartItem.productSeq}" disabled> 
				<input type="hidden" name="orders[${i.index}].option"
					class="${cartItem.productSeq}${cartItem.option} hInput"
					value="${cartItem.option}" disabled> 
				<input type="hidden" name="orders[${i.index}].userSeq"
					class="${cartItem.productSeq}${cartItem.option} hInput"
					value="${cartItem.userSeq}" disabled>
			</c:forEach>
		</c:if>
	</form>
</div>
<br>