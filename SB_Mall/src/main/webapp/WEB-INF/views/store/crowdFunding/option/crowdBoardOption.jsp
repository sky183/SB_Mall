<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>

<div id="crBigBox">
	<c:forEach var="list" items="${crBoard}">
		<div class="crBoardUnit">
			
			<!-- 상품 이미지 -->
			<div class="crBoardImgBox">
				<img class="crBoardImg" src="${list.photo}">
			</div>
			
			<!-- 상품 정보(제목, 조회수) -->
			<div class="crBoardContentBox">
				<div>
					<h4 class="crTitle">${list.title}</h4>
				</div>
				<div>
					<h6 class="crViewSeq">조회&nbsp;</h6><h6 class="crViewSeq">${list.viewSeq}</h6>
				</div>
			</div>
			
			<!-- 달성률 -->
			<div class="AchieveBox">
			
				<div class="targetPrice">
					<div class="Achieve" achieve = "${list.totalOrderPrice}/${list.targetPrice}"></div>
				</div>
				
				<div class="AchieveMidBox">
					<div>
						<h3>달성률.</h3>
						<h5>${list.totalOrderPrice}</h5>
					</div>
					<div>
						<h5> 남은 날짜.</h5>
					</div>
				</div>
				
			</div>
			
			
		</div>
	</c:forEach>

</div>




