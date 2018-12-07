<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	var totalAmount= 0;
</script>
<c:set var="viewData" value="${viewData}"/>

	<table id="dailySalTab" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="ds1">날짜</th>
				<th class="ds2">주문수</th>
				<th class="ds3">방문자</th>
				<th class="ds4">매출</th>
				<th class="notsorter"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${viewData.isEmpty()}">
					<tr>
						<td colspan="5" style="text-align: center; padding: 120px 0;">등록된 주문이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dailySalVO" items="${viewData.objList}">
						<script type="text/javascript">
							totalAmount += Number(${dailySalVO.dailyAmount});
						</script>
						<tr>
							<td class="ds1">${dailySalVO.orderTime}</td>
							<td class="ds2">${dailySalVO.orderCount} 건</td>
							<td class="ds3">${dailySalVO.visitCount} 명</td>
							<td class="ds4">
								<fmt:formatNumber value="${dailySalVO.dailyAmount}" pattern="#,###"/>
								원
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>
	<div class="t-right">
		<span class="toResult">
			<span>총 매출</span>
			<span id="totalAmount"></span>
		</span>
	</div>
<!-- 	페이징 처리 -->
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
		<nav aria-label="Page navigation example">
			<ul class="pagination pg-dark">
				<c:choose>
					<c:when test="${viewData.currentPageNumber == 1}">
						<li class="page-item"><a class="page-link">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber - 1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.pageTotalCount == 1}">
						<li class="page-item active" style="back"><a class="page-link">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="1"
							end="${viewData.pageTotalCount}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active" style="back"><a class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber + 1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>
	
<script type="text/javascript">

	//loadDailySalReport.jsp를 불러오는 함수
	function loadDailySalReport(pageNumber){
	 	var startDate = $( "#startDate" ).val();
	 	var endDate = $( "#endDate" ).val();
		var tableName = $('#tableName').val();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/dailySal/loadDailySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber,
			type : 'GET',
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#loadDailySalReport').empty();
				$('#loadDailySalReport').append(data);
			}
		});
	}

	
	$(document).ready(function(){
		
		//총합을 출력한다.
		$('#totalAmount').text(comma(totalAmount));
		
		//일반 주문과 크라우드 펀딩 셀렉트가 변경되면 다시 불러온다.
// 		$('#tableName').on('change', function(){
// 			 loadDailySalReport(1);
// 		 });
	
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').click(function() {
			var pageNumber = $(this).attr('name');
			loadDailySalReport(pageNumber);
		});
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').click(function() {
			loadDailySalReport(1);
		});
			
			
		
	//$(document).ready의 끝
	});
	
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	