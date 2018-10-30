<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="newProductBigBox">
	
	<c:if test="${newProduct!=null}">
		<div class="newProBox">
		<c:forEach var="newPro" items="${newProduct}">
			<span class="newProduct">
				<img class ="newProPhoto" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">		
				<h4 class="newProH4">${newPro.productName}</h4>
				<h6 class="newProH6">${newPro.price}won</h6>
			</span>
		</c:forEach>
		</div>
	</c:if>
	
	
	
	
</div>