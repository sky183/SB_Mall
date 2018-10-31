<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.orderContainer{
	width: 1200px;
	margin: 0 auto;
}
.orderListBox{
	width: 100%;
	margin: 0 auto;
}
.orderHeaderBox{
	width: 100%;
	margin: 50px 0;
}
.orderHeaderBox h2{
	margin: 30px 20px;
}
#orderMessage{
	padding: 150px 10px 100px 10px;
	text-align: center;
}
#orderMessage h1{
	margin: 80px;
}
.confirmBtn{
	width: 150px;
	outline: none;
	border: 0px;
	border-radius: 10px;
	background-color:#FEC828;
	font-size:20px;
	color:white;
	padding:10px 0px;
	text-align: center;
}
.confirmBtn:hover{
	cursor: pointer;
}
.confirmBtn:active{
	box-shadow:0 0 1pt 1pt #5882FA;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
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
				<input class="confirmBtn" value="쇼핑계속하기">
			</div>
		</div>
	</div>
</body>
</html>