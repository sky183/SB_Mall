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
				<div class="leftTitle">영업 관리</div>
				<div class="leftMenu">
					<span class="col1">> </span><a href="<%=request.getContextPath()%>/admin/adminOperation"> 영업 통계</a>
				</div>
				<div class="leftMenu">
					<span class="col1">> </span> 매출 관리
				</div>
				<ul class="leftSubmenu none">
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/salTotal">-총 매출 정보</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/budget">-매출 Budget 관리</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/dailySal">-일별 매출 정보</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/monthlySal">-월별 매출정보</a></li>
				</ul>
				<div class="leftMenulast">
					<span class="col1">> </span> 접속 관리
				</div>
				<ul class="leftSubmenu none">
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/dailyVisit">일별 접속</a></li>
					<li><a href="<%=request.getContextPath()%>/admin/adminOperation/monthlyVisit">월별 접속</a></li>
				</ul>
				<!--좌측메뉴의 끝, 우측메뉴 시작-->
			</div><div id="rightContent">
				<div id="menuTitle" class="fonb">영업 관리 > 영업 통계</div>
				<div id="mainContent"></div>
			</div>

			<!--하단 메뉴의 끝-->
		</div>
		<!--adminWrapper의 끝-->
	</div>
</body>

</html>