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
				<input type="text" id="startDate" name="startDate" class="datepicker1 bor-non" value="2018.11">
				<img class="monthButton1" alt="" src="../img/calendar.png">
			</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span>
				<input type="text" id="endDate" name="endDate" class="datepicker2 bor-non" value="2018.11">
				<img class="monthButton2" alt="" src="../img/calendar.png">
			</span>
		</span>
		<span>
			<select>
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

//input 태그에 오늘 날짜 불러온다.
$( "#startDate" ).val(now.format("yyyy.01"));
$( "#endDate" ).val(now.format("yyyy.MM"));

$(document).ready(function(){
	
// 	//datepicker 선택시 글자 전체선택한다.
	datepickerSel();

	//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
	removeActive('#salReport', '#monthlySal');
	
	//month 피커
    $(".datepicker1, .datepicker2").monthpicker({ 
    	pattern : 'yyyy.mm',
   	});
    $('.monthButton1').bind('click', function(){
    	$(".datepicker1").monthpicker('show');
    });
    $('.monthButton2').bind('click', function(){
    	$(".datepicker2").monthpicker('show');
    });

});
</script>