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

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

</head>
<script type="text/javascript">
$(document).ready(function() { 
	$('#summernote').summernote({
		  height: 350,                 // set editor height
		  witdth: 500,
		  minHeight: 300,             // set minimum height of editor
		  maxHeight: 800,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
		        }
			}
	});
	
});

function sendCode() {
    $('#freeBoard_text').val($('#summernote').summernote('code'));
    $('#freeBoard_form_id').submit();
}

</script>

<body>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h1>자유게시판_게시글읽기</h1>

<form method="POST" action="insert">
	<div class="freeboard_wrap">
		<table border="1" style="padding: 5px 0 5px 0;">
			<tr>
				<th>게시글번호</th><td>${freeBoard.boardSeq}</td>
				<th>제목</th><td>${freeBoard.boardTitle}</td>
			</tr>
			<tr>
				<th>유저번호</th><td>${freeBoard.userSeq}</td>
				<th>작성자 이름</th><td>${freeBoard.writerName}</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="freeboard_textarea" >${freeBoard.boardContent}</div>
					<%-- <div id="summernote">${freeBoard.boardContent}</div> --%>
				</td>
				
			</tr>
			<tr>
				<td colspan="4">
					<div class="freeboard_Button">
									
					</div><!-- end of <div class="freeboard_Button"> -->
				</td>
			</tr>
			
		</table><!-- The end of Table -->
						<a type="Button" 
						class="btn my-4 btn-block"
						style="background-color: #ffc828"
						href="<%=request.getContextPath()%>/freeBoard/update?boardSeq=${freeBoard.boardSeq}&&userSeq=${freeBoard.userSeq}">수정</a>
						<a type="Button" 
						class="btn my-4 btn-block"
						style="background-color: #ffc828"
						href="<%=request.getContextPath()%>/freeBoard/delete?boardSeq=${freeBoard.boardSeq}&&userSeq=${freeBoard.userSeq}">삭제</a>
						
						<a type="Button" 
						class="btn my-4 btn-block"
						style="background-color: #ffc828"
						href="<%=request.getContextPath()%>/freeBoard">목록</a>
	</div><!-- end of <div class="freeboard_wrap">-->
</form><!-- The end of Form -->

</body>
</html>