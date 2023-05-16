<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<c:if test="${!empty param.delid }">
		<sql:update>
			DELETE FROM member WHERE id = ?
			<sql:param>${param.delid }</sql:param>
		</sql:update>
	</c:if>
	
	<sql:query var="rs">
		SELECT * FROM member
	</sql:query>			
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		<a href="brad61.jsp">New</a>
		<hr />
	<table border="1" width="100%">
		<tr>
			<th>#</th>
			<th>Account</th>
			<th>Email</th>
			<th>Delete</th>
			<th>Edit</th>
		</tr>
		<script>
			function delAlert(account){
				let isDel = confirm("是否刪除 *" + account + "* 嗎?");
				//if (isDel){
					// AJAX
					// callback => refresh table
				//}
				return isDel;
			}
		</script>
		<c:forEach items="${rs.rows }" var="row">
			<tr>
				<td>${row.id }</td>
				<td>${row.account }</td>
				<td>${row.email }</td>
				<td><a href="?delid=${row.id }" 
					onclick="return delAlert('${row.account }');">Del</a></td>
				<td><a href="brad62.jsp?editid=${row.id }">Edit</a></td>
			</tr>
		</c:forEach>
	</table>		
	</body>
</html>