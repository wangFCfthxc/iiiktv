<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${clientBean == null}" >
	<c:redirect url="/MessagePage/notClient.html"></c:redirect>
</c:if>
<html>
<Head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>修改會員資料</title>

	<link href="../css/bootstrap.css" rel="stylesheet">
	<link href="../css/menberRegister02.css" rel="stylesheet">
	<link href="../css/social-buttons.css" rel="stylesheet">
</head>
<body>

<div class="form" >
      
	<ul class="tab-group">
		<li class="tab active"><a href="#">修改會員資料</a></li>
	</ul>
	
	<!---------------------------- Start form ---------------------------->
	<form action="../ClientUpLookServlert.controller" method="post">
	<h1>請輸入新手機號碼</h1>
	<br>
	<h3>您好&nbsp;${clientBean.clientName }</h3>
	<div class="field-wrap">
	<label>手機號碼<span class="req">*</span></label>
	<input type="tel" pattern="^09[0-9]{8}$" title="必須為09開頭、共10數字組成" type="tel" id="input_size"  
		name="tel" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" required autocomplete="off"/>
	</div>
	<br/>
	<button type="button" class="button button-block" align="center" onclick="clearAll()">清&nbsp;除</button>
	<button type="submit" class="button button-block" >送&nbsp;出</button>
	
	</form>
	<!---------------------------- End form ---------------------------->
		
	<div class="field-wrap">
	<button type="button" class="button button-block" align="center" onclick="javascript:location.href='../index.jsp'">回首頁</button>
	</div>
	
</div><!-- end form -->

<script src="../js/jquery-3.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/menberRegister02.js"></script>

</body>
</html>
