<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
  <title>My Now Amazing Webpage</title>
  <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  </head>
  <body>

<div class="blue">
  <div class="content">
    <div class="slider center">
      <div>   
        <div class="sibal">
			<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
			<h4>item</h4>
			<h6>won</h6>
        </div>
      </div> 
      <div>
        <div class="sibal">
			<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
			<h4>item</h4>
			<h6>won</h6>
        </div>
      </div>
      <div>
        <div class="sibal">
			<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
			<h4>item</h4>
			<h6>won</h6>
        </div>
      </div>
      <div>
        <div class="sibal">
			<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
			<h4>item</h4>
			<h6>won</h6>
        </div>
      </div>
      <div>
        <div class="sibal">
			<img class ="dailyDealImg" src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
			<h4>item</h4>
			<h6>won</h6>
        </div>
      </div>
    </div>
  </div>
  </div>

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="slick/slick.min.js"></script>

  <script type="text/javascript">
  $(".center").slick({
	  centerMode: true,
	  /* centerPadding: "0px", */
	  slidesToShow: 3,
	  draggable:false,
	  speed: 800,
	  variableWidth: true,
	  infinite: true
	  
	});
  </script>

  </body>
</html>