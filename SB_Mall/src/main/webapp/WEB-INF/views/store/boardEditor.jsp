<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">
	$(document).ready(function() { 
		$('#summernote').summernote({
			  height: 800,                 // set editor height
			  minHeight: 500,             // set minimum height of editor
			  maxHeight: 1200,             // set maximum height of editor
			  focus: true                  // set focus to editable area after initializing summernote
			});
		
	});
	function showContent() {
        $('.output').html($('#summernote').summernote('code'));
    }
</script>
<style type="text/css">
#summernoteBox{
	width: 1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id="summernoteBox">
		<div id="summernote"></div>
		<button type="button" onclick="showContent();">글쓰기</button>
	</div>
		 <form class="submitForm" method="post">
		 	<input type="hidden" class="hiddenTitle"> 
		 	<input type="hidden" class="hiddenasd">
		 </form>
</body>
</html>