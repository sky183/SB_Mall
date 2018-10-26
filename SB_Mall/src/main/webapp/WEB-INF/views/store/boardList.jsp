<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.storeListContainer{
	width: 70%;
	margin: 0 auto;
	background-color: white;
	
}
.storeSearchBar{
	display:block;
	height: 40px;
	margin: 100px 0 20px 0;
	word-wrap:break-word;
	border-bottom: 1px solid #a9a9a9;
}
.searchFormContainer{
	width: 250px;
	height: 30px;
	float: right;
	border: 1px solid #a9a9a9;
    border-radius: 5px;
    vertical-align: middle;
    margin-right: 20px; 
}
.searchText{
	width: 200px;
	height: 25px;
	margin: 2px 0px 2px 3px;
	float: left;
	border: 0;
}
.searchButton{
	width: 40px;
	height: 30px;
	border: 0px;
	border-radius: 5px;
	background-size: 30px;
    background-repeat: no-repeat;
    outline: 0;
    cursor:pointer;
    float: right;
    background-color: white;
	background-image: url('<%=request.getContextPath()%>/img/searchBarIcon.png');
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	$('document').ready(function() {
		$('.storeListView').load('./store/boardListView');
	});
</script>
</head>
<body>
	<div class="storeListContainer">
		<div class="storeSearchBar">
				<div class="searchFormContainer">
					<form method="post">
						<input type="text" class="searchText" 
							placeholder=" 상품검색">
						<input type="submit" value="" class="searchButton">
					</form>
				</div>
				<select>
					<option>hh</option>
				</select>
		</div>
		<div class="storeListView">
		dd
		</div>
		<div class="storeListFooter">
			<a href="./store/write">글쓰기</a>
		</div>
	</div>
</body>
</html>