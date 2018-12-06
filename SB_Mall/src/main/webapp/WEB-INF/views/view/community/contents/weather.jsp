<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weather api</title>

<link rel="stylesheet"href="<%=request.getContextPath()%>/css/weather.css">
 
</head>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript">
	//APPID=56c39f42568ae0dcb25c73fa6db6fc8f
	//서울 날씨 
	//http://api.openweathermap.org/data/2.5/weather?lat=37.56826&lon=126.977829&APPID=56c39f42568ae0dcb25c73fa6db6fc8f
	/* 
	 var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=37.56826&lon=126.977829&APPID=56c39f42568ae0dcb25c73fa6db6fc8f";
	 $.ajax({
	 url : apiURI,
	 dataType : "json",
	 type : "GET",
	 async : "false",
	 success : function(resp) {
	 console.log(resp);
	 console.log("현재온도 : " + (resp.main.temp - 273.15));
	 console.log("현재습도 : " + resp.main.humidity);
	 console.log("날씨 : " + resp.weather[0].main);
	 console.log("상세날씨설명 : " + resp.weather[0].description);
	 console.log("날씨 이미지 : " + resp.weather[0].icon);
	 console.log("바람   : " + resp.wind.speed);
	 console.log("나라   : " + resp.sys.country);
	 console.log("도시이름  : " + resp.name);
	 console.log("구름  : " + (resp.clouds.all) + "%");
	 }
	 }) */
</script>
<body>

	<div id="container-all">
		<div id="container-second">
			<span id="main-block">

				<span class="icon" id="weather">
				<img src="" id="weatherImg"/>
				</span>
				 

				<span class="city" style="width:150px;">seoul.KR</span>
				

				<span class="temp"></span>
				

				<span class="weather" id="weather-text"></span> 
				<span id="temp-text"></span>
				 
				<span id="tempMode">C&deg</span>
			

				<span class="wind"></span>
				 id="wind-text"
			</span>
			<span id="main-block">

				<span class="icon" id="weather"></span>
				 <img src="" id="weatherImg">

				<span class="city"></span>
				

				<span class="temp"></span>
				

				<span class="weather" id="weather-text"></span> 

				<span id="tempMode">C&deg</span>
				
				<span id="temp-text"></span>

				<span class="wind" id="wind-text"></span>
			</span>
			</div>
		</div>
		<div class="footer">
			<div class="container">
				<p class="copyright">
					Copyright © Brandon Gottschling 2016. All Rights Reserved. Made
					with the <a href="http://www.openweathermap.com">openweathermap</a>
					API.
				</p>
			</div>
		</div>
		

</body>
<script>      
var weatherArray = new Array();

