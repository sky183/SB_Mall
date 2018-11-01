<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
h2 {
	padding: 10px;
}

table {
	margin-top: 10px;
}

td {
	padding: 10px 0px;
	text-align: center;
}

#memberPhoto {
	background-size: 100%;
	width: 150px;
	height: 150px;
	border: 1px solid #333333;
	margin: 20px 0;
}

#adminWrapper {
	margin: 100px 80px 50px 80px;
}


#popup th, #popup td{
	padding: 8px;
} 

</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="adminWrapper">
		<h1>매출 현황</h1>
		<script type=>
		var d = new Date();
		document.write('<h2>' + (d.getFullYear()) + '년 </h2>');
		document.write('<h2>' + (d.getMonth() + 1) + '월 </h2>');
		</script>
		
		<h2>이번달 매출 : <fmt:formatNumber value="${thisMonth}" pattern=",###"/>원</h2>
		<h2>지난달 매출 : <fmt:formatNumber value="${preMonth}" pattern="#,###"/>원</h2>
		<h2>이번달 평균 : <fmt:formatNumber value="${thisMonthAverage}" pattern="##.##"/>원</h2>
		<hr>
		<button id="memberList">회원관리</button>
		<button id="orderList">주문관리</button>
		<div id="viewList"></div>

<!-- Modal: modalCart -->
<div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
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
		</div>



		<!-- adminWrapper의 끝 -->
	</div>

	<script>

	$(document).ready(function() {
		/* 기본 뷰타입으로 불러온다. */
		$('#viewList').load('<%=request.getContextPath()%>' + '/orderDetailList');  
		
		$('#memberList').click(function() {
				$.ajax({
					url : '<%=request.getContextPath()%>' + '/memberList',
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
		
		$('#orderList').click(function() {
				$.ajax({
					url : '<%=request.getContextPath()%>' + '/orderDetailList',
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
		
		
		$('#modifyButton').click(function() {
			var memberModify = $('#memberModify').serialize();
			var sessionGrade = '${memberInfo.gradeNum}';
			var gradeNum = $('input[name=gradeNum]').val();
			if (gradeNum >= 3 && sessionGrade < 4) {
				alert("회원등급 3 이상은 그랜드마스터만 가능합니다.");
			} else if (gradeNum > 4) {
				alert("회원등급은 4 까지만 존재합니다.");
			} else {
			$.ajax({
				url : '<%= request.getContextPath() %>/memberModify_end',
				type : 'POST',
				data : memberModify,
				error : function(error) {
			        alert("Error!");
			    },
				success : function(result) {
					alert(result);
				}
			});
			
			}
		});
		
		/* $(document).ready의 끝 */
	});


</script>

</body>
</html>