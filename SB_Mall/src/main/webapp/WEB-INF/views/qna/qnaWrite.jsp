<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.10.0.js"></script>

<script>

	<%-- $(document).ready(function(){
		//댓글달기.
		   $('#qnaWrite').on('click',function(){
			   var qnaForm = $('#qnaFormBox').serialize();
			   $.ajax({
				   	url:'<%=request.getContextPath()%>/qnawrite',
				   	type: "post",
				  	data:qnaForm,
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				$('#qTitle').val("");
		   				$('#qText').val("");
		   			}
			   })
		   })
	}); --%>

</script>

</head>
<body>

<h1>
    게시판 등록하기  
</h1>
    
    <!-- <form id="qnaFormBox"> -->
    <form action="/qna/qnawrite" method="POST">
        <div class="createForm">
            <label >제목</label>
            <input type="text" id="qTitle" class="createForm" placeholder = "QnA 제목">
        </div>
        <div class="createForm">
            <label >내용</label>
            <textarea rows="4" cols="15" id="qText" class="createForm" placeholder = "QnA 내용"></textarea>
        </div>
        <div class="createForm">
            <label >작성자</label>
            <input type="text" name="b_writer" class="createForm" placeholder = "작성자">
        </div>

        <div class="Formfooter">
                <button type="submit" id="qnaWrite" class="btn_button">작성하기</button>
        </div>
        
    </form>


</body>
</html>