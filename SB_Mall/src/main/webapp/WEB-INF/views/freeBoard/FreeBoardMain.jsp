<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h1>자유게시판</h1>
	<form>
	<div class="freeboard_wrap">
		<table border="1" style="padding: 5px 0 5px 0;">

			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th>게시글번호</th>
					<th>게시글제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead><!-- end of thead -->
			<tbody>
			<c:forEach items="${FreeBoardList}" var="freeBoard">
				<tr>
					<td><input type="checkbox" /></td>
					<td>${freeBoard.boardSeq}</td>
					<td><A href="<%=request.getContextPath()%>/freeBoard/select?boardSeq=${freeBoard.boardSeq}">${freeBoard.boardTitle}</A></td>
					<td>${freeBoard.writerName}</td>
					<td>${freeBoard.boardWriteDate}</td>
				</tr>
			</c:forEach>
			</tbody><!-- end of tbody -->
		</table><!-- The end of Table -->
	</div><!-- end of <div class="freeboard_wrap">-->
	<div class="freeboard_Button">
		<div class="write_button_right">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828"
			href="<%=request.getContextPath()%>/freeBoard/writePage"
			>글쓰기</a>
				
		</div>
		<div class="write_button_left">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828"
			href="<%=request.getContextPath()%>/freeBoard"
			>전체글</a>
		</div>
	</div><!-- end of <div class="freeboard_Button"> -->
	</form><!-- The end of Form -->

</body>
</html>