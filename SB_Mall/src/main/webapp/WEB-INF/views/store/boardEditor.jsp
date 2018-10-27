<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Board Editor</title>
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
		
		$('#productPhoto').change(function () {
			alert(this.val);
		});
		
	});
	function sendCode() {
        $('#text').val($('#summernote').summernote('code'));
        $('#sform').submit();
        
    }
	
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '<%=request.getContextPath()%>/store/summer/imgUpload',
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
		<form method="post" enctype="multipart/form-data" id="sform">
			글제목 <input type="text" name="salesBoard.title"><br>
			제품사진 <input type="file" name="product.photoFile"><br>
			제품이름 <input type="text" name="product.productName"><br>
			제품가격 <input type="number" name="product.price"><br>
			제품설명 <textarea rows="3" cols="22" name="product.detail"></textarea><br>
			<input type="hidden" name="salesBoard.text" id="text">
		</form>
		<div id="summernote"></div>
		<button type="button" onclick="sendCode();">글쓰기</button>
	</div>
</body>
</html>