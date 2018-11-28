<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.freeboard_textarea {
	width: 98%;
}
</style>
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function freeboardInsert() {
	console.log('test');
	var url = "<%=request.getContextPath()%>/freeBoard/insert";
} 
</script>

<h1>자유게시판_글쓰기</h1>

<form method="POST" action="insert">
	<div class="freeboard_wrap">
		<table border="1" style="padding: 5px 0 5px 0;">
			<tr>
				<th>제목</th><td><input type="text" name="boardTitle" placeholder="제목을 입력해 주세요" ></td>
			</tr>
			<tr>
				<th>작성자 이름</th><td><input type="text" name="writerName" placeholder="이름을 입력해 주세요" value="${memberInfo.userName}"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="" class="freeboard_textarea" name="boardContent" placeholder="내용을 입력해 주세요"></textarea>
				</td>
			</tr>
			
		</table><!-- The end of Table -->
	</div><!-- end of <div class="freeboard_wrap">-->
	<div class="freeboard_Button">
					<input type="submit" value="글쓰기">
					<button value="글쓰기">취소</button>
	</div><!-- end of <div class="freeboard_Button"> -->
</form><!-- The end of Form -->

</body>
</html>