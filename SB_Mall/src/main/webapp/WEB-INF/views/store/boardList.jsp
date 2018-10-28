<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#storeListContainer{
	width: 70%;
	margin: 0 auto;
	background-color: white;
}

.storeListView{
	text-align: center;
}
.productListThumb{
	width: 308px;
	height: 308px;
	margin-bottom:3px;;
	border:1px solid #a9a9a9;
	border-radius: 10px;
}
.productListBox{
	display:inline-block;
	width:  310px;
	height: 400px;
	overflow: hidden;
}
.productListBox:hover{
	background-color:#F2F2F2;
}
.nodeco{
	color:black;
	text-decoration: none !important;
}
.nodeco:active{
	color:black;
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
	background-image: url('<%=request.getContextPath()%>/img/searchBarIcon.png');
	background-color: white;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	$('document').ready(function() {
		$('.storeListView').load('<%=request.getContextPath()%>/store/boardListView');
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
		
		</div>
		<div class="storeListFooter">
			<a href="<%=request.getContextPath()%>/store/write">글쓰기</a>
		</div>
	</div>
</body>
</html>