<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdDetail.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdReply.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="crowdWriteBigBanner">
		<div id="crowdWriteMidBanner">
			<h3 class = rowdWriteBannerH3>CrowdDetail</h3>
		</div>
	</div>
	<!-- 게시판 레이아웃 -->
	<div class="BDBigLayout">
		<!-- 상품 이미지 및 정보 -->
		<div class="BDtopLayout">
			<!-- 이미지 -->
			<div class="BDImgBox">
				<!-- 큰 이미지 -->
				<div class="thumBigImgBox">
					<img class="thumBigImg" src="${photo[0].crPhotoList}">
				</div><br>
				<!-- 썸네일 이미지 -->
				<div class="thumBox">
					
					<c:forEach var="photo" items="${photo}" end="5" varStatus="count">
						<div class="thumMiniBox ">
							<img class="thumImg cImg" src="${photo.crPhotoList}">
						</div>
					</c:forEach>
					
					<c:forEach var="photo" begin="1" end="${photoCnt}" step="1">
						<div class="thumMiniBox">
							<img class="thumImg" src="http://52.79.226.226/file/crproduct/1543288924349noImage2.png">
						</div>
					</c:forEach>
					
				</div>
			</div>
			
			<!--  상품 정보  -->
			<div class="BDInfoLayout">
				<!-- productNo -->
				<div class="prNoBox">
						<h6 class="prNo">상품번호&nbsp;&nbsp;:&nbsp;</h6>
						<h6 class="prNo">${boardPro[0].productNo}</h6>
				</div>
				
				<!-- title -->
				<div class="BDTitleBox">
					<h1 class="BDTitle">${boardPro[0].crProductName}</h1>
				</div>
				
				<!-- 평점 , 조회수 ㅋ -->
				<div class="ratingBixBox">
					<!-- 평점 -->
					<div class="ratingPart">
						<c:choose>
							<c:when test="${Rating.top!=0}">
								<c:forEach begin="1" end="${Rating.top}" varStatus="count">
									<img class="ratingImg" alt="${Rating.top}" src="<%=request.getContextPath()%>/img/star.png">
								</c:forEach>
								
								<c:if test="${Rating.mid!=0}">
									<img class="ratingImg" src="<%=request.getContextPath()%>/img/star${Rating.mid}.png">
								</c:if>
								
								<c:forEach begin="1" end="${Rating.bottom}">
									<img class="ratingImg" alt="${Rating.bottom}" src="<%=request.getContextPath()%>/img/star_em.png">
								</c:forEach>
							</c:when>
							<c:when test="${Rating.top==0}">
								<c:forEach begin="1" end="5" >
									<img class="ratingImg" src="<%=request.getContextPath()%>/img/star_em.png">
								</c:forEach>
							</c:when>
						</c:choose>
						<h5 class="ratingH5">${Rating.top}.${Rating.mid}</h5>
						<h6 class="ratingH6">(${Rating.count})</h6>
					</div>
					
					<!-- 조회수 -->
					<div class="viewSeqBox">
						<img class="viewSeqImg" src="<%=request.getContextPath()%>/img/viewSeq01.png">
						<h6 class="viewSeqH6">${viewSeq}</h6>
					</div>
				</div>
				
				<!--  -->
				<div>
				
				</div>
				
			</div>
		</div>
		
		<!-- 상품 디테일 설명 -->
		<div class="proDetailBox">
			<div class="detTitleBox">
				<h1 class="detTitle">상품상세</h1>
			</div>
		</div>
		
		<!-- 상품 배송관련 -->
		<div>
			<img class="delivImg" src="<%=request.getContextPath()%>/img/delivery01.png">
		</div>
	
	</div>

<%@ include file="/WEB-INF/views/store/crowdFunding/crowdReply.jsp" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>



</body>
</html>