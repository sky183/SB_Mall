<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<link
	href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i"
	rel="stylesheet">
<body>
	<script type="text/javascript">
	<c:if test="${errorMsg!=null}">
	   
	      alert('${errorMsg}');

	</c:if>
		   </script>
	<div id="headerFullWidth">
		<div id="headerLayout">

			<!-- 로고 및 메뉴바. -->
			<div id="headerNavi">
				<a href="<%=request.getContextPath()%>/"> <img id="headerLogo"
					src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
				</a> <a class="headerNaviText naviBigMenuEnd" href="">Search</a>
				<c:choose>
					<c:when test='${memberInfo.gradeNum >= 3}'>
						<a class="headerNaviText naviBigMenu"
							href="<%=request.getContextPath()%>/admin/adminPage">admin</a>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test='${memberInfo eq null}'>
						<a class="headerNaviText naviBigMenu"
							href="<%=request.getContextPath()%>/member/login">login</a>
						<a class="headerNaviText naviBigMenu"
							href="<%=request.getContextPath()%>/member/join">Join</a>
					</c:when>
					<c:otherwise>
						<a class="headerNaviText naviBigMenu"
							href="<%=request.getContextPath()%>/member/myPage">myPage</a>
						<a class="headerNaviText naviBigMenu"
							href="<%=request.getContextPath()%>/member/logout">logout</a>
					</c:otherwise>
				</c:choose>

				<!-- 커뮤니티 -->
				<div class="headerNaviText naviDrop">
					<button class="naviBigMenu">Community</button>

					<div class="dropNaviBar">
						<a class="naviDrop_Atag" href="<%=request.getContextPath()%>/qna">QnA</a>
						<a class="naviDrop_Atag" href="">crowdFunding</a> <a
							class="naviDrop_Atag" href="">crowdFunding</a> <a
							class="naviDrop_Atag" href="<%=request.getContextPath()%>/subway">지하철</a>
					</div>
				</div>


				<!--  장바구니 -->
				<a class="headerNaviText naviBigMenu"
					href="<%=request.getContextPath()%>/order/cart">Cart</a>

				<!-- 스토어 -->
				<div class="headerNaviText naviDrop">
					<button class="naviBigMenu">Store</button>

					<div class="dropNaviBar">
						<a class="naviDrop_Atag"
							href="<%=request.getContextPath()%>/store">Store</a> <a
							class="naviDrop_Atag"
							href="<%=request.getContextPath()%>/crowd/crowdBoard">crowdFunding</a>
						<a class="naviDrop_Atag"
							href="<%=request.getContextPath()%>/crowd/crowdWritePage">crowdWritePage</a>
					</div>
				</div>

				<!-- 메인페이지 -->
				<a class="headerNaviText naviBigMenu"
					href="<%=request.getContextPath()%>/">HOME</a>
			</div>

		</div>
	</div>


</body>
