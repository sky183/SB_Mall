<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					
				}
				
				
				
			})
		}/* 게시물 불러오기 끝 */
		getCrowdBoar(1);
		
		
		
		
		
		
		
	})/* document 끝*/
	


</script>
</head>
<body>

<div>

</div>



<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>