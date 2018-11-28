<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자유게시판</h1>
	<form>
	<div class="freeboard_wrap">
		<table border="1" style="padding: 5px 0 5px 0;">

			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th class="active_type">게시글번호</th>
					<th>게시글제목</th>
					<th class="active_type">작성자</th>
					<th class="active_type">작성날짜</th>
				</tr>
			</thead><!-- end of thead -->
			<tbody>
				<tr>
					<td><input type="checkbox" /></td>
					<td class="active_type">1</td>
					<td class="left">게시물1번입니다.</td>
					<td class="active_type">관리자</td>
					<td class="active_type">2017-12-19</td>
				</tr>
				
			</tbody><!-- end of tbody -->
		</table><!-- The end of Table -->
	</div><!-- end of <div class="freeboard_wrap">-->
	<div class="freeboard_Button">
		<div class="write_button_right">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828";
			href="<%=request.getContextPath()%>/freeBoard/writePage"
			>글쓰기</a>
				
		</div>
		<div class="write_button_left">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828";
			href="<%=request.getContextPath()%>/freeBoard"
			>전체글</a>
		</div>
	</div><!-- end of <div class="freeboard_Button"> -->
	</form><!-- The end of Form -->

</body>
</html>