<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${clientBean == null}" >
	<c:redirect url="/MessagePage/notClient.html"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../jquery-ui-1.12.1.custom/jquery-ui.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">

<script src="../js/jquery-3.1.1.js"></script>
<script src="../jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="../js/zh-TW.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/booking.js"></script>
<style>
.modal-header, h4 {
	background-color: #0059b3;
	text-align: center;
	font-size: 30px;
	color:#fff;
}

</style>

<title>BookIn</title>
</head>

<body>
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="myModal3" role="dialog" data-backdrop="static" data-toggle="modal">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header" style="padding: 80px 50px;">
						<!-- <button type="button" class="close" data-dismiss="modal">×</button> -->
							<h4 class="modal-title">線上訂位</h4>
					</div>

					<div class="modal-body">
						<form role="form" class="form-horizontal" method="post" action="../ClientBookingServlet.controller" onsubmit="return checkBookIn()">
							<div class="form-group">
								<div class="row">
									<label class="control-label col-md-3" for="calendar">預約日期：</label>
									<div class="col-md-6">
										<input type="text" class="form-control" readonly
											id="calendar" name="calendar" data-toggle="tooltip"
											data-placement="top" title="必選欄位"><span
											class="help-block" id="meg01"></span>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="control-label col-md-3" for="roombox">預約分店：</label>
									<div class="col-md-6">
										<select class="form-control" name="roombox" id="roombox"
											data-toggle="tooltip" data-placement="top" title="必選欄位"
											disabled>
											<option disabled selected>--請選分店--</option>
											<option>旗艦店</option>
											<option>逢甲店</option>
											<option>梧棲店</option>
										</select><span class="help-block" id="meg05"></span>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="control-label col-md-3" for="time">預約時間：</label>
									<div class="col-md-6">
										<select class="form-control" name="time" id="time"
											data-toggle="tooltip" data-placement="top" title="必選欄位"
											disabled>
											<option disabled selected>--請選擇時--</option>
										</select><span class="help-block" id="meg02"></span>
									</div>
									<div class="col-md-3" id="sp"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="control-label col-md-3" for="num">預約人數：</label>
									<div class="col-md-6">
										<input type="number" class="form-control" name="num" id="num"
											value="1" min="1" max="100" data-toggle="tooltip"
											data-placement="top" title="必選欄位"><span
											class="help-block" id="meg03"></span>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<label class="control-label col-md-3" for="csCheck">同意 <input
										type="checkbox" class="w3-check" id="ckbox" name="ckbox"
										disabled></label>
									<div class="col-md-6">
										<button type="button" id="csCheck" name="csCheck"
											class="btn btn-primary btn-block" data-toggle="collapse"
											data-target="#demo">
											<span class="glyphicon glyphicon-collapse-down"></span>訂位須知
										</button>
										<span class="help-block" id="meg04"></span>
										<div id="demo" class="collapse">
											<ul class="list-group">
												<li class="list-group-item list-group-item-success">訂位資訊：當天可以訂位30天的位子，每天增加一天。</li>
												<li class="list-group-item list-group-item-info">訂位資訊：當天可以訂位30天的位子，每天增加一天。</li>
												<li class="list-group-item list-group-item-warning">訂位資訊：當天可以訂位30天的位子，每天增加一天。</li>
												<li class="list-group-item list-group-item-danger">訂位資訊：當天可以訂位30天的位子，每天增加一天。</li>
											</ul>
										</div>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="btn-group btn-group-justified">
											<div class="btn-group">
												<button type="submit" id="save"
													class="btn btn-primary btn-block">
													<i class="material-icons">music_note</i>確認送出
												</button>
											</div>
											<div class="btn-group">
												<button type="reset" id="rst" value="Reset"
													class="btn btn-primary btn-block">
													<i class="material-icons">music_note</i>清除資料
												</button>
											</div>
										</div>
									</div>
									<div class="col-md-3"></div>
								</div>
							</div>
							</from>
					</div>
					<div class="modal-footer">
						<button class="btn btn-danger btn-default pull-left" onclick="javascript:location.href='../index.jsp'">
							<span class="glyphicon glyphicon-remove"></span> 取消
						</button>
					</div>

				</div>

			</div>
		</div>

	</div>

</body>

</html>
