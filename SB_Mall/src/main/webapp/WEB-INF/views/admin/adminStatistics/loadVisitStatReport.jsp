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
					<c:forEach var="SalVO" items="${viewData.objList}">
						<script type="text/javascript">
							totalAmount += Number(${SalVO.amount});
						</script>
						<tr>
							<td class="ds1">${SalVO.orderTime}</td>
							<td class="ds2">${SalVO.orderCount} 건</td>
							<td class="ds3">${SalVO.visitCount} 명</td>
							<td class="ds4">
								<fmt:formatNumber value="${SalVO.amount}" pattern="#,###"/>
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
						<li class="page-item active" style="back"><a id="currentPage" class="page-link" name="1">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="1"
							end="${viewData.pageTotalCount}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active" style="back"><a id="currentPage" class="page page-link"
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
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	