<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="adminWrapper">
		<h1>매출 현황</h1>
		<div>2018년</div>
		<div>10월</div>



		<hr>
		<button id="memberList">회원관리</button>
		<button id="orderList">주문관리</button>
		<div id="viewList"></div>



		<!-- adminWrapper의 끝 -->
	</div>

	<script>


	$(document).ready(function() {
		/* 기본 뷰타입으로 불러온다. */
	 	 $('#viewList').load('<%=request.getContextPath()%>' + '/memberList/viewType?type=orderList');   
		$('#memberList').click(function() {
				$.ajax({
					url : '<%=request.getContextPath()%>' + '/memberList/viewType?type=memberList',
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
					url : '<%=request.getContextPath()%>' + '/memberList/viewType?type=memberList',
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
		
		/* $(document).ready의 끝 */
	});
<%-- 			if ($(this).val() == 'JSON') {
				$.getJSON('memberList/viewType?type=JSON', function(data) {
					success : 
						$('#type, #tbody').empty();
						$('#type').append(JSON.stringify(data)+"<hr>"); 
						$.each(data, function(key, value) {
						$('#tbody').append(
 								'<tr>' + 
								'<td>' + value.userId + '</td><td>' +
								 value.password + '</td><td>' +
								 value.userName + '</td><td>' +
								 value.userPhoto + '</td>' +
								'<td id="memberPhoto" style="' +
								'background-image: url(\'' + '<%=request.getContextPath()%>' + '/uploadfile/userphoto/' + value.userPhoto + '\');"></td><td>' +
								value.regDate + '</td><td>' +
								'<a	href="' + '<%=request.getContextPath()%>' + '/memberModify/'+ value.userId + '">수정</a>' +
								'<a	href="' + '<%=request.getContextPath()%>' + '/memberDelete/'+ value.userId +'/'+ value.userPhoto +'">삭제</a></td>' + 
								'<tr>' 
						);
					});

				});
			}
			if ($(this).val() == 'XML') {
				$.ajax({
					url : 'memberList/viewType?type=XML',
					error : function(error) {
				        alert('error');
				    },
					success : function(data) {
						$('#type, #tbody').empty();
						$('#type').append($(data).text()+'<hr>');
						$(data).find('members').find('member').each(function(){
								var userid = $(this).find('userid').text().trim()
								var password = $(this).find('password').text().trim()
								var username = $(this).find('username').text().trim()
								var userphoto = $(this).find('userphoto').text().trim()
								var regdate = $(this).find('regdate').text().trim()
								$('#tbody').append(
									'<tr>' + 
									'<td>' + userid + '</td><td>' +
									password + '</td><td>' +
									username + '</td><td>' +
									userphoto + '</td>' +
									'<td id="memberPhoto" style="' +
									'background-image: url(\'' + '<%=request.getContextPath()%>' + '/uploadfile/userphoto/' + userphoto + '\');"></td><td>' +
									regdate + '</td><td>' +
									'<a	href="' + '<%=request.getContextPath()%>' + '/memberModify/'+ userid + '">수정</a>' +
									'<a	href="' + '<%=request.getContextPath()%>' + '/memberDelete/'+ userid +'/'+ userphoto +'">삭제</a></td>' + 
									'<tr>' 
							);
						});	
					}
				});
			}  --%>
/* 		}); */


</script>

</body>
</html>