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
	<c:if test="${viewList!=null}">
		<c:forEach var="productList" items="${viewList}">
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
	</c:if>
</body>
</html>