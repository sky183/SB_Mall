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
<!-- midBannerBox -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<!-- 자유게시판 CSS -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/freeBoardWrite.css">

</head>
<script type="text/javascript">
$(document).ready(function() { 
	$('#summernote').summernote({
		  height: 350,                 // set editor height
		  witdth: 800,
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
<div class="midBannerBox">
	<h3 class="rowdWriteBannerH3">얼리버드</h3>
</div>
<form method="POST" action="insert" id="freeBoard_form_id">
<div id="freeboard_wrap_1">
<div id="freeboard_wrap_2">

	<!-- Start of Header -->
	<div id="freeboard_Header" >
		<input id="header_Input" type="text" name="boardTitle" placeholder="제목을 입력해 주세요" required>
	</div><!-- End of div Header-->
	<hr id="header_hr">
	
	<!-- Start of Content -->
	<div id="freeboard_Content">
		<input type="hidden" id="freeBoard_text" name="boardContent">
		<div id="summernote"></div>	
	</div><!-- End of div Content-->
	
	<!-- Start of Footer -->
	<div id="freeboard_Footer">
		
					
							
		<button 
		class="all_Button"
		id="footer_button_Write"
		onclick="sendCode();">
		글쓰기
		</button>
		<a 
		type="button" 
		class="all_Button"
		id="footer_button_Cancel"
		href="<%=request.getContextPath()%>/freeBoard">
		취소
		</a>
		
		
	</div><!-- End of div Footer-->
	
</div><!-- End of freeboard_wrap_1-->
</div><!-- End of freeboard_wrap_2-->
</form>

<!-- <h1>자유게시판_글쓰기</h1> -->

<!-- <form method="POST" action="insert" id="freeBoard_form_id"> -->
<!-- 	<table border="1" style="padding: 5px 0 5px 0;"> -->
<!-- 		<tr> -->
<!-- 			<th>제목</th><td><input type="text" name="boardTitle" placeholder="제목을 입력해 주세요" required></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<th>작성자 이름</th><td><input type="text" name="writerName" readonly="readonly" value="${memberInfo.userName}"></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="4"> -->
<%-- 			<%-- <textarea rows="" class="freeboard_textarea" name="boardContent"  readonly="readonly">${freeBoard.boardContent}</textarea> --%>	 --%>
<!-- 				<input type="hidden" id="freeBoard_text" name="boardContent"> -->
<!-- 				<div id="summernote"></div>		 -->
<!-- 			</td> -->
				
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="4"> -->
<!-- 				<div class="freeboard_Button"> -->
<!-- 					<input type="submit" 
<!-- 					class="btn my-4 btn-block" -->
<!-- 					style="background-color: #ffc828" -->
<!-- 					value="확인"> --> -->
<!-- 				<button type="button" class="storeBtn storeWriteBtn" onclick="sendCode();">글쓰기</button> -->
							
<!-- 				<a type="Button"  -->
<!-- 				class="btn my-4 btn-block" -->
<!-- 				style="background-color: #ffc828" -->
<%-- 				href="<%=request.getContextPath()%>/freeBoard">취소</a> --%>
<!-- 				</div>end of <div class="freeboard_Button"> -->
<!-- 			</td> -->
<!-- 		</tr> -->
			
<!-- 		</table>The end of Table -->
<!-- 	</div>end of <div class="freeboard_wrap"> -->
<!-- </form>The end of Form -->

</body>
</html>