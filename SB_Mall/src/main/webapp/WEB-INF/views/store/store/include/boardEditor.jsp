<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
	});
	function sendCode() {
        $('#text').val($('#summernote').summernote('code'));
        $('#sform').submit();
        
    }
	
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	function sendFile(file, el) {
		var str = file.name;
	     var filename = guid() + str;
	      console.log(filename);
		var form_data = new FormData();
      	form_data.append('file', file);
      	form_data.append('filename', filename);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: 'http://52.79.226.226/file/upload/product',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
        		
          		$(el).summernote('editor.insertImage', 
          						img_name);
        	}
      	});
    }
	
	 function fileUpload(file) {
	      var str = file.value.substring(file.value.lastIndexOf("\\")+1); 
	      var filename = guid() + str;
	      console.log(filename);
	      var form_data = new FormData();
	      	form_data.append('file', file.files[0]);
	      	form_data.append('filename', filename);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: 'http://52.79.226.226/file/upload/salesboard',
	        	contentType: false,
	        	processData: false,
	        	enctype: 'multipart/form-data',
	        	success: function(img_name) {
	        		$("#filename").val(img_name);
	        	}
	      	});
	    }
	 
	 function guid() {
		  function s4() {
		    return Math.floor((1 + Math.random()) * 0x10000)
		      .toString(16)
		      .substring(1);
		  }
		  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
		    s4() + '-' + s4() + s4() + s4();
		}
</script>
<style type="text/css">
#summernoteBox{
	width: 1200px;
	margin: 100px auto;
}
#summerTitle{
	width: 100%;
    border: 1px solid #a9a9a9;
    border-radius: 5px;
    margin: 10px 0;
}
#summernoteBox input{
	margin: 5px 10px;
}
</style>
</head>
<body>
	<c:if test="${userGrade<3}">
		<script type="text/javascript">
			alert("운영진만 글 작성이 가능합니다.");
			location.href="<%=request.getContextPath()%>/store";
		</script>
	</c:if>
	<div id="summernoteBox">
		<form method="post" enctype="multipart/form-data" id="sform">
			글제목 <input type="text" name="salesBoard.title" required="required"><br>
			제품사진 <input type="file" name="uploadfile" required="required" onchange="fileUpload(this)"><br>
			<!--  추가된 코드-->
				  <input type="hidden" id="filename" name="product.photo">
			제품이름 <input type="text" name="product.productName" required="required"><br>
			제품가격 <input type="number" name="product.price" min="0" oninput="mathABS(this)" required="required"><br>
			제품설명 <textarea rows="3" cols="22" name="product.detail" required="required"></textarea><br>
			<hr>
			<input type="hidden" name="salesBoard.text" id="text">
		</form>
		<div id="summernote"></div>
		<button type="button" class="storeBtn storeWriteBtn" onclick="sendCode();">글쓰기</button>
	</div>
</body>
</html>