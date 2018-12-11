<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="orderContainer">
		<div class="orderListBox">
			<div class="orderHeaderBox">
				<h2>주문완료</h2>
				<hr>
			</div>
			<div id="orderMessage">
				<h1>${message}</h1>
				<a class="confirmBtn storeBtn" href="<%=request.getContextPath()%>/store">쇼핑계속하기</a>
			</div>
		</div>
	</div>
</body>
</html>