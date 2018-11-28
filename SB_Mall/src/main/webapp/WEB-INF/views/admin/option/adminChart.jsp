<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 주문 상태 -->
<div id="orderStatus">
</div>
<!-- 인기상품 Top5 -->
<div id="top5">
</div>
<!-- 이번년도 월별 매출 평균매출 그래프-->
<div id="this-year-average">
</div>

<!-- 주문 상태 -->
<script type="text/javascript">
var orderStatus = JSON.parse ('${orderStatus}');
var chart = jui.include("chart.builder");

chart("#orderStatus", {
  padding : {
	  right : 10
  },
  theme : "gradient",
  width: 250,
  height: 250,
    axis : [{
        x : {
            type : "range",
  domain : "count" ,
            step : 10,
    hide:true
        },
        y : {
            type : "block",
            domain : "status",
            line : true
        },
        data : orderStatus
    }],
    brush : [{
        type : "bar",
        target : "count",
        activeEvent : "mouseover",
        active : 1,
         colors : [7]
    }],
    widget : [{
        type : "title",
        text : "주문 건수",
        size : 10
    },
      {
        type : "tooltip"
    }]
});

</script>

<!-- 인기상품 Top5 차트-->
<script type="text/javascript">
var dataTop5 = JSON.parse ('${dataTop5}');
var chart = jui.include("chart.builder");

jui.ready([ "chart.builder" ], function(chart) {
	
    var c = chart("#top5", {
        padding: 10,
        width: 180,
        height : 250,
        theme : "gradient",
        axis : {
            data : [dataTop5]
        },
        style: {
            titleFontSize: 10,
            pieOuterFontSize: 10,
            pieOuterFontColor: '#505050',
            pieInnerFontSize: 10,
            pieInnerFontColor: '#505050',
            gridXfontSize: 10,
            gridYfontSize: 10,
            legendFontSize: 10
        },
        brush : [{
            type : "pie",
            //표시될 값을 밖에 할지 안에 할지 설정
            showText : "inside",
            format : function(k, v, max) {
                //값 표시 방법
                return ((v/max)*100).toFixed(0) + "%";
            },
            active : [ 0, 1],
            activeEvent : "click",
            //브러시에 사용할 컬러 목록
            colors : [ 7,1,6,8,9 ]
        }],
        widget : [ 
        { type : "title", orient : "top", text : "인기상품 Top5"},
        { type : "tooltip" },
        { type : "legend",  orient : "bottom"}]
    });
})

</script>
<!-- 이번년도 월별 매출 평균매출 그래프-->
<script type="text/javascript">
var salesYear = JSON.parse ('${salesYear}');
var chart = jui.include("chart.builder");
var data = salesYear;

chart("#this-year-average", {
	//차트 전체 설정
    padding : {
       right : -10
    },
    width: 500,
    style : {
       	//제목 사이즈
        titleFontSize: 10,
        legendFontSize:10,
        gridXFontSize:10,
        gridYFontSize:10
    },
    //축 그리기 설정
    axis : [{
    	//X축 설정
        x : {
            domain : "month",
            line : true
        },
        //Y축 설정
        y : {
            type : "range",
            //축의 값 - [0, 100] 이런식으로 하면 최대값이 100까지 표시된다.
            domain: "매출",
            format : function(k, v, max) {
                //값 표시 방법
             return (k/100000000).toFixed(0) + "억";
            },
            step : 10,
            color : "#555555",
        },
        data : data
    }, {
        extend : 0
    }],
    //브러시 (막대 또는 꺾은선 등등 값을 표시하는 )
    brush : [
    	{ type : "column", target : "매출", colors : [ "#555555" ], animate:true, outerPadding : 5 },
    	// 가로선, display : "max"는 최고값을 표시하는것
    	{ type : "line", target : "평균", axis :1,  colors : [ "red" ]/* , display : "max" */ }
    ],
    widget : [
    	//제목
    	{ type : "title", text : "월 매출" },
    	//하단 목차
    	{ type : "legend",  orient : "bottom", brush : [ 0, 1]},
     	//툴팁
    	{type:"tooltip"}
    ]

});
</script>