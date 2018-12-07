<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery.tablesorter.min.js"></script> 
<script type="text/javascript">
	//	//inputSel 클래스 선택시 글자 전체선택한다.
	inputSel();
	//text타입의 input에서 엔터 누르면 포커스 아웃
	enterText();
	//테이블 정렬
	$(".tablesorter").tablesorter();
</script>