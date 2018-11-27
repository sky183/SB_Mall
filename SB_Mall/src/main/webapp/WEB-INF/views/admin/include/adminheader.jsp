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
<!-- 캘린더 객체 생성 -->
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script src="<%=request.getContextPath()%>/jui/jui/lib/jquery-1.8.0.min.js"></script>
	   	<!-- Basic style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui-jennifer.min.css" />
	
	<!-- Grid style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid-jennifer.min.css" />
	
	<!-- Required script files -->
	<script src="<%=request.getContextPath()%>/jui/jui/lib/jquery-1.8.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	
	<!-- Basic script components -->
	<script src="<%=request.getContextPath()%>/jui/jui/dist/ui.min.js"></script>
	
	<!-- Grid script components -->
	<script src="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-chart/dist/chart.js"></script>
</head>
