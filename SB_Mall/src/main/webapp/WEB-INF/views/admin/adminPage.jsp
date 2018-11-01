<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Calendar cal = Calendar.getInstance();

cal.add(cal.MONTH, 0);

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");

String year = dateFormat.format(cal.getTime()).substring(0,4);

String month = dateFormat.format(cal.getTime()).substring(4,6);

request.setAttribute("year", year);

request.setAttribute("month", month);

%>
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

#adminWrapper {
	width : 1200px;
	margin: 100px auto 50px auto;
}

#popup th, #popup td{
	padding: 12px;
} 

table .th-lg, table td {
    min-width: 5rem;
    padding-left: 0.3rem;
    padding-right: 0.3rem;
}

</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['월별', '매출액(단위:만원)'],
          ['${month-5}월', ${fifthMonth}],
          ['${month-4}월', ${fourthMonth}],
          ["${month-3}월", ${thirdMonth}],
          ["${month-2}월", ${secondMonth}],
          ["${month-1}월", ${preMonth}],
          ["${month}월", ${thisMonth}]
        ]);

        var options = {
          title: 'Chess opening moves',
          width: 600,
          legend: { position: 'none' },
          bars: 'red', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: '매출액'} // Top x-axis.
            }
          },
          bar: { groupWidth: "60%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
    
</head>
<body>
	<div id="adminWrapper">
		<h1>매출 현황</h1>
		<h2>${year}년 ${month}월</h2>
		
		<h2>이번달매출 : <fmt:formatNumber value="${thisMonth}" pattern="#,###"/>원</h2>
		<h2>${month-1}월 매출 : <fmt:formatNumber value="${preMonth}" pattern="#,###"/>원</h2>
		<h2>${month-2}월 매출 : <fmt:formatNumber value="${secondMonth}" pattern="#,###"/>원</h2>
		<h2>${month-3}월 매출 : <fmt:formatNumber value="${thirdMonth}" pattern="#,###"/>원</h2>
		<h2>${month-4}월 매출 : <fmt:formatNumber value="${fourthMonth}" pattern="#,###"/>원</h2>
		<h2>${month-5}월 매출 : <fmt:formatNumber value="${fifthMonth}" pattern="#,###"/>원</h2>
		<h2>이번달 평균 : <fmt:formatNumber value="${thisMonthAverage}" pattern="#,###"/>원</h2>
		<h2>지난달 평균 : <fmt:formatNumber value="${preMonthAverage}" pattern="#,###"/>원</h2>
		<div style=" margin: 10px auto; text-align: center;" ><h2>${year}년 </h2>
		<div id="top_x_div" style="width: 600px; height: 300px; margin: 10px auto;"></div>
		</div>
		<br>
		
		<hr>
		
		<br>
		
		
	<div style="border: none; !important"> <!-- class="card card-cascade narrower"  -->
		    <!--Card image-->
    <div class="view view-cascade gradient-card-header special-color narrower py-2 mx-4 mb-3 d-flex justify-content-between align-items-center">

        <div>

        </div>

        <a href="" class="white-text mx-3">회원 및 주문관리</a>

        <div>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                <i class="fa fa-columns mt-0" id="memberList"> 회원관리</i>
            </button>
            <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                <i class="fa fa-th-large mt-0" id="orderList"> 주문관리</i>
            </button>
        </div>

    </div>
    <!--/Card image-->
	<div id="viewList"></div>
	</div>

<!-- Modal: modalCart -->
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
		</div>
		<!-- adminWrapper의 끝 -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
					alert("장난치삼?");
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