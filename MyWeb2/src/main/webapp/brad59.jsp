<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.brad.classes.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
	<sql:setDataSource
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/iii"
		user="root"
		password="root"
		/>
	<sql:query var="rs">
		SELECT * FROM gift
	</sql:query>
	
	<c:set var="rpp" value="10" />
	<c:set var="pages">
		${rs.rowCount % rpp == 0 ? rs.rowCount / rpp : (rs.rowCount - (rs.rowCount % rpp)) / rpp + 1 }
	</c:set>
	<c:set var="page">${param.page == null ? 1 : param.page }</c:set>
	<c:set var="prev">${BradUtils.prevPage(page) }</c:set>
	<c:set var="next">${BradUtils.nextPage(page, pages) }</c:set>
	<c:set var="start">${(page - 1) * rpp }</c:set>
	
	<sql:query var="rs">
		SELECT * FROM gift ORDER BY city LIMIT ${start }, ${rpp }
	</sql:query>
	
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
	<h1>地方特色伴手禮</h1>
	<hr />
	總筆數: ${rs.rowCount } <br />
	頁數: ${page } / ${pages } | 
	<a href="?page=${prev }">上一頁</a> | <a href="?page=${next }">下一頁</a>
	<hr />
	<table border="1" width="100%">
		<tr>
			<th>#</th>
			<th>Name</th>
			<th>Feature</th>
			<th>City</th>
			<th>Town</th>
			<th>Photo</th>
		</tr>

		<c:forEach items="${rs.rows }" var="gift">
			<tr>
				<td>${gift.id }</td>
				<td>${gift.name }</td>
				<td>${gift.feature }</td>
				<td>${gift.city }</td>
				<td>${gift.town }</td>
				<td><img src="${gift.pic }" width="80px" height="60px"></td>
			</tr>
		</c:forEach>
		
	</table>
	
	</body>
</html>