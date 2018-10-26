<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1,maximum-scale=1, user-scalable=no" />
    
<!-- <div id="headerBanner">

</div>
<div id="BannerTextBox">
	<div id="BannerText01">
		<h1 class="fontOpenSans BT_h1">SB COMPANY</h1>	
	</div>
	
	<div id="BannerText02">
		<h4 class="fontOpenSans BT_h4">
		Small electric vehicles from foldable bikes<br>
		and scooters to unicycles and hoverboards<br>
		are becoming more popular as "last mile"<br>
		tansportation
		
		</h4>
	</div>
</div> -->


<script>
	
	window.onload=function(){
		var x = screen.width;
		
		var img = document.getElementsByClassName("headerBannerImg");
		
		for (var i = 0; i < img.length; i++) {
			img[i].style.width=x;
			
		}
		/* var time = ${serverTime};
		alert(time); */
		
		alert("z");
	}


</script>



<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <!-- <li data-target="#demo" data-slide-to="3"></li> -->
  </ul>
  
  
  <div class="carousel-inner">
  
  
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/img/headerBanner45.png" alt="Los Angeles" class="headerBannerImg">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>   
    </div>
    
    
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/img/headerBanner45.png" alt="Chicago" class="headerBannerImg">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div>   
    </div>
    
    
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/img/headerBanner45.png" alt="New York" class="headerBannerImg">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>   
    </div>
    
    
  </div>
  
  
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>