weatherArray[0] = {
	"id" : "서울",
	"lon" : 127,
	"lat" : 37.583328,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[1] = {
	"id" : "경기",
	"lon" : 127.25,
	"lat" : 37.599998,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[2] = {
	"id" : "강원",
	"lon" : 128.25,
	"lat" : 37.75,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[3] = {
	"id" : "충남",
	"lon" : 127,
	"lat" : 36.5,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[4] = {
	"id" : "충북",
	"lon" : 128,
	"lat" : 36.75,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[5] = {
	"id" : "전북",
	"lon" : 127.25,
	"lat" : 35.75,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[6] = {
	"id" : "전남",
	"lon" : 127,
	"lat" : 34.75,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : "",
	"city" : "",
	"knot" : "",
	"weather" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[7] = {
	"id" : "경북",
	"lon" : 128.75,
	"lat" : 36.333328,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[8] = {
	"id" : "경남",
	"lon" : 128.25,
	"lat" : 35.25,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[9] = {
	"id" : "제주",
	"lon" : 126.5,
	"lat" : 33.416672,
	"temperature" : 0,
	"icon" : "",
	"city" : "",
	"knot" : "",
	"weather" : ""
};
weatherArray[10] = {
		"id" : "인천",
		"lon" : 126.416107,
		"lat" : 37.450001,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};
weatherArray[11] = {
		"id" : "대전",
		"lon" : 127.416672,
		"lat" : 36.333328,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};
weatherArray[12] = {
		"id" : "광주",
		"lon" : 126.916672,
		"lat" : 35.166672,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};
weatherArray[13] = {
		"id" : "울산",
		"lon" : 129.266663,
		"lat" : 35.566669,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};
weatherArray[14] = {
		"id" : "대구",
		"lon" : 128.550003,
		"lat" : 35.799999,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};
weatherArray[15] = {
		"id" : "부산",
		"lon" : 129.050003,
		"lat" : 35.133331,
		"temperature" : 0,
		"icon" : "",
		"city" : "",
		"knot" : "",
		"weather" : ""
	};

	
	for(var i=0; i < weatherArray.length; i++){
		var thisname = weatherArray[i].id;
		var thislon = weatherArray[i].lon;
		var thislat = weatherArray[i].lat;
		getWeather(thislat, thislon, i).done();
		}
	
	
	//necessary global variables for selector caching.
	var $tempMode = $("#tempMode");
	var $tempText = $("#temp-text");
	var $windText = $("#wind-text");
	//$(document).ready(function() {
	// this function takes the temperature from the dataHandler and displays the temperature according to the correct temperature unit, and colors the temperature hot or cold.

	//function for instruction dialog
/* 	$(function() {
		$("#dialog").dialog();
	}); */

	function formatTemperature(kelvin) {

		var clicked = false;
		var fahr = ((kelvin * 9 / 5) - 459.67).toFixed(0);
		var cels = (kelvin - 273.15).toFixed(1);
		//initial temperature display
		$tempText.html(cels);

		var firstClick = false;
		//click handler to update the temperature unit of measurement.
		$tempMode.off("click").on(
				"click",
				function() {
					firstClick = true;
					console.log(clicked);
					clicked === false ? clicked = true : clicked = false;
					clicked === true ? $tempMode.html("C&deg") : $tempMode
							.html("F&deg");
					if (clicked) {
						$tempText.html(cels);
					} else
						$tempText.html(fahr);
				});

		if (cels > 24) {
			$("#temp-text").css("color", "red");
		} else if (cels < 18) {
			$("#temp-text").css("color", "blue");
		}
	}
	//handles response data and formats it accordingly since it is an asynchronous response object all data handling and formatting must be done within this function.
	function dataHandler(data) {

		formatTemperature(data.main.temp);

		if (data.main.temp && data.name && data.sys) {

			//지역 값 받아오는 
			$("#city-text").html(data.name + ", " + data.sys.country);
			// 아이콘 받아오는 
			if (data.weather) {
				var imgURL = "http://openweathermap.org/img/w/"
						+ data.weather[0].icon + ".png";
				$("#weatherImg").attr("src", imgURL);
				//날씨 받아오는 
				$("#weather-text").html(data.weather[0].main);
			}
			//풍속 받아오는 
			if (data.wind) {
				var knots = data.wind.speed * 1.9438445;
				$windText.html(knots.toFixed(1) + " Knots");
			}
		}
	}
	//This calls the api with the correct coordinates provided by the getLocation function
	function getWeather(lat, lon, i) {
		var index = i;
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="
				+ lat + "&lon=" + lon
				+ "&APPID=56c39f42568ae0dcb25c73fa6db6fc8f";

		//lat=37.56826&lon=126.977829
		return $
				.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "true",
					success : function(data) {
						if (index >= 0) {
							weatherArray[index].temperature = (data.main.temp - 273.15)
									.toFixed(1);
							weatherArray[index].weather = data.weather[0].main;
							weatherArray[index].icon = "http://openweathermap.org/img/w/"
									+ data.weather[0].icon + ".png";
							weatherArray[index].knot = (data.wind.speed * 1.9438445)
									.toFixed(1);
						}
					}

				});
	}

	//Passes the browser's geolocation into the getWeather function once its done the response from the getWeather call will be passed to the data handler for formatting.
	var counter = 0;

	function getLocation() {
		console.log("Update# " + counter++);
		if ("geolocation" in navigator) {
			navigator.geolocation.getCurrentPosition(function(position) {
				getWeather(position.coords.latitude, position.coords.longitude)
						.done(dataHandler);
			})
		} else {
			alert("geolocation not available");
		}
	}
	var updateInterval = setInterval(getLocation(), 300000);
	//});
</script>



</html>




