<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<style>
	.form-control {
		text-align: center;
	}
	
	#wrapper {
	width : 1200px;
	margin: 100px auto 50px auto;
	
}
</style>
</head>
<body>
<div id="wrapper">
	<div style="margin: 30px auto 20px auto; width: 600px; margin-bottom: 60px;">
	
    <p class="h4 mb-4" style="text-align: center;">MyPage</p>

    <small class="form-text text-muted mb-1">
     	  회원 아이디
    </small>
    <input type="email" id="defaultRegisterFormEmail" class="form-control mb-2" value="${memberInfo.userId}" readonly>

    <small class="form-text text-muted mb-1">
     	  회원이름
    </small>
    <input type="text"  class="form-control mb-2" value="${memberInfo.userName}" readonly>
    
    <small class="form-text text-muted mb-1">
     	 회원등급
    </small>
    <c:choose>
    <c:when test="${memberInfo.gradeNum == 0}">
         <input type="text" class="form-control mb-2" value="불가촉천민" readonly>
    </c:when>
    <c:when test="${memberInfo.gradeNum == 1}">
         <input type="text" class="form-control mb-2" value="평민" readonly>
    </c:when>
    <c:when test="${memberInfo.gradeNum == 2}">
   		 <input type="text" class="form-control mb-2" value="귀족" readonly> 
    </c:when>
    <c:when test="${memberInfo.gradeNum == 3}">
   		 <input type="text" class="form-control mb-2" value="다이아" readonly>
    </c:when>
    <c:when test="${memberInfo.gradeNum == 4}">
   		 <input type="text" class="form-control mb-2" value="그랜드마스터" readonly>
    </c:when>    
    </c:choose>
   
    <small class="form-text text-muted mb-1">
     	 마일리지
    </small>
    <input type="text" class="form-control mb-2" value="${memberInfo.point}원" readonly>
   
    <small class="form-text text-muted mb-1">
     	총 구매금액 
    </small>
    <input type="text" class="form-control mb-4" value="${memberInfo.userAmount}원" readonly>
    <!-- Sign up button -->
    <button class="memberModify btn btn-info my-4 btn-block" name="${member.userId}" grade="${member.gradeNum}"
    	data-toggle="modal" data-target="#modalCart">수정하기</button>
    	
    <button class="memberDelete btn btn-info my-4 btn-block" name="${member.userId}" grade="${member.gradeNum}">탈퇴하기</button>
    <hr>
    </div>
    


<c:choose>
	<c:when test="${empty orderDetail}">
    </c:when>
	<c:otherwise>
		<p class="h4 mb-4" style="text-align: center;">내 주문내역</p>
		<div class="px-1">

			<div class="table-wrapper" style="width: 700px; text-align: center; margin: 0 auto;">
				<!--Table-->
				<table class="memList table table-hover mb-0" style="margin-left: auto;">

					<!--Table head-->
					<thead>
						<tr>

							<th class="th-lg">주문상세번호</th>
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
										name="${order.orderDetailNum}" style="padding: 2px 5px; width: 80px;" disabled>
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
													배송완료
												</c:otherwise>
											</c:choose>
										</button>
							<button class="order btn btn-blue-grey"
										name="${order.orderDetailNum}" data-toggle="modal" data-target="#modalOrder" style="padding: 2px 5px; width: 80px">
										주문상세</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
				
			</div>
		</div>

	</c:otherwise>
</c:choose>

</div>
<!-- Card -->

<!-- Modal: 주문상세 -->
<div class="modal fade" id="modalOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" style="max-width: 900px !important; margin: 30px auto !important;" role="document">
    <div class="modal-content"">
      <!--Header-->
      <div class="modal-header" style="border: none">
        <h4 class="modal-title" id="myModalLabel">주문 내역</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
    <div class="modal-body">
            <table id="popupOrder" class="table table-hover">
            
            </table>
       </div>
      <!--Footer-->
      <div class="modal-footer">
        <input type="button" class="btn btn-outline-primary" data-dismiss="modal" value="닫기">
      </div>
		
    </div>
  </div>
</div>

<!-- Modal: 회원수정 -->
<div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header" style="border: none">
        <h4 class="modal-title" id="myModalLabel">회원 수정</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
	<form id="memberModify">
    <div class="modal-body">
            <table id="popup" class="table table-hover">
            </table>
       </div>
      <!--Footer-->
      <div class="modal-footer">
        <input type="button" class="btn btn-outline-primary" data-dismiss="modal" value="닫기">
        <input type="button" id="modifyButton" class="btn btn-primary" data-dismiss="modal" value="수정">
      </div>
		
	</form>
    </div>
  </div>
</div>


<script>

$('.order').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/order/orderList/' + $(this).attr('name'),
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#popupOrder').html(data);
		}
	});
});

//회원 수정버튼

$('.memberModify').click(function() {
		$.ajax({
		url : '<%=request.getContextPath()%>/member/memberModify?userId=' +  '${memberInfo.userId}',
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("장난치삼?");
	    },
		success : function(data) {
			$('#popup').html(data);
		}
	});
});

$('#modifyButton').click(function() {
	$.ajax({
		url : '<%= request.getContextPath() %>/member/memberModify',
		type : 'POST',
		data : $('#memberModify').serialize(),
		error : function(error) {
			alert("장난치삼?");
	    },
		success : function(result) {
			alert(result);
		}
	});
	
});

//회원 삭제버튼
$('.memberDelete').click(function() {
	var del = confirm('정말 탈퇴하시겠습니까? 후회하실텐데?');
	
	if (del) {
	$.ajax({
		url : '<%=request.getContextPath()%>/member/memberDelete?userId=' +  '${memberInfo.userId}',
		error : function(error) {
			alert("장난치삼?");
	    },
		success : function(result) {
			alert(result);
			$('#viewList').empty();
			$('#viewList').load('<%=request.getContextPath()%>' + '/memberList');  
		}
	});
	}
});

</script>


<!-- Header -->
<jsp:include page="../views/common/header.jsp"/>

</body>
</html>