<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">

	<!-- 날짜 선택 -->
	<div id="mainHeader">
		<span>
			<button class="preDate fon22"> &lt; </button> 
			<input type="text" id="totalDatepicker" name="date" class="datepicker dateInput fon22 fonb" readOnly value="">
			<button class="nextDate fon22"> &gt; </button> 
		</span>
		<span class="absol">
			<span class="fon12 downButton">다운로드</span>
			<span class="fon12 downButton">프린트</span>
		</span>
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">


$(document).ready(function(){
	
	//input 태그에 오늘 날짜 불러온다.
	$( ".datepicker" ).val(nowString);
	

	//메뉴 및 서브메뉴에 css 적용
	removeActive('#totalReport', 0);
	
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
	    $('img.ui-datepicker-trigger').css('padding-top', '2px');
	    $('img.ui-datepicker-trigger').css('vertical-align', 'top');
	    $('img.ui-datepicker-trigger').css('cursor', 'pointer');
	});
	
	$('.preDate').on('click', function(){
		var preDate = getPreDate($(".datepicker").val());
		$( ".datepicker" ).val(preDate);
	});
	
	$('.nextDate').on('click', function(){
		var nextDate = getNextDate($( ".datepicker" ).val());
		$( ".datepicker" ).val(nextDate);
	});
	

});
</script>