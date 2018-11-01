<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div id="boardDetailHeader">
	<p>상세설명</p>
	</div>
	<br>
	<div id="boardTextContainer">
		${board.text}
	</div>
	</c:forEach>
</c:if>
	<br>
	<div id="boardReplyContainer">
	</div>
</div>
</body>
</html>