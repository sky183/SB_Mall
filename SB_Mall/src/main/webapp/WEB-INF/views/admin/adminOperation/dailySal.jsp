<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<span class="fon16 fonb">
		기간 조회
		</span>
		<span class="seldate">
			<span>
				<input type="text" id="startDate" name="startDate" class="datepicker bor-non" value="2018.11.01">
			</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span>
				<input type="text" id="endDate" name="endDate" class="datepicker bor-non" value="2018.11.30">
			</span>
		</span>
		<span>
			<select>
				<option>전체</option>
				<option>일반주문</option>
				<option>크라우드펀딩</option>
			</select>
		</span>
		<span>
			<input type="submit" class="select" value="조회">
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
		<table id="dailySalTab" class="resultTab">
			<thead>
				<tr>
					<th class="ds1">날짜</th>
					<th class="ds2">주문수</th>
					<th class="ds3">방문자</th>
					<th class="ds4">매출</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr>
					<td class="ds1">2018.11.01</td>
					<td class="ds2">20000</td>
					<td class="ds3">20000</td>
					<td class="ds4">20,000,000,000</td>
				</tr>
				<tr class="bor-non">
					<td colspan="4" class="t-right">
						<span class="toResult">
							<span>총 매출</span>
							<span>200,000,000,000</span>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	<!-- mainBottom의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	//input 태그에 오늘 날짜 불러온다.
	$( "#startDate" ).val(firstDate);
	$( "#endDate" ).val(lastDate);
	
	//메뉴 및 서브메뉴에 css 적용
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