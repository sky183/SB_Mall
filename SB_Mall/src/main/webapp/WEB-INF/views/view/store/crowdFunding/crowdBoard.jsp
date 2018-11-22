<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<title>Insert title here</title>

<script>
	var pageShowCnt = 16;
	
	 $(document).ready(function(){
		
		function getCrowdBoar(crowdPageCount){
			$.ajax({
				url:'<%=request.getContextPath()%>/crowd/crowdBoard',
				type: "post",
				data: {crowdPageCount : crowdPageCount, pageShowCnt:pageShowCnt},
				error:function(){
					alert('오류입니다.');
				},
				success:function(data){
					var crList = $(data).filter('.crBoardUnit').html();
					
				
					
						$('.crBoardList').html(crList[i]);
					
					
				}
				
				
				
			})
		}/* 게시물 불러오기 끝 */
		getCrowdBoar(1);
		
		
		
		
		
		
		
	})/* document 끝*/
	


</script>
</head>
<body>

<div class="crBoardBigBox">
	
	<div></div>
	
	<div class="crBoardList">
	</div>

</div>



<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>