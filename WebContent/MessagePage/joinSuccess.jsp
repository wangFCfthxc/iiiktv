<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="3; url=index.jsp">
<title>加入會員成功</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/overTime.css" rel="stylesheet">

</head>
<body>

<div class="container">
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          
          
          <ul class="tab-group" id="already">
        <li class="tab active"><a>
        <em class="glyphicon glyphicon-thumbs-up"></em>
        	${clientBean.clientName } 歡迎您的加入!</a></li>
      </ul>
      
      
        </div>
        <div class="modal-body">
          <p>頁面將轉至會員專區</p>
          <br>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<!--script_Start-->
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/overTime.js"></script>



</body>
</html>