<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader">
		<span>
			<button class="preDate fon22" name="preDate"> &lt; </button> 
			<input type="text" id="budgetDatepicker" name="year" class="datepicker dateInput fon22 fonb" readOnly value="2018">
			<button class="nextDate fon22" name="nextDate"> &gt; </button> 
		</span>
		<span class="absol">
			<span class="fon12 downButton">다운로드</span>
			<span class="fon12 downButton">프린트</span>
		</span>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="mainBottom">
		<form id="budgetModify">
			<div id="loadBudgetReport">
<!-- 				loadBudgetReport.jsp를 불러온다. -->
			</div>
		</form>
		
	<!-- mainBottom의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#loadBudgetReport').load('<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport?nowYear=' + nowYear);
	
	//input 태그에 오늘 년도를 불러온다.
	$( ".datepicker" ).val(nowYear);
	
	//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
	removeActive('#budget', 0);
	
	//데이트 피커
	$(function() {
	    $( ".datepicker" ).datepicker({
	    	dateFormat:'yy' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
	            , showOn: 'both' // 우측에 달력 icon 을 보인다.
	            , buttonImage: '<%=request.getContextPath()%>/img/calendar.png'  // 우측 달력 icon 의 이미지 패스 
	            , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
// 	            , changeMonth: true // 월선택 select box 표시 (기본은 false)
	            ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	            ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	            ,closeText : "닫기"
	            ,currentText : "오늘"
	    });
	    $('img.ui-datepicker-trigger').css('width', '22px');
	    $('img.ui-datepicker-trigger').css('padding-left', '6px');
	    $('img.ui-datepicker-trigger').css('padding-top', '2px');
	    $('img.ui-datepicker-trigger').css('vertical-align', 'top');
	    $('img.ui-datepicker-trigger').css('cursor', 'pointer');
	});
	
	//이전 날짜 선택시 날짜 바꿔서 ajax 처리
	$('.preDate, .nextDate').on('click', function(){
		var preYear = Number($(".datepicker").val()) - 1;
		var nextYear = Number($(".datepicker").val()) + 1;
		var nowYearDate;
		if ($(this).attr('name') == 'preDate' ) {
			$( ".datepicker" ).val(preYear);
			nowYearDate = preYear;
		} else {
			$( ".datepicker" ).val(nextYear);
			nowYearDate = nextYear;
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport?nowYear=' + nowYearDate,
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#loadBudgetReport').html(data);
			}
		});
	});
	
	//날짜 변경시 ajax 처리
	$('.datepicker').on('change', function(){
		var nowYearDate = $(".datepicker").val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport?nowYear=' + nowYearDate,
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#loadBudgetReport').html(data);
			}
		});
		
	});

});
</script>