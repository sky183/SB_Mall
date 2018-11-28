<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 삽입 -->
<%@ include file="/WEB-INF/views/admin/include/adminheader.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminMain.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminContent.css">
</head>
<body>
	<div id="adminWrapper">
		<%@ include file="/WEB-INF/views/admin/include/adminNavi.jsp"%><div	id="bottomContent">
			<!--상단메뉴의 끝 하단메뉴의 시작-->
			<!--좌측 메뉴-->
			<div id="leftContent">
				<div class="leftTitle">매출 정보</div>
				<br>
				<div class="leftMenu">
					<span class="col1">></span> 매출정보
				</div>
				<ul class="leftSubmenu">
					<li><a href="">-매출정보</a></li>
					<li><a href="">-매출정보</a></li>
					<li><a href="">-매출정보</a></li>
				</ul>
				<div class="leftMenu">
					<span class="col1">></span> 매출정보
				</div>
				<ul class="leftSubmenu">
					<li><a href="">매출정보</a></li>
					<li><a href="">매출정보</a></li>
					<li><a href="">매출정보</a></li>
				</ul>
				<div class="leftMenulast">
					<span class="col1">></span> <a href="">매출</a>
				</div>
				<!--좌측메뉴의 끝, 우측메뉴 시작-->
			</div><div id="rightContent">
				<div id="menuTitle" class="fonb">매출정보 > 매출 정보</div>
				<div id="mainContent"></div>
			</div>

			<!--하단 메뉴의 끝-->
		</div>
		<!--adminWrapper의 끝-->
	</div>
</body>

</html>