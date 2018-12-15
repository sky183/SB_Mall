<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="viewData" value="${viewData}"/>

	<table id="orderListTab" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="om0 sorter-false"><input type="checkbox" class="all-check"></th>
				<th class="om1">주문일</th>
				<th class="om2">주문번호</th>
				<th class="om3 sorter-false">회원</th>
				<th class="om4">이름</th>
				<th class="om5">배송지</th>
				<th class="om6">품목</th>
				<th class="om7">결제</th>
				<th class="om8">주문</th>
				<th class="om9">주문금액</th>
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
					<c:forEach var="OrderVO" items="${viewData.objList}">
						<tr>
							<td class="om0"><input type="checkbox" class="check"></td>
							<td class="om1">${OrderVO.orderTime}</td>
							<td class="om2 orderDetailNum" name="${OrderVO.orderDetailNum}">${OrderVO.orderDetailNum}</td>
							<td class="om3">${OrderVO.userSeq}</td>
							<td class="om4">${OrderVO.userName}</td>
							<td class="om5">${OrderVO.orderAddress}</td>
							<td class="om6">${OrderVO.goodsName}</td>
							<td class="om7">
								<c:choose>
									<c:when test="${OrderVO.payment == 0}">
										현금
									</c:when>
									<c:when test="${OrderVO.payment == 1}">
										카드
									</c:when>
								</c:choose>
							</td>
							
							<td class="om8">
								<c:choose>
									<c:when test="${OrderVO.status == 0}">
										입금전
									</c:when>
									<c:when test="${OrderVO.status == 1}">
										결제완료
									</c:when>
									<c:when test="${OrderVO.status == 2}">
										배송준비
									</c:when>
									<c:when test="${OrderVO.status == 3}">
										배송중
									</c:when>
									<c:when test="${OrderVO.status == 4}">
										배송완료
									</c:when>
								</c:choose>
							</td>
							
							<td class="om9">
								<fmt:formatNumber value="${OrderVO.totalAmount}" pattern="#,###"/>
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
	<div class="t-left">
		<span class="fon16 fonb">
			선택한 주문을
		</span>
		<span>
			<select id="changestatus">
				<option value="1" selected="selected">결제완료</option>
				<option value="2">배송준비</option>
				<option value="3">배송중</option>
				<option value="4">배송완료</option>
				<option value="0">입금전</option>
			</select>
		</span>
		<span class="fon16 fonb">
			(으)로
		</span>
		<span>
			<input type="submit" id="update" class="select" value="변경">
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

<script type="text/javascript">



	
	$(document).ready(function(){
		
		//테이블 일부 정렬 비활성
		$(".tablesorter").tablesorter(
				{
				    headers : {
		 		      0 : {sorter : false},
		 		      3 : {sorter : false}
			
				 	}
				}
			);
		
		//loadOrderList.jsp를 불러오는 함수
		function loadOrderList(pageNumber){
			
		 	var startDate = $( "#startDate" ).val();
		 	var endDate = $( "#endDate" ).val();
			var tableName = $('#tableName').val();
			var status = $('#status').val();
			var payment = $('#payment').val();
			var search = $('#search').val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList?startDate=' 
						+ startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber
						+ '&status=' + status + '&payment=' + payment + '&search=' + search,
				type : 'GET',
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#loadOrderList').empty();
					$('#loadOrderList').append(data);
				}
			});
		}
		
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').click(function() {
			var pageNumber = $(this).attr('name');
			loadOrderList(pageNumber);
		});
		
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').click(function() {
			loadOrderList(1);
		});
		
		//all-check를 클릭하면 모든 check가 클릭된다.
		$(".all-check").change(function () {
		    $(".check").prop('checked', $(this).prop("checked"));
		});
				
	

		
	//$(document).ready의 끝
	});
	
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	