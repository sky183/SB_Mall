<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 중단 당일 통계 리포트-->
<div id="mainMid">
	<div id="dashbord">
		<ul>
			<li class="statTopReport">
				<div class="utitle fon13">오늘 방문수</div> <strong class="uresult">${visitStatVO.dayCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTime} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="statTopReport uitem">
				<div class="utitle">월간 방문수</div> <strong class="uresult">${visitStatVO.monthCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTime} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="statTopReport uitem">
				<div class="utitle">연간 방문수</div> <strong class="uresult">${visitStatVO.yearCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTime} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>
	<!-- mainMid의 끝 -->
</div>

<!-- 하단 그래프 삽입-->
<div id="mainBottom">

	<div id="component">
		<ul>
			<li id="fifthVisit" class="umenu uactive">최근 15일간</li>
			<li id="hourlyVisit" class="umenu">시간대별</li>
			<li id="monthlyVisit" class="umenu">월별</li>
		</ul>
	</div>

	<div class="chartwrap"></div>

	<!-- salesReport의 끝 -->
</div>

<script type="text/javascript">
//component에 선택된 아이템을 색깔 변경해주는 것
function removeUactive(id){
	//클래스 제거
	$('.umenu').removeClass('uactive');
	//현재 페이지 메뉴에 css를 먹인다.
	$(id).addClass('uactive');
}

function fifthChart(){
	
}

$(document).ready(function(){
	$('#fifthVisit, #hourlyVisit, #monthlyVisit').on('click', function () {
		switch($(this).attr('id')){
		case 'fifthVisit' : fifthChart()
			break;
		case 'hourlyVisit' : hourlyChart()
			break;	
		case 'monthlyVisit' : monthlyChart()
			break;
		}
		
	});
	
})
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>
