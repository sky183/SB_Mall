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

	<div class="container-fluid all">
		<div id="dialog" class="noselect" title="Welcome!">
		</div>
		<div class="jumbotron">
			<h1 class="text-center">Weather App</h1>
		</div>
		<div class="row">
			<div class="col-md-12 well" id="city">
				<h2 class="text-center">Weather for</h2>
				
				<h2 class="text-center data-item" id="city-text"></h2>


				<div class="row">
					<div class="col-md-4" id="weather">
						<img src="" id="weatherImg" class="center-block">
						<h3 class="text-center data-item" id="weather-text"></h3>
					</div>
					<div class="col-md-4" id="weather">
						<h3 class="text-center">날씨</h3>
						<h3 class="text-center data-item">
							<span id="weather-text2"></span>
						</h3>
					</div>
					<div class="col-md-4" id="temp">
						<h3 class="text-center">온도</h3>
						<h3 class="text-center data-item noselect">
							<span id="temp-text"></span> <span id="tempMode">F&deg</span>
						</h3>
					</div>
					<div class="col-md-4" id="wind">
						<h3 class="text-center">Wind Speed</h3>
						<h3 class="text-center data-item" id="wind-text"></h3>
					</div>
				</div>
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
		<div id = "gj">
		
		
		</div>
	</div>

</body>
<script>      
	getWeather(35.166672,126.916672).done(gj);
	function gj(data){ 
		var kelvin = data.main.temp;
		var cels = (kelvin - 273.15).toFixed(1);
		$("#gj").html("광주의날씨"+data.weather[0].main);	
		$("#gj").append("광주의온도"+cels);	
		
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
		$tempText.html(fahr);

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
			// display location name
			$("#city-text").html(data.name + ", " + data.sys.country);
			// display icon
			if (data.weather) {
				var imgURL = "http://openweathermap.org/img/w/"
						+ data.weather[0].icon + ".png";
				$("#weatherImg").attr("src", imgURL);
				$("#weather-text").html(data.weather[0].description);
				$("#weather-text2").html(data.weather[0].main);
			}
			// display wind speed
			if (data.wind) {
				var knots = data.wind.speed * 1.9438445;
				$windText.html(knots.toFixed(1) + " Knots");
			}
		}
	}
	//This calls the api with the correct coordinates provided by the getLocation function
	function getWeather(lat, lon) {
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&APPID=56c39f42568ae0dcb25c73fa6db6fc8f";
		//lat=37.56826&lon=126.977829
		return $.ajax({
			url : apiURI,
			dataType : "json",
			type : "GET",
			async : "true",
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




