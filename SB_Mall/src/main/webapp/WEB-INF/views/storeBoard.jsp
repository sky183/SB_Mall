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
<jsp:include page="../views/common/header.jsp"/>
<jsp:include page="../views/store/headerBanner.jsp"/>
<jsp:include page="../views/store/boardList.jsp"/>
</body>
</html>