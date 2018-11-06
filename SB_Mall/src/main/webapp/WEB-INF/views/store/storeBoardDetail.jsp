<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/store.css">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="headerBanner.jsp"/>
<jsp:include page="boardDetail.jsp"/>
<%@ include file="../store/reply.jsp" %>
</body>
</html>