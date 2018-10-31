<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table class="table table-board" border="1px" width="80%" align="center">
        <tr>
            <th style="width:10%" >글 번호</th>
            <th style="width:30%">제목</th>
            <th style="width:20%">작성자</th>
            <th style="width:20%">날짜</th>
            <th style="width:20%">조회수</th>
        </tr>
 
    <c:forEach items="${ qnaList }" var="qnaBoard">
        <tr>
            <td>${ qnaBoard.qnaSeq }</td>
            <td><a href="/qna/detail?b_no=${ qnaBoard.qnaSeq }">${qnaBoard.qtitle }</a></td>
            <td>${ qnaBoard.userSeq }</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ qnaBoard.qwriteDate }" /> </td>
            <td><span> ${ qnaBoard.qtext }</span> 
            </td>
        </tr>
    </c:forEach>
    </table>
    
    <a href="<%=request.getContextPath()%>/qna/qnawrite">글쓰기</a>
	
</body>
</html>