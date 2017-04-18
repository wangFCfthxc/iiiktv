<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/KtvSong" user="root"
password="root" var="booking" scope="page"/>
<%
	int times = 0;
	int max = 3 ;
%>
<sql:query var="check" sql="select bkDate,bkTime from clientBooking where bkDate = ?" dataSource="${booking }">
<sql:param value="${param.calendar }"/>
</sql:query>

<c:forEach items="${check.rows }" var="all">
	<c:if test="${param.time == all.bkTime}" >
		<%
			times++;
		if(times > max){
			%>   <h1>已超出名額無法定位</h1>   <% 
		}%>
	</c:if>
</c:forEach>
				還剩下<%= max-times %>位置