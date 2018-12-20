<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 	주문 리스트 -->
<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
	<div id="orderPage">
		<div>
			<select id="tableName">
				<option value="OrderDetail" selected="selected">일반주문</option>
				<option value="CrowdOrderDetail">얼리버드</option>
			</select>
		</div>
		<table id="orderDetailTable">
			<tr>
				<th>주문일</th>
				<th>주문상세번호</th>
				<th>배송지</th>
				<th>상품</th>
				<th>결제</th>
				<th>상태</th>
				<th>주문금액</th>
			</tr>
			<c:forEach var="orderDetailVO" items="${viewData.objList}">
				<tr>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.orderTime}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.orderDetailNum}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.orderAddress}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.goodsName}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.payment}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.status}</td>
					<td class="orderDetailNum" name="${orderDetailVO.orderDetailNum}">${orderDetailVO.totalAmount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</c:otherwise>
</c:choose>
<!-- 	페이징 처리 -->
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
		<nav aria-label="Page navigation example">
			<ul class="pagination pg-dark">
				<c:choose>
					<c:when test="${viewData.currentPageNumber == 1}">
						<li class="page-item"><a class="page-link">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber - 1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.pageTotalCount == 1}">
						<li class="page-item active" style="back"><a id="currentPage" class="page-link" name="1">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="1"
							end="${viewData.pageTotalCount}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active" style="back"><a id="currentPage" class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber + 1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>

<script type="text/javascript">

function loadOrderList(orderDetailNum){
	
	var tableName = $('#tableName').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/member/loadOrderList?tableName=' + tableName + '&orderDetailNum=' + orderDetailNum,
		type : 'GET',
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#loadOrderList').html(data);
		}
	});
};

//페이지 번호를 클릭하면 다시 불러온다.
$('.page').click(function() {
	$(this).unbind();
	var pageNumber = $(this).attr('name');
	loadOrderDetailList(pageNumber);
});

//테이블 td 클릭시 해당 주문 조회
$('.orderDetailNum').on('click', function(){
	
	var orderDetailNum = $(this).attr('name');
	
	loadOrderList(orderDetailNum);
	
})
</script>