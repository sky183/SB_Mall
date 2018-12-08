<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/store.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/crowdOrder.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<jsp:include page="include/orderDetail.jsp"/>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>