<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
		
		
		<div id="replyPaged">
		<c:forEach var="reList" items="${replyList}">
    		<div>
    			<h4>${reList.userId}</h4>
    			<h6>${reList.regTime}</h6>
    			<h5>${reList.reply}</h5>
    			<c:if test="${reList.userSeq==userSession.userSeq}">
    				<button class="replyDelete" value="${reList.replySeq}">삭제</button>
    			</c:if>
    		</div>
    		
    	</c:forEach>
    	</div>
    	
    	<div id="paging">
    	<c:forEach var="i"  begin="1" end="${pageCnt}" step="1">
    		<c:choose>
	    		<c:when test="${i==nowPage}">
	    			<button name="nowPage" class="pageSelect pageActive" style="width:100px">${i}</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button name="nowPage" class="pageSelect" style="width:100px">${i}</button>
	    		</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	</div>
    	
    	