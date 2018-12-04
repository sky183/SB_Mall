<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--화면 높이를 가져오기 위해 필수로 추가-->
 <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1,maximum-scale=1, user-scalable=no" />
<!-- 캘린더 객체 생성 -->
<%
Calendar cal = Calendar.getInstance();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
ArrayList<Object> monthArr = new ArrayList<Object>();

	for(int i=0; i <= 11; i++) {
		
		if(i > 0){
		cal.add(cal.MONTH, -1);
		} else {
			cal.add(cal.MONTH, 0);
		}
		String year = dateFormat.format(cal.getTime()).substring(0,4);
		String month = dateFormat.format(cal.getTime()).substring(4,6);
		
		request.setAttribute("year"+ i, year);
		request.setAttribute("month"+ i, month);
		monthArr.add(month);
}
		request.setAttribute("monthArr", monthArr);
		
		//숫자를 소수점 버리고 포맷 변환하는 함수
		double val = 1234525635.12;
		DecimalFormat numFormat = new DecimalFormat(",###");
		/* System.out.println(numFormat.format(val)); */
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

	   	<!-- Basic style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui-jennifer.min.css" />
	
	<!-- Grid style components -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid-jennifer.min.css" />
	
	<!-- Required script files -->
	<script src="<%=request.getContextPath()%>/jui/jui/lib/jquery-1.8.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	
	<!-- Basic script components -->
	<script src="<%=request.getContextPath()%>/jui/jui/dist/ui.min.js"></script>
	
	<!-- Grid script components -->
	<script src="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
	<script src="<%=request.getContextPath()%>/jui/jui-chart/dist/chart.js"></script>
	
<!-- datepicker -->
<!-- 	// jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<!-- monthpicker -->
<script src="<%=request.getContextPath()%>/monthpicker/js/jquery.mtz.monthpicker.js"></script>  
<%-- <script src="<%=request.getContextPath()%>/monthpicker/js/jquery-1.11.1.min.js"></script>   --%>
<%-- <script src="<%=request.getContextPath()%>/monthpicker/js/jquery-ui.min.js"></script>   --%>




</head>
<script>
//화면 크기 줄일 경우 높이를 다시 맞춰주는 함수
/* function resize(){
    var h = $(window).height();
    $('#leftContent').css({'height':(h-58)+'px'});
} */

//date포맷 함수
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

//오늘을 date 형식으로 구하기
var now = new Date();
//특정일 Date 형식으로 담을 변수
var thisDate;
//특정달 및 년을 yyyy.MM.dd 형식으로 변환
function getDate(object){
	return new Date(object).format("yyyy.MM.dd");
}
//오늘 구하기
var nowString =  now.format("yyyy.MM.dd");
//특정일 구하기
function getThisDate(object){return new Date(object).format("yyyy.MM.dd");}
//이번달 구하기
var nowMonth = now.format("yyyy.MM");
//이번년도를 구하기
var nowYear = now.format("yyyy");
//이번달 1일 말일을 각각 구하기
var firstDate = new Date(now.getFullYear(), now.getMonth(), 1).format("yyyy.MM.dd");
var lastDate =  new Date(now.getFullYear(), now.getMonth()+1, 0).format("yyyy.MM.dd");
//이번년도 1월 12월을 각각 구하기
var firstMonth = now.format("yyyy.01");
var lastMonth = now.format("yyyy.MM");

//특정달 1일 구하기
function getFistDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), 1).format("yyyy.MM.dd");
}
//특정달 말일 구하기
function getLastDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()+1, 0).format("yyyy.MM.dd");
}
//특정일 전날 구하기
function getPreDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), dateSource.getDate()-1).format("yyyy.MM.dd");
}
//특정일 다음날 구하기
function getNextDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), dateSource.getDate()+1).format("yyyy.MM.dd");
}
//특정달 전달 구하기
function getPreMonth(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()-1).format("yyyy.MM");
}
//특정달 다음달 구하기
function getNextMonth(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()+1).format("yyyy.MM");
}
//특정년 전년 구하기
function getPreYear(object){
	return new Date(object).format("yyyy")-1;
}
//특정년 전년 구하기
function getNextYear(object){
	return new Date(object).format("yyyy")+1;
}



// //2011년 09월 11일 오후 03시 45분 42초
// console.log(new Date('2018.01.01').format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
 
// //2011-09-11
// console.log(new Date().format("yyyy-MM-dd"));
 
// //'11 09.11
// console.log(now.format("yyyy.MM.dd"));
 
// //2011-09-11 일요일
// console.log(new Date().format("yyyy-MM-dd E"));
 
// //현재년도 : 2011
// console.log("현재년도 : " + new Date().format("yyyy"));


$('document').ready(function(){
/* 	resize();
	window.onresize = resize; */
    //좌측 메뉴 클릭시 서브메뉴 토글
    $('.leftMenu, .leftMenulast').on('click', function(){
        $(this).next('.leftSubmenu').slideToggle();
    })
/*document.ready의 끝*/  
})
</script>
