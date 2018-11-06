<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css?ver=2">
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">
</head>
<body> 

	<div id="headerFullWidth">
		<div id="headerLayout">
			 
			<!-- 로고 및 메뉴바. -->
			<div id="headerNavi">
				<a href="<%=request.getContextPath()%>/">
					<img id="headerLogo" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png"> 
				</a>
				<c:choose>
					<c:when test='${memberInfo.gradeNum >= 3}'>
						<a class="headerNaviText" href="<%=request.getContextPath()%>/admin/adminPage">admin</a>
					</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test='${memberInfo eq null}'>
						<a class="headerNaviText" href="<%=request.getContextPath()%>/member/login">login</a>
						<a class="headerNaviText" href="<%=request.getContextPath()%>/member/join">Join</a> 
					</c:when>
					<c:otherwise>
						<a class="headerNaviText" href="<%=request.getContextPath()%>/member/myPage">myPage</a>
						<a class="headerNaviText" href="<%=request.getContextPath()%>/member/logout">logout</a>
					</c:otherwise>
				</c:choose>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/qna">QnA</a> 
				<a class="headerNaviText" href="<%=request.getContextPath()%>/order/cart">Cart</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/store">Store</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/">HOME</a>
			</div>

		</div>
	</div>


</body>
</html>