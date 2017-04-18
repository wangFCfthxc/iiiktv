<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:if test="${clientBean == null}" >
	<c:redirect url="/MessagePage/notClient.html"></c:redirect>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" 
	url="jdbc:mysql://localhost/KtvSong" user="root" password="root" 
	var="queryktvlist" scope="page"/>
<sql:query var="listBean" dataSource="${queryktvlist}" sql="select Cashbox_Id,Song_Lang,Song_SongName,Song_Singer from clientSonglist where Client_Id = ?">
		<sql:param value="${clientBean.clientId }" />
</sql:query>
<html>
<Head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="../css/bootstrap.css" rel="stylesheet">
	<link href="../css/menberRegister02.css" rel="stylesheet">
	<link href="../css/social-buttons.css" rel="stylesheet">
	<link href="../css/modal_cancel.css" rel="stylesheet">
	<title>個人歌單</title>
</head>
<body>

	<!----------------------- start form ----------------------->
	<div class="form" >
		<ul class="tab-group">
		<li class="tab active"><a href="#songTable">${clientBean.clientName }&nbsp;的歌單</a></li>
		</ul>

		<!----------------------- start songTable ----------------------->
		<div id="songTable">
			<!----------------------- start field-wrap ----------------------->
			<div class="field-wrap">
				<!----------------------- start table-striped ----------------------->
				<form action="../songServlet.controller" method="post">			
				<table class='table table-striped'>
					<thead>
						<tr class='row'>
						<th align="center"></th>
						<th>歌名</th>
						<th>類型</th>
						<th>歌手</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${listBean.rows }" var="ktvBean">
						<tr class='row' data-id='${ktvBean.Cashbox_Id }'>
							<td align="center">
								<a class="btn btn-success up"><em class="glyphicon glyphicon-arrow-up" title='向上'></em></a>
								<a class="btn btn-danger delete"><em class="glyphicon glyphicon-trash" title='刪除'></em></a>
								<a class="btn btn-warning down"><em class="glyphicon glyphicon-arrow-down" title='向下'></em></a>
							</td>
							<td>${ktvBean.Song_SongName }</td>
							<td>${ktvBean.Song_Lang }</td>
							<td>${ktvBean.Song_Singer }</td>
							<td style="display:none"><input type="text" name="ktvId" value="${ktvBean.Cashbox_Id }"></td>
						</tr>
						</c:forEach>
					</tbody>
					
				</table><!----------------------- end table-striped ----------------------->
				<div class="field-wrap">
					<button type="submit" class="send" ><em class="glyphicon glyphicon-floppy-saved"></em>存&nbsp;檔</button>
					<button type="button" class="goBack" onclick="javascript:location.href='../processRequest.jsp'">回到查詢頁面</button>
				</div>
				</form>
			</div><!----------------------- end field-wrap ----------------------->
		 
		</div><!----------------------- end songTable ----------------------->
		<br/>
		<button type="button" class="button button-block" align="center" onclick="javascript:location.href='../index.jsp'">回首頁</button>
				
	</div><!----------------------- end form ----------------------->

<!----------------------- start modal-warning ----------------------->
<div id="modal-warning" class="modal modal-message modal-warning fade" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <span class="glyphicon glyphicon-remove-sign" style="color:#d9534f"></span>
            </div>
            <div class="modal-body"><h4>確定要刪除嗎?</h4></div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                <button type="button" id="beCanceled" class="btn btn-warning" >確定</button>
            </div>
        </div>
    </div>
</div><!----------------------- end modal-warning ----------------------->

<script src="../js/jquery-3.1.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/menberRegister02.js"></script>

</body>
</html>
