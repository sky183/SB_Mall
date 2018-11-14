<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!viewList.isEmpty()}">
		<c:forEach var="productList" items="${viewList.storeList}">
			<a href="<%=request.getContextPath()%>/store/board/${productList.salesSeq}"
				class="nodeco"> 
			<span class="productListBox"> 
				<img src="${productList.photo}" alt="사진없음" class="productListThumb"
					onerror="imgError(this)">
					<br>
					${productList.title} 
					<br> <br> 
					${productList.detail}
					<br>
					조회수:${productList.viewSeq}
					<br>
			</span>
			</a>
		</c:forEach>
			<%-- [${viewList.currentPageNumber}/${viewList.pageTotalCount}] --%>
		<div class="storeListPaging">
		<c:forEach varStatus="i" begin="1" end="${viewList.pageTotalCount}">
			<c:choose>
				<c:when test="${i.count==viewList.currentPageNumber}">
					<span class="storeBtn storePagingBtn selectedPagingBtn">${i.count}</span>
				</c:when>
				<c:otherwise>
					<button value="${i.count}" class="storeBtn storePagingBtn" 
					onclick="afnc(this)">${i.count}</button>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		</div>
		<input type="hidden" class="pageNumber" name="pageNumber"
			value="${viewList.currentPageNumber}">
		<input type="hidden" class="countPerPage" name="countPerPage"
			value="${viewList.countPerPage}">
	</c:if>
</body>
</html>