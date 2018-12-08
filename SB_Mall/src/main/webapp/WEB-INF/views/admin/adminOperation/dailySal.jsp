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
				<input type="text" id="startDate" name="startDate" class="datepicker inputSel bor-non" value="">
				
			</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span>
				<input type="text" id="endDate" name="endDate" class="datepicker inputSel bor-non" value="">
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
	<div id="loadDailySalReport">
	<!-- loadDailySalReport의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		var tableName = $('#tableName').val();
		
		$('#loadDailySalReport').load(
			'<%=request.getContextPath()%>/admin/adminOperation/dailySal/loadDailySalReport?startDate=' + firstDate + '&endDate=' + nowString + '&tableName=' + tableName + '&pageNumber=1'
		);
		
		//input 태그에 오늘 날짜 불러온다.
		$( "#startDate" ).val(firstDate);
		$( "#endDate" ).val(nowString);
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#salReport', '#dailySal');
		
		//데이트 피커
		$(function() {
		    $( ".datepicker" ).datepicker({
		    		dateFormat:'yy.mm.dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
		            , showOn: 'both' // 우측에 달력 icon 을 보인다.
		            , buttonImage: '<%=request.getContextPath()%>/img/calendar.png'  // 우측 달력 icon 의 이미지 패스 
		            , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
		            , changeMonth: true // 월선택 select box 표시 (기본은 false)
		            ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
		            ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
		            ,closeText : "닫기"
		            ,currentText : "오늘"
		    });
		    $('img.ui-datepicker-trigger').css('width', '22px');
		    $('img.ui-datepicker-trigger').css('padding-left', '6px');
		    $('img.ui-datepicker-trigger').css('padding-top', '1px');
		    $('img.ui-datepicker-trigger').css('vertical-align', 'top');
		    $('img.ui-datepicker-trigger').css('cursor', 'pointer');
		});
		
	});
</script>
