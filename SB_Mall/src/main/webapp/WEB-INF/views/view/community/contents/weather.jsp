<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weather api</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons-wind.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons-wind.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/weather.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="midBannerBox">
		<h3 class="rowdWriteBannerH3">얼리버드</h3>
	</div>
	
<!-- 	전체를 감싸는 컨테이너	 -->
	<div id="container-all">
	
		<div id="container-top">
		
			 <div class="leftBox">
						왼쪽박스
            <!-- leftBox의 끝 -->
			</div>
			<div class="rightBox">
				<div class="rightBoxT">
				
				<!-- rightBoxT의 끝 --> 			
				</div>
				<div class="rightBoxB">
					<div class="xbox">
						<p>풍속</p>					
						<p>습도</p>
						<p>강수확률</p>					
					</div>
					<div class="xbox2">
					<p>1.7</p>
					<p>1.8</p>
					<p>1.9</p>
					</div>
				<!-- rightBoxB의 끝 --> 			
				</div>
			<!-- rightBox의끝 -->
			</div>
		
		<!-- container-top의 끝 -->
		</div>
		
		
		<div id="container-bottom">
			
		<!-- container-bottom의 끝 -->
		</div>
		
		
<!-- container-all의 끝 -->
	</div>
</body>
<script>
	var weatherArray = new Array();

	weatherArray[0] = {
		"city" : "서울",
		"lon" : 127,
		"lat" : 37.583328,
	};
	weatherArray[1] = {
		"city" : "경기",
		"lon" : 127.25,
		"lat" : 37.599998,
	};
	weatherArray[2] = {
		"city" : "강원",
		"lon" : 128.25,
		"lat" : 37.75,
	};
	weatherArray[3] = {
		"city" : "충남",
		"lon" : 127,
		"lat" : 36.5,
	};
	weatherArray[4] = {
		"city" : "충북",
		"lon" : 128,
		"lat" : 36.75,
	};
	weatherArray[5] = {
		"city" : "전북",
		"lon" : 127.25,
		"lat" : 35.75,
	};
	weatherArray[6] = {
		"city" : "전남",
		"lon" : 127,
		"lat" : 34.75,
	};
	weatherArray[7] = {
		"city" : "경북",
		"lon" : 128.75,
		"lat" : 36.333328,
	};
	weatherArray[8] = {
		"city" : "경남",
		"lon" : 128.25,
		"lat" : 35.25,
	};
	weatherArray[9] = {
		"city" : "제주",
		"lon" : 126.5,
		"lat" : 33.416672,
	};
	weatherArray[10] = {
		"city" : "인천",
		"lon" : 126.416107,
		"lat" : 37.450001,
	};
	weatherArray[11] = {
		"city" : "대전",
		"lon" : 127.416672,
		"lat" : 36.333328,
	};
	weatherArray[12] = {
		"city" : "광주",
		"lon" : 126.916672,
		"lat" : 35.166672,
	};
	weatherArray[13] = {
		"city" : "울산",
		"lon" : 129.266663,
		"lat" : 35.566669,
	};
	weatherArray[14] = {
		"city" : "대구",
		"lon" : 128.550003,
		"lat" : 35.799999,
	};
	weatherArray[15] = {
		"city" : "부산",
		"lon" : 129.050003,
		"lat" : 35.133331,
	};
	
	//getLocation()을 실행한다.
	var updateInterval = setInterval(getLocation(), 300000);
	
	//현재 지역의 정보를 받아 getweather(위도와 경도를 받아 값을 반환하는 함수)을 실행한다.
	function getLocation() {
		if ("geolocation" in navigator) {
			navigator.geolocation.getCurrentPosition(function(position) {
				getWeather(position.coords.latitude, position.coords.longitude)
						.done(dataHandler);
			})
		} else {
			alert("geolocation not available");
		}
	}
	
	//위도와 경도를 받아 값을 반환한다.
	function getWeather(lat, lon, i) {
		var index = i;
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+ lat + "&lon=" + lon+ "&APPID=56c39f42568ae0dcb25c73fa6db6fc8f";

		return $.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "true",
					success : function(data) {
						//전국 지역 날씨 html에 값을 넣어준다.
						if (index >= 0) {
// 							weatherArray[index].weather = data.weather[0].description;
// 							weatherArray[index].knot = (data.wind.speed * 1.9438445).toFixed(1);
// 							weatherArray[index].temperature =(data.main.temp - 273.15).toFixed(1);
// 							weatherArray[index].humidity  = data.main.humidity;
// 							weatherArray[index].clouds = data.clouds.all;
							$('#city'+ i).find('.cityname').html(weatherArray[index].city);
							$('#city'+ i).find('.weather').html(data.weather[0].description);
							$('#city'+ i).find('.knots').html((data.wind.speed * 1.9438445).toFixed(1));
							$('#city'+ i).find('.temperature').html((data.main.temp - 273.15).toFixed(1));
							$('#city'+ i).find('.humidity').html(data.main.humidity);
							$('#city'+ i).find('.clouds').html(data.clouds.all);
							
						}
					}
				});
	}

	//getWeather 에서 받은 값을 변수에 넣고 현재 지역 날씨 html태그에 넣어준다.
	function dataHandler(data) {

		var city;
		var weather;
		var knots;
		var temperature;
		var humidity;
		var clouds;

		if (data.main.temp && data.name && data.sys) {

			//지역 
			city = data.name + ", " + data.sys.country;
			// 날씨 
			if (data.weather) {
				weather=data.weather[0].description;
			}
			//풍속 
			if (data.wind) {
				knots = (data.wind.speed * 1.9438445).toFixed(1);
			}
			//온도
			temperature = (data.main.temp - 273.15).toFixed(1);
			//습도			
			humidity = data.main.humidity;
			//구름
			clouds = data.clouds.all;		
		}
		
		$('#city').html(city);
		$('#weather').html(weather);
		$('#knots').html(knots);
		$('#temperature').html(temperature);
		$('#humidity').html(humidity);
		$('#clouds').html(clouds);
		
	}
	
	
	//weatherArray의 위도와 경도를 getweater 함수에 넣어서 날씨 정보를 받은후 해당하는 div id를 찾아서 입력한다.(미완성)
	for (var i = 0; i < weatherArray.length; i++) {
		var thisname = weatherArray[i].city;
		var thislon = weatherArray[i].lon;
		var thislat = weatherArray[i].lat;
		getWeather(thislat, thislon, i);
	}
	

	$(document).ready(function(){
		console.log(weatherArray)
	})



	

	//});
</script>



</html>




<!-- 		<i class="wi wi-night-sleet" style= "color : #ffc828"></i> -->
<!-- 		<div class ="ib" ></div><div class="ib">C&deg</div> -->