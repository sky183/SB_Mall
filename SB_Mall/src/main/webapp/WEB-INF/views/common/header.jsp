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

	<div id="headerFullWidth">
		<div id="headerLayout">
			
			<!-- 로고 및 메뉴바. -->
			<div id="headerNavi">
				<a href="<%=request.getContextPath()%>/">
				<img id="headerLogo" src="img/SBCompanyLogo.png"> 
				</a>
				<a class="headerNaviText" >Search</a>
				<c:choose>
				<c:when test="${memberInfo. == null}">
				<a class="headerNaviText" href="<%=request.getContextPath()%>/login">login</a>
				</c:when>
				<c:otherwise>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/logout">logout</a>
				</c:otherwise>
				</c:choose>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/join">Join</a> 
				<a class="headerNaviText" href="<%=request.getContextPath()%>/lo/qna">QnA</a> 
				<a class="headerNaviText" href="<%=request.getContextPath()%>/store">Store</a>
				<a class="headerNaviText" href="<%=request.getContextPath()%>/">HOME</a>
			</div>

		</div>
	</div>


</body>
</html>