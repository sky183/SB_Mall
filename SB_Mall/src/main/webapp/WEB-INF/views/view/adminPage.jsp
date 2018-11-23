<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>

<%
Calendar cal = Calendar.getInstance();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
ArrayList<Object> monthArr = new ArrayList<Object>();

	for(int i=0; i <= 11; i++) {
		
		if(i > 0){
		cal.add(cal.MONTH, -1);
		} else {
			cal.add(cal.MONTH, 0);
		}
		String year = dateFormat.format(cal.getTime()).substring(0,4);
		String month = dateFormat.format(cal.getTime()).substring(4,6);
		
		request.setAttribute("year"+ i, year);
		request.setAttribute("month"+ i, month);
		monthArr.add(month);
}
		request.setAttribute("monthArr", monthArr);
		
		//숫자를 소수점 버리고 포맷 변환하는 함수
		double val = 1234525635.12;
		DecimalFormat numFormat = new DecimalFormat(",###");
		/* System.out.println(numFormat.format(val)); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" >
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	//자바스크립트로 소수점 버리고 포맷 변환하는 함수
	function numFormat(x) {
		var num = ${salAmount.get(x)};
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div id="adminWrapper">

	<div id="left-content" class="inline-block fixed">
	
		<div id="navigation" class="text-center">
			<div class="background3"><a href="<%=request.getContextPath()%>/admin/adminPage" class="color-white">메인</a></div>
			<div><a href="<%=request.getContextPath()%>/admin/visit">접속통계</a></div>
			<div><a href="<%=request.getContextPath()%>/admin/order">주문관리</a></div>
			<div><a href="<%=request.getContextPath()%>/admin/sales">매출관리</a></div>
			<div><a href="<%=request.getContextPath()%>/admin/member">회원관리</a></div>
			<div><a href="<%=request.getContextPath()%>/admin/staff">직원관리</a></div>
		</div>
		 
		<div id="report" class="text-center">
			<div class="text-center inline-block result-left background3">
				<div class="today-visit display-table width100">
					<h5 class="vertical-middle display-cell color-white">오늘 방문자</h5>
				</div>
				
				<div class="visit-value display-table width100 border-white background7">
					<h5 class="vertical-middle display-cell"><fmt:formatNumber value="${admin.visitToday}" pattern="#,###"/>명</h5>
				</div>
			
			</div><div class="text-center inline-block result-left background4">
				<div class="today-join display-table width100">
					<h5 class="vertical-middle display-cell color-white">오늘 가입자</h5>
				</div>
				
				<div class="join-value display-table width100 border-white background7">
					<h5 class="vertical-middle display-cell"><fmt:formatNumber value="${admin.joinToday}" pattern="#,###"/>명</h5>
				</div>
			</div>
			
			<div class="salesBox">
			
				<div class="text-left inline-block item">
					<h5 class="color1">총 주문수</h5>
				</div>
				<div class="text-left inline-block color1">
					:
				</div>
				<div class="text-right inline-block value color1">
					<h5><fmt:formatNumber value="${admin.orderTotal}" pattern="#,###"/>건</h5>
				</div>
				
				<c:forEach items="${admin.orderStatus}" var="statusMap" end="4">
					<div class="text-left inline-block item ">
						<h5>
							<c:choose>
									<c:when test="${statusMap.status == 0}">
										결제전
									</c:when>
									<c:when test="${statusMap.status == 1}">
										결제완료
									</c:when>
									<c:when test="${statusMap.status == 2}">
										배송준비
									</c:when>
									<c:when test="${statusMap.status == 3}">
										배송중
									</c:when>
									<c:when test="${statusMap.status == 4}">
										배송완료				
									</c:when>
						     </c:choose>
					     </h5>
					</div>
					<div class="text-left inline-block ">
						:
					</div>
					<div class="text-right inline-block value">
						 <h5><fmt:formatNumber value="${statusMap.count}" pattern="#,###"/>건</h5>
					</div>
				</c:forEach>
				
			</div>
		</div>
		
	<!-- left-content 의 끝 -->
	</div>
	
	
	
	<div id="right-content" class="inline-block">
	
		<div id="header-content">
			
			<div class="top-report">
								
				<div class="report-box">
					<div class="icon-box">
						아이콘
					</div>
					
					<div class="result-box">
						<div class="this-result">
							<h5>오늘의 주문수 : <fmt:formatNumber value="${admin.orderToday}" pattern="#,###"/>건</h5>
						</div>
						
						<div class="pre-result">
							<h5>어제의 주문수 : <fmt:formatNumber value="${admin.orderPreday}" pattern="#,###"/>건</h5>
						</div>
					</div>
				</div>
				
				<div class="report-box">
					<div class="icon-box">
						아이콘
					</div>
					
					<div class="result-box">
						<div class="this-result">
							<h5>오늘의 매출 : <fmt:formatNumber value="${admin.salesToday}" pattern="#,###"/>원</h5>
						</div>
							
						<div class="pre-result">
							<h5>어제의 매출 : <fmt:formatNumber value="${admin.salesPreday}" pattern="#,###"/>원</h5>
						</div>
					</div>
				</div>
				
				<div class="report-box">
					<div class="icon-box">
						아이콘
					</div>
					
					<div class="result-box">
						<div class="this-result">
							<h5>${month0}월 매출 : <fmt:formatNumber value="${admin.salesThisMonth}" pattern="#,###"/>원</h5>
						</div>
						
						<div class="pre-result">
							<h5>${month1}월 매출 : <fmt:formatNumber value="${admin.salesPreMonth}" pattern="#,###"/>원</h5>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="bottom-report">
			
			</div>
			
		</div>
		
		<div id="main-content">
		
			<div id="left-innercont">
									
			</div>
			
			<div id="right-innercont">
				<h5>지난달 매출 : <fmt:formatNumber value="${salAmount.get(1)}" pattern="#,###"/>원</h5>
				<h5>총 방문자 : <fmt:formatNumber value="${admin.visitTotal}" pattern="#,###"/>명</h5>
				<h5>오늘의 방문자 : <fmt:formatNumber value="${admin.visitToday}" pattern="#,###"/>명</h5>
				<h5>어제의 방문자 : <fmt:formatNumber value="${admin.visitPreday}" pattern="#,###"/>명</h5>
				<h5>오늘의 주문수 : <fmt:formatNumber value="${admin.orderToday}" pattern="#,###"/>건</h5>
				<h5>어제의 주문수 : <fmt:formatNumber value="${admin.orderPreday}" pattern="#,###"/>건</h5>
				<h5>오늘의 매출 : <fmt:formatNumber value="${admin.salesToday}" pattern="#,###"/>원</h5>
				<h5>어제의 매출 : <fmt:formatNumber value="${admin.salesPreday}" pattern="#,###"/>원</h5>
				<h5>${month0}월 매출 : <fmt:formatNumber value="${admin.salesThisMonth}" pattern="#,###"/>원</h5>
				<h5>${month0}월 평균매출 : <fmt:formatNumber value="${admin.averageThisMonth}" pattern="#,###"/>원</h5>
				<c:forEach items="${admin.orderStatus}" var="statusMap">
					<h5>
					<c:choose>
						<c:when test="${statusMap.status == 0}">
							결제전
						</c:when>
						<c:when test="${statusMap.status == 1}">
							결제완료
						</c:when>
						<c:when test="${statusMap.status == 2}">
							배송준비
						</c:when>
						<c:when test="${statusMap.status == 3}">
							배송중
						</c:when>
						<c:when test="${statusMap.status == 4}">
							배송완료				
						</c:when>
			     </c:choose>
					 : <fmt:formatNumber value="${statusMap.count}" pattern="#,###"/>건</h5>
				</c:forEach>
				<h5>오늘의 가입자 : <fmt:formatNumber value="${admin.joinToday}" pattern="#,###"/>명</h5>
				<h5>어제의 가입자 : <fmt:formatNumber value="${admin.joinPreDay}" pattern="#,###"/>명</h5>
			<!-- right-innercont의 끝 -->
			</div>
			
		<!-- main-content 의 끝 -->
		</div>
		
	<!-- right-content의 끝 -->
	</div>
	
<!-- adminWrapper의 끝 -->
</div>
</body>
</html>