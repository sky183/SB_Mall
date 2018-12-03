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
<!--화면 높이를 가져오기 위해 필수로 추가-->
 <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1,maximum-scale=1, user-scalable=no" />
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
	
	
<!-- 	// jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
</head>
<script>
//화면 크기 줄일 경우 높이를 다시 맞춰주는 함수
/* function resize(){
    var h = $(window).height();
    $('#leftContent').css({'height':(h-58)+'px'});
} */

$('document').ready(function(){
/* 	resize();
	window.onresize = resize; */
    //좌측 메뉴 클릭시 서브메뉴 토글
    $('.leftMenu, .leftMenulast').on('click', function(){
        $(this).next('.leftSubmenu').slideToggle();
    })
/*document.ready의 끝*/  
})
</script>
