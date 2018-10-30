<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	등록된 주문이 없습니다.
		</c:when>
	<c:otherwise>
<table border="1" class="memList">
	<tr>
		<td>주문상세번호</td>
		<td>회원번호</td>
		<td>결제수단</td>
		<td>주문시간</td>
		<td>결제금액</td>
		<td>주문상태</td>
	</tr>
	<c:forEach var="orderDetail" items="${viewData.objList}">
		<tr>
			<td>${orderDetail.orderDetailNum}</td>
			<td><a
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
			<td>${orderDetail.totalAmount}</td>
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
			</a> <button class="order" name="${orderDetail.orderDetailNum}">주문상세</button>
			</td>
		</tr>
	</c:forEach>
	
</table>
<c:forEach varStatus="i" begin="1" end="${viewData.pageTotalCount}">
			<a href="#" class="page" name="${i.index}">[${i.index}] </a>
		</c:forEach>
	</c:otherwise>
</c:choose>
<script>

$('.order').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/orderList/' + $(this).attr('name'),
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});

$('.page').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/orderDetailList?page=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
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
