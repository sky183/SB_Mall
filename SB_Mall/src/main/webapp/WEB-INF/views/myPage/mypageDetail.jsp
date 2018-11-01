<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MyPage</h1>
	<!--테이블 시작-->
	<table style="padding: 5px 0 5px 0;">
		<tr>
			<th>아이디</th>
			<td>${memberInfo.userId}</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>${memberInfo.userName}</td>
		</tr>
		
		<tr>
			<th>회원등급</th>
			<td>${memberInfo.gradeNum}</td>
		</tr>
		
		<tr>
			<th>마일리지</th>
			<td>${memberInfo.point}</td>
		</tr>
	
		<tr>
			<th>총 구매금액 </th>
			<td>${memberInfo.userAmount}</td>
		</tr>
		
		<tr>
			<th>주문상세번호</th>
			<td>${orderDetail.orderDetailNum}</td>
		</tr>
		<tr>
			<th>결제수단 </th>
			<td>${orderDetail.payment}</td>
		</tr>
		<tr>
			<th>주문시간 </th>
			<td>${orderDetail.orderTime}</td>
		</tr>
		<tr>
			<th>결제금액 </th>
			<td>${orderDetail.totalAmount}</td>
		</tr>
		<tr>
			<th>주문상태 </th>
			<td><input type="button" value="주문상세"></td>
		</tr>
		
		

	</table>


</body>
</html>