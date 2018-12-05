<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.freeboard_textarea {
	width: 98%;
	height: 90%;
}
</style>
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

<h1>자유게시판_글쓰기</h1>

<form method="POST" action="insert">
	<div class="freeboard_wrap">
		<table border="1" style="padding: 5px 0 5px 0;">
			<tr>
				<th>제목</th><td><input type="text" name="boardTitle" placeholder="제목을 입력해 주세요" required></td>
			</tr>
			<tr>
				<th>작성자 이름</th><td><input type="text" name="writerName" readonly="readonly" value="${memberInfo.userName}"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="" class="freeboard_textarea" name="boardContent" placeholder="내용을 입력해 주세요" required></textarea>
				</td>
				
			</tr>
			<tr>
				<td colspan="4">
					<div class="freeboard_Button">
						<input type="submit" 
						class="btn my-4 btn-block"
						style="background-color: #ffc828"
						value="확인">
									
						<a type="Button" 
						class="btn my-4 btn-block"
						style="background-color: #ffc828"
						href="<%=request.getContextPath()%>/freeBoard">취소</a>
					</div><!-- end of <div class="freeboard_Button"> -->
				</td>
			</tr>
			
		</table><!-- The end of Table -->
	</div><!-- end of <div class="freeboard_wrap">-->
</form><!-- The end of Form -->

</body>
</html>