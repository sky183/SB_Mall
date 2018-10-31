<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">
    <script>
     var nowReply
   	var tmp;
     var tmp2;
     var tmp3;
	    $(document).ready(function(){
	    	
	    	//페이지 선택 시 function
	    	<%-- $.fn.pageSelectOnClickEvt = function(){
		    	$(this).on("click", function(){
		    		/* alert($(this).html()); */
		    		$.ajax({
		    			url:'<%=request.getContextPath()%>/reply',
		    			data: {page : $(this).html()},
			    		error: function(){
			    			alert("error");	
			    		},
			    		success:function(data){
			    			var reply = $(data).filter('#replyPaged').html();
		    				var page = $(data).filter('#paging').html();
		    				$('#replyGetBox').html(reply);
		    				$('#replyPageBox').html(page);
		    				$(".pageSelect").pageSelectOnClickEvt();
			    		}
		    		})
		    	})	
		    } --%>
		    
		  
	    	
		   function replyCall(page) {
		    		$.ajax({
		    			url:'<%=request.getContextPath()%>/reply',
		    			data: {page : page},
			    		error: function(){
			    			alert("error");	
			    		},
			    		success:function(data){
			    			var reply = $(data).filter('#replyPaged').html();
		    				var page = $(data).filter('#paging').html();
		    				$('#replyGetBox').html(reply);
		    				$('#replyPageBox').html(page);
		    				//페이징 버튼 이벤트.
		    				$(".pageSelect").on('click', function() {
		    					   replyCall($(this).html());
		    				   })
		    				$('.replyDelete').on('click',function(){
		    					var deleteDo = confirm("삭제하시겠습니까?");
		    					if(deleteDo){
		    						replyDelete($(this).val());
		    					}
		    						
		    				})
			    		}
		    		})
		   }
		   replyCall(1);
		   
		   
		   //댓글달기.
		   $('#replyWrite').on('click',function(){
			   var replyForm = $('#replyFormBox').serialize();
			   $.ajax({
				   	url:'<%=request.getContextPath()%>/replyWrite',
				   	type: "post",
				  	data:replyForm,
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				$('#replyText').val("");
		   				replyCall(1);
		   			}
			   })
		   })
		   
		   //댓글삭제.
		   function replyDelete(replySeq){
			   $.ajax({
				   url:'<%=request.getContextPath()%>/replyDelete',
				  	data:{replySeq : replySeq},
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				replyCall(1);
		   			}
			   })
		   }
		   
		  
		   
		   
		   

	    	
	    	
	    	
	    });
	    
    </script>
    <style>
    	.replylayout{
    		width:1200px;
    		margin: 0 auto;
    	}
    	.replyTextClass{
    	float:right;
    	display: inline-block;
    	height:100px;
    	border: 1px solid #505050;
    	}
    	.replyInputBox{
    		height:100px;
    		margin:20px 0;
    		
    	}  
    	.replyTextBox{
    		width:1000px;	
    		height:100px;
    		background-color: white;
    		border-radius: 10px 0 0 10px;
    	}
    	.replyInputText{
    		border:none;
    		margin:20px;
    		width:960px;
    		font-size: 14pt;
    	}
    	.reply_h3{
    		display: inline-block;
    		float: left;
    		margin-top:5px;
    	}
    	.replyInputBtn{
    		width:102px;
    		height:102px;
    		border:none;
    		background-color: #505050;
    		font-size: 20px;
    		font-weight;
    		color:white;
    		
    	}
    	
    	
    	
    	
    </style>
    
    
    
    
    
    <div class="replylayout">
    	<h1>상품 후기</h1>
    	<hr>
    	
    	
    	<c:choose>
		    <c:when test="${memberInfo!=null}">
		    	<div class="replyInputBox">
		    		<h3 class="reply_h3">댓글 쓰기</h3>
		    		<form id="replyFormBox">
		    			<input class="replyTextClass replyInputBtn" type="button" id="replyWrite" value="등록">
		    			
		    			<div class="replyTextBox replyTextClass">
		    				<input class="replyInputText" type="text" id="replyText" name="reply" placeholder="댓글을 작성해주세요.">
		    			</div>
		    			
		    			<c:if test="${viewList!=null}">
		    				<c:forEach var="board" items="${viewList}">
		    						<input  type="hidden" id="replyText" value="${board.salesSeq}" name="salesSeq" >
		    				</c:forEach>
		    			</c:if>
		    			
		    		</form>
		    	</div>
		    </c:when>
   		</c:choose>
   		
   		
    	<div id="replyGetBox"></div>
    	<div id="replyPageBox"></div>
    	
    	
    </div>
    
