<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 	주문 리스트 -->
<c:set var="orderVOList" value="${orderVOList}"></c:set>
<c:choose>
	<c:when test="${orderVOList.isEmpty()}">
	</c:when>
	<c:otherwise>
		<table id="orderTable">
			<tr>
				<th>주문번호</th>
				<th>제품사진</th>
				<th>상품번호</th>
				<th class="myPageGoodsName">상품명</th>
				<th>수량</th>
				<th>옵션1</th>
				<th>옵션2</th>
				<th>합계</th>
				<th>반품</th>
			</tr>
			<c:forEach var="orderVO" items="${orderVOList}">
				<tr>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.orderSeq}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">
						<img class="myPageOrderImg" alt="이미지가 없습니다."	onerror="this.src='<%=request.getContextPath()%>/img/noImage.png'"
									 src="${orderVO.goodsPhoto}">
					</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.goodsNo}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.goodsName}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.quantity}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.opt1Name}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.opt2Name}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">${orderVO.salePrice}</td>
					<td class="orderDetailNum" name="${orderVO.orderDetailNum}">
						<c:choose>
							<c:when test="${orderVO.refund == 0}">
								<button class="refund" orderDetailNum="${orderVO.orderDetailNum}" orderSeq="${orderVO.orderSeq}" value="1">반품 요청</button>
							</c:when>
							<c:when test="${orderVO.refund == 1}">
								<button class="refund" orderDetailNum="${orderVO.orderDetailNum}" orderSeq="${orderVO.orderSeq}" value="0">반품 철회</button>
							</c:when>
							<c:when test="${orderVO.refund == 2}">
								반품 완료
							</c:when>
						</c:choose>
						
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>
<script type="text/javascript">

	//반품요청
	$('.refund').on('click', function(){
		var tableName = $('#tableName').val();
		var orderSeq = $(this).attr('orderSeq');
		var refund = $(this).val();
		var orderDetailNum = $(this).attr('orderDetailNum');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/changeRefund?tableName=' 
					+ tableName + '&orderSeq=' + orderSeq + '&refund=' + refund + '&orderDetailNum=' + orderDetailNum,
			type : 'GET',
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				alert(data);
				loadOrderList(orderDetailNum);
			}
		});
	})
</script>