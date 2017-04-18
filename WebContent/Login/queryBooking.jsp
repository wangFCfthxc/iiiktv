<%@page import="bean.ClientRegisterBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<% int i = 1; %>
<c:if test="${clientBean == null}" >
	<c:redirect url="/MessagePage/notClient.html"></c:redirect>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" 
	url="jdbc:mysql://localhost/KtvSong" user="root" password="root" 
	var="queryktvlist" scope="page"/>
<sql:query var="bookingBean" dataSource="${queryktvlist}" sql="select pkId,clientId,bkDate,bkTime,bkPeopleNum from clientBooking where clientId = ?">
		<sql:param value="${clientBean.clientId }" />
</sql:query>
<html>
<Head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../img/logo.png">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/menberRegister02.css" rel="stylesheet">
<link href="../css/modal_cancel.css" rel="stylesheet">
<title>訂位查詢</title>
</head>
<body>
<div class="form">
	<ul class="tab-group">
		<li class="tab active"><a>${clientBean.clientName }&nbsp;訂位查詢</a></li>
	</ul>    
		<div class="field-wrap">
			<table class='table table-striped' data-method="post" data-query-params="queryParams" data-toolbar="#toolbar" data-pagination="true" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-height="10" >
				<thead>		
					<tr class='row'>
						<th align="center"><em class="glyphicon glyphicon-cog"></em></th>
						<th>店名</th>
						<th>日期</th>
						<th>時間</th>
						<th>人數</th>
					</tr>			
				</thead>
				
				<tbody>
					<c:forEach items="${bookingBean.rows }" var="booking">
					<tr class='row' data-id='${booking.pkId }'>				
						<td align="center">
							<a class="btn btn-danger cancel" data-target="#modal-warning"><em class="glyphicon glyphicon-remove" title='取消'></em></a>
						</td>
						<td>
							<c:choose>
								<c:when test="${booking.bkTime < 59 }">台中旗艦店</c:when>
								<c:when test="${booking.bkTime < 69 }">台中逢甲店</c:when>
								<c:when test="${booking.bkTime < 79 }">台中悟棲店</c:when>
							</c:choose>
						</td>
						<td>${booking.bkDate }</td>
						<td>
							<c:choose>
								<c:when test="${booking.bkTime%10==0 }">00:00</c:when>
								<c:when test="${booking.bkTime%10==1 }">03:00</c:when>
								<c:when test="${booking.bkTime%10==2 }">06:00</c:when>
								<c:when test="${booking.bkTime%10==3 }">09:00</c:when>
								<c:when test="${booking.bkTime%10==4 }">12:00</c:when>
								<c:when test="${booking.bkTime%10==5 }">15:00</c:when>
								<c:when test="${booking.bkTime%10==6 }">18:00</c:when>
								<c:when test="${booking.bkTime%10==7 }">21:00</c:when>
							</c:choose>
						</td>
						<td>${booking.bkPeopleNum }</td>
					</tr>
					</c:forEach>
				</tbody>	          
			</table>
			<br>
			<button type="button" class="button button-block" align="center" onclick="javascript:location.href='../index.jsp'">回首頁</button>
		</div>    
</div>

<div id="modal-warning" class="modal modal-message modal-warning fade" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span class="glyphicon glyphicon-remove-sign" style="color:#d9534f"></span>
            </div>
            <div class="modal-body"><h4>確定要刪除訂位嗎?</h4></div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" id="beCanceled" class="btn btn-warning" >確定</button>
            </div>
        </div>
    </div>
</div>

<script src="../js/jquery-3.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/menberRegister02.js"></script>
</body>
</html>
