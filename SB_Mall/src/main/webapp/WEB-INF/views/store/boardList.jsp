<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>

<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">

	$('document').ready(function() {
		$('.storeListView').load('<%=request.getContextPath()%>/store/boardListView');
		
		$('input[type="text"]').keydown(function() {
	        if (event.keyCode === 13) {
	            event.preventDefault();
	            $('.searchButton').trigger('click');
	        }
	    });
		
		$('.searchButton').click(function() {
			var tag =  $("#searchForm").serialize();
			$.ajax({
				url : '<%=request.getContextPath()%>/store/boardListView',
				type : 'POST',
				data : tag,
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('.storeListView').empty();
					$('.storeListView').append(data);
				}
			});
		});
		
	});
	function imgError(e) {
		e.src='<%=request.getContextPath()%>/img/noImage.png';
	}
</script>
</head>
<body>
	<div id="storeListContainer">
		<div class="storeSearchBar">
				<div class="searchFormContainer">
					<form method="get" class="searchForm" id="searchForm">
						<input type="text" class="searchText" name="tag"
							placeholder=" 상품검색">
					</form>
						<input type="button" value="" class="searchButton">
				</div>
				<select>
					<option>20개보기</option>
				</select>
		</div>
		<div class="storeListView">
		
		</div>
		<div class="storeListFooter">
		dd
			<c:if test="${userGrade>=3}">
				<a class="storeBtn storeWriteBtn" 
				href="<%=request.getContextPath()%>/store/write">글쓰기</a>
			</c:if>
		</div>
	</div>
</body>
</html>