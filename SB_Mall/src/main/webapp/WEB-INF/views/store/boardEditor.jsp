<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeBoard editor</title>
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
			  height: 750,                 // set editor height
			  minHeight: 500,             // set minimum height of editor
			  maxHeight: 1200,             // set maximum height of editor
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
        var f=document.sForm;
        f.sTitle.value=$('#summerTitle').val();
        f.sCode.value=$('#summernote').summernote('code');
        f.submit();
    }
	
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '<%=request.getContextPath()%>/store/imgUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', 
          						'<%=request.getContextPath()%>/'+img_name);
        	}
      	});
    }
</script>
<style type="text/css">
#summernoteBox{
	width: 1000px;
	margin: 0 auto;
}
#summerTitle{
	width: 100%;
    border: 1px solid #a9a9a9;
    border-radius: 5px;
    margin: 10px 0;
}
</style>
</head>
<body>
	<div id="summernoteBox">
		<input type="text" id="summerTitle">
		<div id="summernote"></div>
		<button type="button" onclick="sendCode();">글쓰기</button>
	</div>
	<form class="submitForm" method="post" name="sForm">
		<input type="hidden" name="sTitle"> 
		<input type="hidden" name="sCode">
	</form>
</body>
</html>