<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<span class="fon16 fonb">
		기간 조회
		</span>
		<span class="seldate">
			<span>
				<input type="text" id="startDate" name="startDate" class="datepicker1 inputSel bor-non" value="">
				<img class="monthButton1" alt="" src="../img/calendar.png">
			</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span>
				<input type="text" id="endDate" name="endDate" class="datepicker2 inputSel bor-non" value="">
				<img class="monthButton2" alt="" src="../img/calendar.png">
			</span>
		</span>
		<span>
			<select id="tableName">
				<option value="OrderDetail" selected="selected">일반주문</option>
				<option value="CrowdOrderDetail">크라우드펀딩</option>
			</select>
		</span>
		<span>
			<input type="submit" id="select" class="select" value="조회">
		</span>
		<span class="absol">
			<span id="excel" class="fon12 downButton">다운로드</span>
			<span id="print" class="fon12 downButton">프린트</span>
		</span>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id=loadMonthlySalReport>
	<!-- loadMonthlySalReport의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var tableName = $('#tableName').val();
		var startDate = getFistDate(firstMonth);
		var endDate = getLastDate(nowMonth);
		
		$('#loadMonthlySalReport').load(
			'<%=request.getContextPath()%>/admin/adminOperation/monthlySal/loadMonthlySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName=' + tableName + '&pageNumber=1'
		);
		
		//input 태그에 오늘 날짜 불러온다.
		$( "#startDate" ).val(firstMonth);
		$( "#endDate" ).val(nowMonth);
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#salReport', '#monthlySal');
		
		//month 피커
	    $(".datepicker1, .datepicker2").monthpicker({ 
	    	pattern : 'yyyy.mm',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	   	});
	    $('.monthButton1').bind('click', function(){
	    	$(".datepicker1").monthpicker('show');
	    });
	    $('.monthButton2').bind('click', function(){
	    	$(".datepicker2").monthpicker('show');
	    });
	
	});
</script>
