<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="headerFullWidth">
		<div id="headerLayout">
			
			<!-- 로고 및 메뉴바. -->
			<div id="headerNavi">
				<a href="<%=request.getContextPath()%>/">
				<img id="headerLogo" src="img/SBCompanyLogo.png"> 
				</a>
				<a class="headerNaviText" >Search</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/login">login</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/join">Join</a> 
				<a class="headerNaviText" href="<%=request.getContextPath()%>/lo/qna">QnA</a> 
				<a class="headerNaviText" href="<%=request.getContextPath()%>/store">Store</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/">HOME</a>
			</div>

		</div>
	</div>


</body>
</html>