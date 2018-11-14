<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
	    $('#summernote').summernote({
	            height: 300,              	 // set editor height
	            minHeight: 300,             // set minimum height of editor
	            maxHeight: 300,             // set maximum height of editor
	            focus: true                  // set focus to editable area after initializing summernote
	    });
	});


</script>
</head>
<body>
	<label>게시판 제목
		<input type="text">
	</label>
	<label>게시판 제목
		<input type="text">
	</label>
	<label>게시판 제목
		<input type="text">
	</label>
	<label>게시판 제목
		<input type="text">
	</label>
	<textarea name="content" id="summernote" ></textarea>


</body>
</html>