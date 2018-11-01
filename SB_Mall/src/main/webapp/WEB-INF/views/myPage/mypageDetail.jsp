<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MyPage</h1>
	<!--테이블 시작-->
	<table style="padding: 5px 0 5px 0;">
		<tr>
			<th>아이디</th>
			<td>${memberInfo.userId}</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>${memberInfo.userName}</td>
		</tr>
		
		<tr>
			<th>회원등급</th>
			<td>${memberInfo.gradeNum}</td>
		</tr>
		
		<tr>
			<th>마일리지</th>
			<td>${memberInfo.point}</td>
		</tr>
	
		<tr>
			<th>총 구매금액 </th>
			<td>${memberInfo.userAmount}</td>
		</tr>

	</table>



<c:choose>
	<c:when test="${empty orderDetail}">
            등록된 주문이 없습니다.
        </c:when>
	<c:otherwise>
		<div class="px-4">

			<div class="table-wrapper">
				<!--Table-->
				<table class="memList table table-hover mb-0">

					<!--Table head-->
					<thead>
						<tr>

							<th class="th-lg">주문상세번호</th>
							<th class="th-lg">회원번호</th>
							<th class="th-lg">결제수단</th>
							<th class="th-lg">주문시간</th>
							<th class="th-lg">결제금액</th>
							<th class="th-lg">주문상태</th>
						</tr>
					</thead>
					<!--Table head-->

					<!--Table body-->
					<tbody>
						<c:forEach var="order" items="${orderDetail}">
							<tr>
								<td>${order.orderDetailNum}</td>
								<td><a
									href="<%=request.getContextPath()%>/memberInfo/member?userSeq=${order.userSeq}">${order.userSeq}</a>
								</td>
								<td><c:choose>
										<c:when test="${order.payment == 0}">
                                     	           무통장
                                            </c:when>
										<c:otherwise>
                                         	       카드
                                            </c:otherwise>
									</c:choose></td>

								<td>${order.orderTime}</td>
								<td>${order.totalAmount}</td>
								<td style="padding-top: 5px; padding-bottom: 5px; !important">
								<button class="status btn btn-blue-grey"
										name="${order.orderDetailNum}" data-toggle="modal" style="padding: 2px 5px; width: 80px; ">
											<c:choose>
												<c:when test="${order.status == 0}">
                                                     	  입금미확인
                                                    </c:when>
												<c:when test="${order.status == 1}">
                                                   	  결제완료
                                                    </c:when>
												<c:when test="${order.status == 2}">
                         	                 	              배송전
                                                    </c:when>
												<c:when test="${order.status == 3}">
                                                	        배송중
                                                    </c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</button>
									<button class="order memberDelete btn btn-blue-grey"
										name="${order.orderDetailNum}" data-target="#modalCart" style="padding: 2px 5px; width: 80px">
										주문상세</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
				<!--Table-->
				<%-- <nav aria-label="Page navigation example">
					<ul class="pagination pg-dark">
						<c:choose>
							<c:when test="${viewData.currentPageNumber == 1}">
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber}">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber - 1}">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						
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
						
						
						<c:choose>
							<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber + 1}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav> --%>
			</div>
		</div>

	</c:otherwise>
</c:choose>
<script>

$('.status').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/orderDetailStatus/' + $(this).attr('name'),
		dataType : "json",
		error : function(error) {
	        alert("Error!");
	    },
		success : function(orderDetail) {
		/*  alert(orderDetail.status); 
			$('.status[name='+orderDetail.orderDetailNum+']').attr('name', orderDetail.orderDetailNum); */
			
			switch (orderDetail.status) {
			case 0: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("입금미확인");
				break;
			case 1: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("결제완료");
				break;
			case 2: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("배송전");
				break;
			case 3: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("배송중");
				break;

			default:
				$('.status[name='+orderDetail.orderDetailNum+']').prop("disabled", true).html("배송완료");
				break;
			}
		}
	});
});

$('.order').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/orderList/' + $(this).attr('name'),
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});

$('.page').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/orderDetailList?page=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});
</script>


</body>
</html>