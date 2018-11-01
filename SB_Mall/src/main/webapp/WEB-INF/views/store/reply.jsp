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
		    
		    $('input[type="text"]').keydown(function() {
		        if (event.keyCode === 13) {
		            event.preventDefault();
		        }
		    });
		    
		  
	    	
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
			   var str = $('#replyText').val();
			   str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			   $('#replyText').val(str);
			   
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
    		margin-bottom: 100px;
    	}
    	.replyTextClass{
	    	float:right;
	    	display: inline-block;
	    	height:100px;
	    	border: 1px solid #787878;
    	}
    	
    	.replyInputBox{
    		height:100px;
    		margin:20px 0;
    		
    	}  
    	.replyTextAreaBox{
    		/* width:1000px;	
    		height:100px; */
    		background-color: red !important;
    		border-radius: 5px 0px 0px 5px !important;
    	}
    	.replyInputText{
    		border:none;
    		margin:15px;
    		width:970px;
    		height:70px;
    		font-size: 14pt;
    		color:#282828;
    	}
    	.reply_h3{
    		display: inline-block;
    		float: left;
    		margin-top:5px;
    		color:#505050;
    		font-weight: normal;
    		
    	}
    	.replyInputBtn{
    		width:102px;
    		height:102px;
    		border:none;
    		background-color: #787878;
    		font-size: 20px;
    		font-weight;
    		color:white;
    		border-radius: 0px 10px 10px 0px;
    		
    	}
    	#replyGetBox{
    		padding:20px 0;
    	}
    	.reply_h1{
    		margin-top:30px;
    		padding-bottom:10px;
    		border-bottom: 2px solid #505050;
    		font-size: 24pt;
    		color:#282828;
    	}
    	.getReply_H4{
    		display: inline-block;
    		font-size: 10pt;
    		color:#787878;
    		font-weight: normal;
    	}
    	.getReply_H5{
    		display: inline-block;
    		font-size: 10pt;
    		color:#787878;
    		font-weight: normal;
    	}
    	#replyFrame{
    		width:1000px;
    		word-break:break-all;
    	}
    	.getReply_H2{
    		padding:5px 20px;
    		font-size: 14pt;
    		color:#282828;
    		font-weight: normal;
    		line-height: 22pt;
    		
    	}
    	.replyDelete{
    		float: right;
    		width:40px;
    		height:25px;
    		background-color: #f0f0f0;
    		border: none;
    		font-size:9pt;
    		color:#787878;
    		font-weight: normal;
    		border-radius: 5px;
    	}
    	
    	.replyDelete:hover{
    		background-color: #ffc828;
    		color:white;
    		
    	}
    	
    	.replyUnit{
    		padding:15px 0;
    		border-bottom: 1px solid #f0f0f0;
    		
    	}
    	
    	#replyPageBox{
    		text-align: center;
    		
    		
    	}
    	.pageSelect{
    		width:40px;
    		height:40px;
    		border: 1px solid #787878;
    		color:#787878;
    		font-size: 12pt;
    		border-radius: 5px;
    	}
    	
    	.pageSelect:hover{
    		background-color: #787878 !important;
    		color:white;
    	}
    	.pageActive{
    		border: 1px solid #787878 !important;
    		background-color: #787878 !important;
    		color:white;
    	}
    	
    	
    	
    	
    </style>
    
    
    
    
    
    <div class="replylayout">
    	<h1 class="reply_h1" >상품 후기</h1>
    	
    	
    	
    	<c:choose>
		    <c:when test="${memberInfo!=null}">
		    	<div class="replyInputBox">
		    		<h3 class="reply_h3">후기 쓰기</h3>
		    		<form id="replyFormBox">
		    			<input class="replyTextClass replyInputBtn" type="button" id="replyWrite" value="등록">
		    			
		    			<div class="replyTextClass replyTextAreaBox" style="border-radius:10px 0px 0px 10px;">
		    					<textarea class="replyInputText"  id="replyText" name="reply"  style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
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
    
