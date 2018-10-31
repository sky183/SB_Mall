<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>

    <script>
    
	    $(document).ready(function(){
	    
	    	
	    
	    	$.ajax({
	    		url:'<%=request.getContextPath()%>/reply',
	    		error: function(){
	    			alert("error");	
	    		},
	    		success:function(data){
	    				alert(data);
	    				$('#replyGetBox').append(data);
	    				
	    				$(".pageSelect").last().on("click", function(){
	    				
	    					alert(1);
	    				})
	    				
	    				
	    		}
	    	})
	    	
	    	 $.fn.pageSelectOnClickEvt = function(){
		    	$(this).on("click", function(){
		    		alert(2);	
		    	})	
		    	
		    }
		    	$("#test").pageSelectOnClickEvt();
		    
		    	$.ajax({
		    		url:'<%=request.getContextPath()%>/reply',
		    		error: function(){
		    			alert("error");	
		    		},
		    		success:function(data){
		    				//alert(data);
		    				$('#replyGetBox').append(data);
		    				
		    				$(".pageSelect").last().pageSelectOnClickEvt();
		    				
		    				
		    		}
		    	})
	    	
	    	
	    	//$(".pageSelect").click(function() {
	    	
	    	
	    	$(document).on("click",".pageSelect",function() {
		    	$('#replyGetBox').html("");
	    		alert("여기다.");
	    		$("#replyGetBox").html="";
	    		var thisPage = $(this).val();
	    		alert(thisPage);
	    		$.ajax({
	    			url:'<%=request.getContextPath()%>/reply',
		    		error: function(){
		    		     alert("error")	
		    		},
		    		success:function(data){
		    				alert(data);
		    				$('#replyGetBox').append(data);
		    				
		    		}    		
	    			
	    		})	
	    	}) 
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    });
	    
	   
    	
    	
    	
	    
	    
	    <%-- function goNowPage(nowPage) {
	    	$('#replyGetBox').html("");
	    	$.ajax({
    			url:'<%=request.getContextPath()%>/reply',
	    		error:alert("error"),
	    		success:function(data){
	    				alert(data);
	    				$('#replyGetBox').append(data);
	    				
	    		}    		
    			
    		})	
		} --%>
	    
	    
	    
    
    </script>
    
    
    
    
    
    
    <div class="replylayout">
    	<h1>댓글 jsp</h1>
    	<div id="replyGetBox">
    	
    	</div>
    	<c:choose>
		    <c:when test="${memberInfo!=null}">
		    	
		    
		    </c:when>
		    <c:otherwise>
		    	<div>
		    		<h4>댓글을 작성하시려면 <a onclick="">로그인</a>하세요.</h4>
		    	</div>
		    
		    </c:otherwise>
   		</c:choose>
    	
    </div>
    
