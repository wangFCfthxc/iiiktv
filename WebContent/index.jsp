<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KTV</title>
<!-- bootstrap version 3.3.1  -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/infoNav.css" rel="stylesheet">
<link href="css/infoCarousel.css" rel="stylesheet">
<link href="css/context.css" rel="stylesheet">
<link href="css/footer.css" rel="stylesheet">
</head>
<body>
	<!-- navbar================================================== -->
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.jsp">KTV</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="Login/loginList.html">會員中心</a></li>
                <li><a href="LoginBooking/bookingBox.jsp">線上訂位</a></li>
                <li><a href="processRequest.jsp">ＫＴＶ找歌</a></li>
                <li><a href="map/Map01.jsp">聯絡資訊</a></li>
               </ul>
               <ul class="nav navbar-nav navbar-right">
               		<c:choose>
               		<c:when test="${clientBean == null}">
                    <li><a href="Login/menberRegister01.html"><span class="glyphicon glyphicon-log-in"></span>登  入</a></li>
                    </c:when>
                    <c:otherwise>
                    <li><a data-toggle="tab"><span class="glyphicon glyphicon-user"></span>${clientBean.clientName }</a></li>
                	</c:otherwise>
                	</c:choose>
               </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
    <!-- navbar================================================== -->
    
    <!-- Carousel================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="img/AD01.jpg">
        </div>
        <div class="item">
          <img class="second-slide" src="img/AD02.jpg">
        </div>
        <div class="item">
          <img class="third-slide" src="img/AD03.jpg">
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <!-- /Carousel================================================== -->
    
    <!-- context================================================== -->
    <div class="container-fluid" id="context">
    	<div class="row text-uppercase text-center">
    		<div class="col-md-4 col-sm-12 ">
    			<h1>最新消息</h1>
    			<ul class="contextNav" id="newCol">
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    			</ul>
    		</div>
    		
    		<div class="col-md-4 col-sm-12 ">
    			<h1>歌曲排行榜</h1>
    			<ul class="contextNav" id="rankCol">
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    			</ul>
    		</div>
    		<div class="col-md-4 col-sm-12 ">
    			<h1>新歌快訊</h1>
    			<ul class="contextNav" id="webCol">
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    				<li><a href="#">歡慶1月32日開幕免費歡唱</a></li>
    			</ul>
    		</div>
    	</div>
    </div>
	<!-- /context================================================== -->
	

	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div class="embed-responsive embed-responsive-4by3">
				  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/PCCoDZ0fkV8?list=PL3oW2tjiIxvTUfDOkivqSDxrxfQccwxsN"></iframe>
				</div>
			</div>
			<div class="col-md-5">
			</div>	
		</div>
	</div>

	
	<!-- footer================================================== -->
	<div class="footer">
		<div class="container">
			<p class="text-muted">KTV歡唱網站<br/>製作人員<br/>組長：陳勃宏<br/>組員：陳伯彰、王俞鈞</p>
		</div>
	</div>
	<!-- /footer================================================== -->	

<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>