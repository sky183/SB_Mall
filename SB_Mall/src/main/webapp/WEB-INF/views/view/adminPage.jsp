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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
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
	
	<div id="navi">
	
		<div class="align-right">
		
			<h5>이번달 매출 : <fmt:formatNumber value="${salAmount.get(0)}" pattern="#,###"/>원</h5>
		
		</div>
		
		<div class="align-right">
		
		</div>
		
		<h5>지난달 매출 : <fmt:formatNumber value="${salAmount.get(1)}" pattern="#,###"/>원</h5>
		
	<!-- navi의 끝 -->
	</div>
	
	<div id="content">
	
	<!-- content의 끝 -->
	</div>
	
<!-- adminWrapper의 끝 -->
</div>
</body>
</html>