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
  <title>旗艦店</title>
  <!-- bootstrap version 3.3.1  -->
  <link href="../css/bootstrap.css" rel="stylesheet">
  <link href="../css/infoNav.css" rel="stylesheet">
  <link href="../css/infoCarousel.css" rel="stylesheet">
  <link href="../css/context.css" rel="stylesheet">
  <link href="../css/footer.css" rel="stylesheet">
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
            <a class="navbar-brand" href="../index.jsp">KTV</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="../Login/loginList.html">會員中心</a></li>
                <li><a href="../LoginBooking/bookingBox.jsp">線上訂位</a></li>
                <li><a href="../processRequest.jsp">ＫＴＶ找歌</a></li>
                <li><a href="Map01.jsp">聯絡資訊</a></li>
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
        <img class="first-slide" src="../img/AD01.jpg">
      </div>
      <div class="item">
        <img class="second-slide" src="../img/AD02.jpg">
      </div>
      <div class="item">
        <img class="third-slide" src="../img/AD03.jpg">
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
  <div class="container">
    <div class="container-fluid" id="context">
      <div class="row text-uppercase text-center">
        <div class="col-md-6">
          <div id="googleMap" style="width: 100%; height: 500px; background:yellow"></div>
        </div>
        <br>
        <div class="col-md-6">
          <div align="center">
            <img src="../img/Store1.jpg" style="width: 80%; height: 80%" /><br><br>
            <!-- Single button -->
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        門市資訊 <span class="caret"></span>
                    </button>
              <ul class="dropdown-menu">
                <li><a href="Map01.jsp">旗艦店</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="Map02.jsp">逢甲店</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="Map03.jsp">梧棲店</a></li>
                <li role="separator" class="divider"></li>
              </ul>
            </div>
            <!-- 門市資訊 -->
            <h3>旗艦店</h3>
            <p>營業時間 : 24H</p>
            <p>門市地址 : <a href="https://goo.gl/maps/K1Rnro66qx32">台中市西屯區臺灣大道三段527號</a></p>
            <p>訂位電話 : <a href="tel:0422595511">04-22595511</a></p>
            <div class="btn-group btn-group-justified">
              <a href="../LoginBooking/bookingBox.jsp" class="btn btn-primary">立即訂位</a>
              <a href="../index.jsp" class="btn btn-primary">回首頁</a>
            </div>
            <br>
          </div>
        </div>
        <br>
        <div class="col-md-12">
          <div class="col-md-2">
          </div>
          <div class="col-md-8">
            <div align="center">
              <div id="myCarousel2" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel2" data-slide-to="1"></li>
                  <li data-target="#myCarousel2" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                  <div class="item active">
                    <img src="../img/BigRoom1.jpg" alt="旗艦店">
                    <div class="carousel-caption">
                      <h3>旗艦店</h3>
                      <p>大包廂</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../img/MidRoom1.jpg" alt="旗艦店">
                    <div class="carousel-caption">
                      <h3>旗艦店</h3>
                      <p>中包廂</p>
                    </div>
                  </div>

                  <div class="item">
                    <img src="../img/SmlRoom1.jpg" alt="旗艦店">
                    <div class="carousel-caption">
                      <h3>旗艦店</h3>
                      <p>小包廂</p>
                    </div>
                  </div>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-2">
          </div>
        </div>


      </div>
    </div>
  </div>
<script src="../js/jquery-3.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyA1_s2SgBaH2YiI8v_s3GubyeTzxpSW2bE"></script>
<script>
// 建立地圖物件
var mapProp = {
  center: new google.maps.LatLng(24.1692609, 120.6384089),
  zoom: 19,
  mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(
  $("#googleMap")[0],
  mapProp);
// 加上圖標
var marker = new google.maps.Marker({
  position: new google.maps.LatLng(24.1692609, 120.6384089),
  animation: google.maps.Animation.BOUNCE
});
marker.setMap(map);

var infowindow = new google.maps.InfoWindow({
  content: "旗艦店"
});

infowindow.open(map, marker);
</script>
</body>

</html>
