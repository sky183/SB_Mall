<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<title>Insert title here</title>

<script>
	var pageShowCnt = 16;
	
	 $(document).ready(function(){
		
	<%-- 	function getCrowdBoar(crowdPageCount){
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
		 --%>
		
		
		
		
		
		
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
	<div class="userOptBox">
		<div class="selectBox">
			<select class="select">
				<option>16개</option>
				<option>32개</option>
				<option>48개</option>
			</select>
		</div>
		<div class="searchBox">
			<h6>검색</h6><input class="search" type="text">
		</div>
	</div>
	
	<!-- 게시물 공간 -->
	<div class="crBoardList">
	
		<c:forEach var="list" items="${boardList}" varStatus="countNum">
			
			<!-- 게시판 유닛 빅 박스 -->
			<div class="boardMidBox">
				<!-- 이미지 -->
				<div class="boardPhotoBox">
					<img src="${list.crPhoto}" class="boardPhoto">
				</div>
				
				<!-- 제목 & 조회수 -->
				<div class="titleBox">
					<div class="boardTitleBox">
						<h4 class="boardTitle"> ${list.title}</h4>
					</div>
					<div class="viewBox">
						<img class="viewImg" src="<%=request.getContextPath()%>/img/viewSeq01.png"><h6 class="ib viewH6">&nbsp; ${list.viewSeq}</h6>
					</div>
				</div>
				
				<!-- 달성률 & 남은날짜 -->
				<div class="targetBox">
					<div class="targetBar">
						<div class="achieveBar"></div>
					</div>
					<!-- 달성 퍼센트 -->
					<div class="targetPcBox">
						<h4>${list.totalOrderPrice/list.targetPrice}%</h4>
						<h4>${list.totalOrderPrice}%</h4>
						<h4>${list.targetPrice}%</h4>
					</div>
					<!-- 달성금액 -->
					<div class="achievePriceBox">
						<h5>${list.totalOrderPrice}</h5>
					</div>
					
					<div class="leftDayBox"><h6>${list.writeDate}</h6></div>
				</div>
				
			</div>
			<c:if test="${countNum}/4=0">
				<br>
			</c:if>
			
		</c:forEach>
		
	</div>
	
	
	

</div><!-- 총 게시판 끝 -->



<%@ include file="/WEB-INF/views/common/header.jsp"%>
</body>
</html>