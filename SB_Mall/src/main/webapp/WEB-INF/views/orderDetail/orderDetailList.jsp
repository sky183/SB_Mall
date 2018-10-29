<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" class="memList">
	<tr>
		<td>주문상세번호</td>
		<td>회원번호</td>
		<td>결제수단</td>
		<td>주문시간</td>
		<td>주문상태</td>
		<td>관리</td>
	</tr>
	<c:forEach var="orderDetail" items="${orderDetails}">
		<tr>
			<td>${orderDetail.orderDetailNum}</td>
			<td>
			<a	href="<%=request.getContextPath()%>/memberInfo/member?userSeq=${orderDetail.userSeq}">${orderDetail.userSeq}</a>
			</td>
			<td>
			<c:choose>
			<c:when test="${orderDetail.payment == 0}">
			무통장
			</c:when>
			<c:otherwise>
			카드
			</c:otherwise>
			</c:choose>
			</td>
			
			<td>${orderDetail.orderTime}</td>
			<td>
			<c:choose>
			<a	href="<%=request.getContextPath()%>/orderDetailStatus/${orderDetail.orderDetailNum}">
			<c:when test="${orderDetail.status == 0}">
			<button>입금미확인</button>
			</c:when>
			<c:when test="${orderDetail.status == 1}">
			<button>결제완료</button>
			</c:when>
			<c:when test="${orderDetail.status == 2}">
			<button>배송전</button>
			</c:when>
			<c:when test="${orderDetail.status == 3}">
			<button>배송중</button>
			</c:when>
			</a>
			</c:choose>
				<a
				href="<%=request.getContextPath()%>/orderDetail/${orderDetail.orderDetailNum}"><button>주문상세</button></a>
			</td>
		</tr>
	</c:forEach>
</table>
