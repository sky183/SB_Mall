<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<title>Insert title here</title>

<script>
	var pageShowCnt = 16;
	
	 $(document).ready(function(){
		
	 	function getCrowdBoard(nowPage){
			$.ajax({
				url:'<%=request.getContextPath()%>/crowd/crowdBoardList',
				type: "get",
				data: {nowPage : nowPage, pageShowCnt:pageShowCnt},
				error:function(){
					alert('오류입니다.');
				},
				success:function(data){
					var crList = $(data).filter('.crBoardList').html();
					var crPaging = $(data).filter('.pagingBox').html();
				
					$('.crBoardList').html(crList);
					$('.pagingBox').html(crPaging);
					
					callBoard();
				}
				
				
				
			})
		}/* 게시물 불러오기 끝 */
		getCrowdBoard(1);
		
		/* 게시판 ajax호출 이벤트 연결*/
		function callBoard(){
			$('.pagingBtn').on('click',function(){
				var nowPage = $(this).html();
				getCrowdBoard(nowPage);
			})
		}
		
		$('.select').change(function(){
			var Num = $(this).val();
			var SubNum = Num.substr(0,2);
			
			pageShowCnt = SubNum;
			getCrowdBoard(1);
		})
		
		
		
		
		
		
	})/* document 끝*/
	


</script>
</head>
<body>
<div class="midBannerBox">
<h3 class="rowdWriteBannerH3">얼리버드</h3>
</div>

<!-- 총 게시판 공간 -->
<div class="crBoardBigBox">
	
	<!-- 검색조건, 검색 등 -->
	<div class="userOptBox ib">
		<div class="selectBox ib">
			<select class="select">
				<option>16개</option>
				<option>32개</option>
				<option>48개</option>
			</select>
		</div>
		<div class="searchBigBox">
			<div class="searchBox ib">
				<input class="search" type="text">
			
			</div><div class="searchBtnBox ib">
				<img class="searchBtn" src="<%=request.getContextPath()%>/img/searchicon-01.png">
			</div>
		</div>
	</div>
	
	<!-- 게시물 공간 -->
	<div class="crBoardList">
	</div>
	
	<div class="pagingBox">
	</div>
	
	
	

</div><!-- 총 게시판 끝 -->



<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>