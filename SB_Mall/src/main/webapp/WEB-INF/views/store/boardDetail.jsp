<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	width: 1200px;
	margin: 0 auto;
	background-color: white;
	word-wrap:break-word;
}
#boardProductContainer{
	width: 100%;
	margin: 20px auto;
	overflow: hidden;
}
#boardProductThumbBox{
	float:left;
	display: inline-block;
	width: 400px;
	height: 400px;
}
#boardProductThumb{
	display: inline-block;
	width: 100%;
	height: 99%;
	border:1px solid #a9a9a9;
	border-radius: 10px;
}
#boardProductName{
	border-bottom: 1px solid black;
	padding:10px; 
}
#boardProductOptionBox{
	float:left;
	display:inline-block;
	width: 800px;
	height: 400px;
	
}
#boardProductOptionBox>ul{
	margin-left: 20px;
}
#boardProductOptionBox>ul>li{
	overflow: hidden;
}
#boardProductOptionBox>ul>li>p{
	padding: 10px;
}
#boardTextContainer{
}
#boardReplyContainer{
}
.boardProductSel{
	height: 30px;
	width: 90%;
}
.boardBtn{
	display: inline-block;
	margin-left: 20px;
	padding: 10px 15px;
	margin:5px 20px;
	width: 200px;
	background-color: #FEC828;
	outline: none;
	border: 0px;
	border-radius: 10px;
}
.boardBtn:hover{
	cursor: pointer;
}
.boardBtn:active{
	box-shadow:0 0 1pt 1pt #5882FA;
}
.boardBtnMsg{
	color:white;
	font-size: 20px;
}
#selQuantity{
	height: 30px;
	font-size: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png'
	}
	function addCart() {
		$('#quantity').val($('#selQuantity').val());
		$('#option').val($('input[type=radio][name=color]:checked').val());
		//$('#hForm').submit();
        var queryString = $('#hForm').serialize();
        $.ajax({
				    url : '<%=request.getContextPath()%>/order/addCart',
				    type : 'POST',
					data : queryString,
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						alert(data);
					}
				});
	}
	function buyProduct() {
		$('#quantity').val($('#selQuantity').val());
		$('#option').val($('input[type=radio][name=color]:checked').val());
		$("#hForm").attr("action", "<%=request.getContextPath()%>/order/insOrder");
		$('#hForm').submit();
	}
	
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}

</script>
</head>
<body>
<div id=boardDetailContainer>
<c:if test="${viewList!=null}">
	<c:forEach var="board" items="${viewList}">
		<form method="post" id="hForm">
		<input type="hidden" value="${board.productSeq}" name="productSeq">
		<c:choose>
			<c:when test="${memberInfo!=null}">
				<input type="hidden" value="${memberInfo.userSeq}" name="userSeq">
			</c:when>
			<c:otherwise>
				<input type="hidden" value="0" name="userSeq">
			</c:otherwise>
		</c:choose>
		<input type="hidden" id="quantity" name="quantity">
		<input type="hidden" id="option" name="option">
		</form>
	<div id="boardProductContainer">
		<div id="boardProductThumbBox">
			<img src="${board.photo}" alt="이미지없음" id="boardProductThumb" 
				onerror="imgError(this)">
		</div>
		<div id="boardProductOptionBox">
			<ul>
				<li id="boardProductName"><h2>${board.productName}</h2></li>
				<li>
				<p>가격: <fmt:formatNumber value="${board.price}" pattern="###,###,###,###,###"/></p>
				</li>
				<li><p>등록일: ${board.writeDate}</p></li>
				<li><p>
				블랙 <input type="radio" value="black" name="color" checked="checked">
				화이트 <input type="radio" value="white" name="color">
				</p></li>
				<li>
				<p>
				<input type="number" id="selQuantity" value="1" min="1" oninput="mathABS(this)">
				</p>
				</li>
				<li>
				<p>
				<button class="boardBtn" onclick="addCart()">
				<p class="boardBtnMsg">장바구니추가</p></button>
				<button class="boardBtn" onclick="buyProduct()">
				<p class="boardBtnMsg">주문하기</p></button>
				</p>
				</li>
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