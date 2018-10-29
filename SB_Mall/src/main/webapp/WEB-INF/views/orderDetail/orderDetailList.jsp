<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" class="memList">
	<tr>
		<td>회원번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>회원이름</td>
		<td>주소1</td>
		<td>주소2</td>
		<td>우편번호</td>
		<td>전화번호</td>
		<td>가입일</td>
		<td>회원등급</td>
		<td>마일리지</td>
		<td>총구매액</td>
		<td>관리</td>
	</tr>
	<c:forEach var="orderDetail" items="${orderDetails}">
		<tr>
			<td>${orderDetail.orderDetailNum}</td>
			<td>${orderDetail.userSeq}</td>
			<td>${orderDetail.payment}</td>
			<td>${orderDetail.orderTime}</td>
			<td>
			<c:choose>
			<c:when test="${orderDetail.status}">
			
			</c:when>
			<c:when test=""></c:when>
			<c:when test=""></c:when>
			</c:choose>
			<a	href="<%=request.getContextPath()%>/orderDetail/${orderDetail.orderDetailNum}">상세</a>
				<a
				href="<%=request.getContextPath()%>/orderDetailDelete/${member.userId}">탈퇴</a>
			</td>
		</tr>
	</c:forEach>
</table>
