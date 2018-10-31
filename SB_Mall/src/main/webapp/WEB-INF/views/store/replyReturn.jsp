<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %><c:forEach var="reList" items="${replyList}">
    		<div>
    			<h4>${reList.userId}</h4>
    			<h6>${reList.regTime}</h6>
    			<h5>${reList.reply}</h5>
    		</div>
    	</c:forEach>
    	<c:forEach var="i"  begin="1" end="${pageCnt}" step="1">
    		<button name="nowPage" class="pageSelect" style="width:100px">${i}</button>>
    	</c:forEach>
    	
    	