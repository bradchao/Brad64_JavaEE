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
	<c:if test="${!empty param.editid }">
		<sql:query var="rs">
			SELECT * FROM member WHERE id = ?
			<sql:param>${param.editid }</sql:param>
		</sql:query>
	</c:if>

	<c:if test="${!empty param.updateid }">
		<c:if test="${empty param.passwd }">
			<sql:update>
				UPDATE member SET account= ?, email=? WHERE id=?
				<sql:param>${param.account }</sql:param>
				<sql:param>${param.email }</sql:param>
				<sql:param>${param.updateid }</sql:param>
			</sql:update>
		</c:if>
		<c:if test="${!empty param.passwd }">
			<sql:update>
				UPDATE member SET account= ?, passwd=?, email=? WHERE id=?
				<sql:param>${param.account }</sql:param>
				<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
				<sql:param>${param.email }</sql:param>
				<sql:param>${param.updateid }</sql:param>
			</sql:update>
		</c:if>
		<c:redirect url="brad60.jsp"></c:redirect>
	</c:if>
			
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
	<h1>Edit Member</h1>
	<hr />
	<form method="post">
		<input type="hidden" name="updateid" value="${param.editid }" />
		<table border="1">
			<tr>
				<th>Account</th>
				<td><input name="account" value="${rs.rows[0].account }" /></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd" /></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input name="email" value="${rs.rows[0].email }" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</form>
	
	</body>
</html>