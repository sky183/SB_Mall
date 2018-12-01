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
<%@ include file="/WEB-INF/views/admin/include/adminNavi.jsp"%>
<div id="adminWrapper">
		<div id="bottomContent">
			<!--상단메뉴의 끝 하단메뉴의 시작-->
			<!--좌측 메뉴-->
			<div id="leftContent">
				<div class="leftTitle">매출 관리</div>
				<div class="leftMenu link leftActive" id="main">
					총 영업 현황
				</div>
				<div class="leftMenu">
					매출 조회
				</div>
				<ul class="leftSubmenu">
					<li class="link" id="dailySal">-일별 매출</li>
					<li class="link" id="monthlySal">-월별 매출</li>
					<li class="link" id="weeklySal">-주간 매출</li>
					<li class="link" id="hourSal">-시간대별 매출</li>
				</ul>
				<div class="leftMenu link id="budget">
					Budget 관리
				</div>
				<!--좌측메뉴의 끝, 우측메뉴 시작-->
			</div><div id="rightContent">
			</div>

			<!--하단 메뉴의 끝-->
		</div>
		<!--adminWrapper의 끝-->
	</div>
</body>
<script>
$(document).ready(function(){
//영업통계를 불러온다.
$('#rightContent').load('<%=request.getContextPath()%>/admin/adminOperation/main');
//메뉴 클릭시 우측 메뉴 출력

$('.link').click(function(){
	var page = $(this).attr('id');
	var url = '<%=request.getContextPath()%>/admin/adminOperation/' + page;
	$.ajax({
		url : url,
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#rightContent').html(data);
			history.pushState(url, null, '<%=request.getContextPath()%>/admin/adminOperation');
		}
	});
});

$(window).bind("popstate", function(event) {
	//히스토리에 저장된 데이터를 불러온다. 여기서는 url 
	var data = event.originalEvent.state;
	//저장된 url이 있으면 
	if(data){
		$.ajax({
				url : data,
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#rightContent').html(data);
				}
			})
		 } else {
		    // 히스토리에 정보가 없을경우 메인화면으로 보내준다.
		    var url = "<%=request.getContextPath()%>/admin/adminOperation";    
		    $(location).attr('href',url);
		    }
		});

});

</script>
</html>