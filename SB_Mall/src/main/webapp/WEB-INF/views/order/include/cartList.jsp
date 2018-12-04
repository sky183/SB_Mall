<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script>
var aa;
	$(document).ready(function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/order/carts',
			type : 'GET',
			data : {'userSeq':'${memberInfo.userSeq}'},
			error : function(error) {
				alert("error!");
			},
			success : function(data) {
				for(var key in data ){
					$('<tr/>').appendTo('#cartTable');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<input/>').attr({
						'name':'cartItem',
						'type':'checkbox',
						'data-goodsno':data[key].goodsNo,
						'data-goodsprice':data[key].goodsPrice,
						'data-quantity':data[key].quantity,
						'data-optionseq':data[key].optionSeq,
						'data-opt1price':data[key].opt1Price,
						'data-opt2price':data[key].opt2Price,
						'data-saleprice':data[key].salePrice,
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<a/>').attr({
						'href':'<%=request.getContextPath()%>'+'/store/board/'+data[key].salesSeq
					}).text(data[key].goodsNo).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<img/>').attr({
						'src':data[key].goodsPhoto
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').html('<p>'+data[key].goodsName+'</p>').appendTo('#cartTable>tbody>tr:last-child');
					
					//옵션1,2 존재유무 판단하여 텍스트 추가
					if(data[key].opt1Name.length>0){
						$('<p/>').text(data[key].opt1Name+'(+'+numComma(data[key].opt1Price)+'원)')
						.appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					}
					if(data[key].opt2Name.length>0){
						$('<p/>').text(data[key].opt2Name+'(+'+numComma(data[key].opt2Price)+'원)')
						.appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					}
					
					$('<td/>').html('<p>'+numComma(data[key].goodsPrice)+'원</p>').appendTo('#cartTable>tbody>tr:last-child');
					$('<td/>').appendTo('#cartTable>tbody>tr:last-child');
					$('<input/>').attr({
						'type':'Number',
						'data-index':key,
						'value':data[key].quantity,
						'oninput':'changeInsCartPrice(this)'
					}).appendTo('#cartTable>tbody>tr:last-child>td:last-child');
					$('<td/>').html('<strong>'+numComma(data[key].salePrice)+'원</strong>')
					.appendTo('#cartTable>tbody>tr:last-child');
				}
			}
		});
		
		$('.cartOrderBtn').click(function() {
			if($('input[name=cartItem]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				$('#hCartForm').attr('action','<%=request.getContextPath()%>/order/cartOrder');
				$('#hCartForm').submit();
			}else{
				alert('구입하실 물품을 선택해 주세요.');
			}
			
		});
		
		$('.cartdeleteBtn').click(function() {
			if($('input[name=cartItem]:checked').length>0){ //최소 하나의 상품이 선택되었을때
				if (confirm("정말 삭제하시겠습니까??") == true){
					$('input[name=cartItem]:checked').parent().parent().remove();
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
		
		$('#checkAllItems').click(function () { //체크박스 전체체크
			if($(this)[0].checked==true){
				$("input[name=cartItem]").prop("checked",true);
			}else{
				$("input[name=cartItem]").prop("checked",false);
			}
			
		});
		
	});
	function changeInsCartPrice(e) { //cart 수량 변경시마다
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
		if(e.value>9999){
			e.value=9999;
		}
		
		var paSelector = $(e).parent().parent();
		var calPrice = e.value*
			(Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-goodsprice'))+
			Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-opt1price'))+
			Number($(paSelector).find('td:first-child>input[type=checkbox]').attr('data-opt2price')));
		$(paSelector).find('td:first-child>input[type=checkbox]').attr('data-quantity',e.value);
		$(paSelector).find('td:first-child>input[type=checkbox]').attr('data-salprice',calPrice);
		$(paSelector).find('td:last-child>strong').text(numComma(calPrice)+'원');
	}
	function numComma(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
</script>

<div id="cartListContainer">
	<div id="carListBox">
		<div id="cartHeaderBox">
			<h2>장바구니</h2>
			<hr>
		</div>
		<table id="cartTable">
			<tr id="cartTableHeader">
				<td><input type="checkbox" id="checkAllItems"></td>
				<td>상품번호</td>
				<td colspan="2">상품정보</td>
				<td>상품가격</td>
				<td>수량</td>
				<td>주문금액</td>
			</tr>
		</table>
	</div>
	<div class="cartSubBtnBox">
		<input type="button" class="cartdeleteBtn storeBtn" value="선택상품삭제">
	</div>
	<div class="cartOrderBtnBox">
		<input type="button" class="cartOrderBtn storeBtn" value="주문하기">
	</div>
	<form method="post" id="hCartForm">
	</form>
</div>
<br>