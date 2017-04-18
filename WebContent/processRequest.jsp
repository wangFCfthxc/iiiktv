<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${clientBean == null}" >
	<c:redirect url="/MessagePage/notClient.html"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link rel="stylesheet" href="bootstrap-select.css">
<link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script>
function clickSong(a,b){
		$.ajax({
		type : 'post',
		url : 'songServlet.controller',
		data : {
			songId:a
		},
		datatype : 'json',
		success : function(response) {
			alert(b +"加入成功");
		},
		error : function(erro){
			alert("妳已經加入過囉");
		}
	}); 
}
</script>
<script src="js/autocomplete.js"></script>
<title>查詢歌曲</title>
</head>
<body>
	<div class="text-center page-header"><h1>KTV點歌</h1></div>
	<div class="ui-widget">
		<form action="<c:url value="/paginationServlet.controller"/>" method="post" class="form-inline">
			<select name="searchOptions" id="searchOptions" class="selectpicker" data-width="fit">
				<option value="songName">歌名</option>
				<option value="singerName">歌手</option>
			</select> 
			<div class="form-group">
				<input type="text" name="searchText" id="searchText" class="form-control"/>
			</div>
			<button type="submit" class="btn btn-primary">送&nbsp;&nbsp;出</button>
		</form>
	</div>
	<div align="right">
		<a href="index.jsp" role="button" class="btn btn-success">回&nbsp;網&nbsp;站</a>
		<a href="Login/clientSongList.jsp" role="button" class="btn btn-info" >我&nbsp;的&nbsp;歌&nbsp;庫</a>
	</div>
	<hr/>
	
	<table width="100%" class="table table-hover table-responsive">
		<thead>
		<tr>
			<th width="30%">歌&nbsp;&nbsp;&nbsp;&nbsp;名</th><th width="15%">類&nbsp;&nbsp;&nbsp;&nbsp;型</th><th width="30%">歌&nbsp;&nbsp;&nbsp;&nbsp;手</th><th width="20%">加到我的歌單</th>
		</tr>
		</thead>
		<c:forEach var="ktvlist" items="${first}" >
			<tr>
				<th scope="row">${ktvlist.songSongName }</th>
				<th>${ktvlist.songLang }</th>
				<th>${ktvlist.songSinger }</th>
				<th><a onclick="clickSong(${ktvlist.cashboxId},'${ktvlist.songSongName }')" style="cursor:pointer"><img src="img/plus01.png"></img></a></th><!-- do songId -->
			</tr> 
		</c:forEach>
	</table>
		<c:if test="${not empty first }">
				<div align="center">
					<ul class="pagination pagination-centered">
						<c:forEach begin="1" end="${(second/20)+1 }" var="num">
							<c:url value="/paginationServlet.controller" var="path" >
								<c:param name="pageSearch" value="${first[0].songSinger }" />
								<c:param name="paginationMark" value="${(num-1)*20+1 }"/>
							</c:url>
								<c:choose>
									<c:when test="${(currentPage-1)/20 != (num-1) }">
										<li class="page-item" ><a class="page-link" href="${path }">${num }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled" ><a class="page-link" >${num }</a></li>
									</c:otherwise>
								</c:choose>
						</c:forEach>
					</ul>
				</div>
		</c:if>

<script type="text/javascript" src="bootstrap-select.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>