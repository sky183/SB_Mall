<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

	

	$(document).ready(function() {
		$(".openText").hide();
		
		$('.hideText').click(function() {
			$('.openText').toggle(200, 'linear');
		});
	});
	
</script>

</head>
<body>

	<br><br>
	<a href="<%=request.getContextPath()%>/qna/qnaWrite">문의하기</a>
	<br><br><br>

	<table class="table table-board" border="1px" width="80%"
		align="center">
		<tr>
			<th style="width: 10%">답변 상태</th>
			<th style="width: 10%">글 번호</th>
			<th style="width: 30%">제목</th>
			<th style="width: 20%">작성자</th>
			<th style="width: 20%">날짜</th>
			<th style="width: 10%">답글달기</th>
		</tr>
		<c:if test="${qnaList!=null}">
			<c:forEach items="${ qnaList }" var="qnaBoard">
				<tr>
					<td><c:set var="data" value="미답변" />
					<c:choose>
					<c:when test="${ qnaBoard.atext eq null }">
        			미답변
        			</c:when>
        			<c:otherwise>
        			답변완료
        			</c:otherwise>
        			</c:choose></td>
					<td>${ qnaBoard.qnaSeq }</td>
					<td><a href="#this" class='hideText'>${ qnaBoard.qtitle }</a></td>
					<td>${ qnaBoard.userSeq }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${ qnaBoard.qwriteDate }" /></td>
					<td><a href="<%=request.getContextPath()%>/qna/qnaWriteAns/${ qnaBoard.qnaSeq }">답글쓰기</a></td>
				</tr>
				<tr>
					<td colspan="6" class="openText" >${ qnaBoard.qtext }</td>
				</tr>
				<tr>
					<td colspan="6" class="openText" >${ qnaBoard.atext }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	

</body>

</html>