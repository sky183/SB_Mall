<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{
   list-style:none;
}
#boardDetailContainer{
	width: 70%;
	margin: 0 auto;
	background-color: white;
	word-wrap:break-word;
}
#boardProductContainer{
	width: 100%;
	margin: 0 auto;
	overflow: hidden;
}
#boardProductThumbBox{
	float:left;
	display: inline-block;
	width: 400px;
}
#boardProductThumb{
	display: inline-block;
	width: 398px;
	border:1px solid #a9a9a9;
	border-radius: 10px;
}
#boardProductName{
	border-bottom: 1px solid black;
}
#boardProductOptionBox{
	float:left;
	display:inline-block;
	width: 600px;
	height: 400px;
	
}
#boardTextContainer{
}
#boardReplyContainer{
}
</style>
<script type="text/javascript">
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png'
	}
</script>
</head>
<body>
<div id=boardDetailContainer>
<c:if test="${viewList!=null}">
	<c:forEach var="board" items="${viewList}">
	<div id="boardProductContainer">
		<div id="boardProductThumbBox">
			<img src="${board.photo}" alt="이미지없음" id="boardProductThumb" 
				onerror="imgError(this)">
		</div>
		<div id="boardProductOptionBox">
			<ul>
				<li id="boardProductName"><h2>${board.productName}</h2></li>
				<li>가격: ${board.price}</li>
				<li>등록일: ${board.writeDate}</li>
				<li><select><option>1</option></select></li>
				<li><select><option>2</option></select></li>
			</ul>
			<br>
		</div>
	</div>
	<h3>상세설명</h3>
	<hr>
	<br>
	<div id="boardTextContainer">
		${board.text}
	</div>
	</c:forEach>
</c:if>
	<hr>
	<br>
	<h3>댓글</h3>
	<hr>
	<br>
	<div id="boardReplyContainer">
	댓글내용
	</div>
</div>
</body>
</html>