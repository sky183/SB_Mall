<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader">
		<span>
			<b class="preDate fon22"> &lt; </b> 
			<input type="text" id="budgetDatepicker" name="year" class="datepicker dateInput fon22 fonb" readOnly value="2018">
			<b class="nextDate fon22"> &gt; </b> 
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
		<form action="" method="post">
			<div class="space">
				<!-- 1월 -->
				<div class="monthLabel">
					<div>Jan</div>
					<hr>
					<div><input type="text" name="Jan" value="2,000,000,000" disabled></div>
				</div>
				<!-- 2월 -->
				<div class="monthLabel">
					<div>Feb</div>
					<hr>
					<div><input type="text" name="Feb" value="2,000,000,000" disabled></div>
				</div>
				<!-- 3월 -->
				<div class="monthLabel">
					<div>Mar</div>
					<hr>
					<div><input type="text" name="Mar" value="2,000,000,000" disabled></div>
				</div>
				<!-- 4월 -->
				<div class="monthLabel">
					<div>Apr</div>
					<hr>
					<div><input type="text" name="Apr" value="2,000,000,000" disabled></div>
				</div>
			</div>
			
			<div class="space">
				<!-- 5월 -->
				<div class="monthLabel">
					<div>May</div>
					<hr>
					<div><input type="text" name="May" value="2,000,000,000" disabled></div>
				</div>
				<!-- 6월 -->
				<div class="monthLabel">
					<div>Jun</div>
					<hr>
					<div><input type="text" name="Jun" value="2,000,000,000" disabled></div>
				</div>
				<!-- 7월 -->
				<div class="monthLabel">
					<div>Jul</div>
					<hr>
					<div><input type="text" name="Jul" value="2,000,000,000" disabled></div>
				</div>
				<!-- 8월 -->
				<div class="monthLabel">
					<div>Aug</div>
					<hr>
					<div><input type="text" name="Aug" value="2,000,000,000" disabled></div>
				</div>
			</div>
			
			<div class="space">
				<!-- 9월 -->
				<div class="monthLabel">
					<div>Sep</div>
					<hr>
					<div><input type="text" name="Sep" value="2,000,000,000" disabled></div>
				</div>
				<!-- 10월 -->
				<div class="monthLabel">
					<div>Oct</div>
					<hr>
					<div><input type="text" name="Oct" value="2,000,000,000" disabled></div>
				</div>
				<!-- 11월 -->
				<div class="monthLabel">
					<div>Nov</div>
					<hr>
					<div><input type="text" name="Nov" value="2,000,000,000" disabled></div>
				</div>
				<!-- 12월 -->
				<div class="monthLabel">
					<div>Dec</div>
					<hr>
					<div><input type="text" name="Dec" value="2,000,000,000" disabled></div>
				</div>
			</div>
			<div class="budgetResult">
				<span id="budgetSubmit" class="toInput fl-right none">
					입력완료
				</span>
				<span id="budgetInput" class="toInput fl-right">
					수정하기
				</span>
				<span class="fl-right">
					<span class="toResult">
						<span>총 매출</span>
						<span>200,000,000,000</span>
					</span>
				</span>
			</div>
		</form>
		
	<!-- mainBottom의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	//input 태그에 오늘 날짜 불러온다.
	$( ".datepicker" ).val(new Date().format("yyyy"));
	
	//메뉴 및 서브메뉴에 css 적용
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
	
	//버젯 입력 input disabled 해제
	$('#budgetInput').click(function(){
		$('.monthLabel input').attr( 'disabled', false );
		$('.monthLabel input').addClass('inputActive');
		$(this).addClass('none');
		$('#budgetSubmit').removeClass('none');
	});
	
	//버젯 입력 Submit 하고 input disabled 적용
	$('#budgetSubmit').click(function(){
		$('.monthLabel input').attr( 'disabled', true );
		$('.monthLabel input').removeClass('inputActive');
		$(this).addClass('none');
		$('#budgetInput').removeClass('none');
// 		$ajax(){
// 		}
	});

});
</script>