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
		
		$('.boardListSelect').change(function(){
			$('.hPageNumber').val(1);
			$('.hCountPerPage').val($('#countView').val());
			$('.hSortType').val($('#sortType').val());
			$('.searchButton').trigger('click');
		});
		
		$('.searchButton').click(function() {
			var tag =  $("#searchForm").serialize();
			$.ajax({
				url : '<%=request.getContextPath()%>/store/boardListView',
				type : 'GET',
				data : tag,
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('.storeListView').empty();
					$('.storeListView').append(data);
					$('.hPageNumber').val($('.pageNumber').val());
					$('.hCountPerPage').val($('.countPerPage').val());
				}
			});
		});
		
	});
	
	function afnc(e) {
		$('.hPageNumber').val(e.value);
		$('.searchButton').trigger('click');
	}
	
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
						<input type="hidden" class="hPageNumber" name="pageNumber">
						<input type="hidden" class="hCountPerPage" name="countPerPage">
						<input type="hidden" class="hSortType" name="sortType">
					</form>
						<input type="button" value="" class="searchButton">
				</div>
				<select class="boardListSelect" id="countView">
					<option value="8">8개보기</option>
					<option value="16">16개보기</option>
					<option value="24">24개보기</option>
				</select>
				<select class="boardListSelect" id="sortType">
					<option value="s.viewSeq desc">조회수</option>
					<option value="s.writeDate desc">최신순</option>
				</select>
		</div>
		<div class="storeListView">
			
		</div>
		<c:if test="${memberInfo.gradeNum>=3}">
				<a class="storeBtn storeWriteBtn" 
				href="<%=request.getContextPath()%>/store/write">글쓰기</a>
			</c:if>
		<div class="storeListFooter">
			
		</div>
	</div>
</body>
</html>