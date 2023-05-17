<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.brad.classes.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    
<!DOCTYPE html>
<html>
	<c:if test="${!empty param.account }">
		<c:if test="${pageContext.request.method == 'GET' }">
			<c:redirect url="brad60.jsp"></c:redirect>
		</c:if>

		<sql:setDataSource
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost/iii"
			user="root"
			password="root"
			/>	
			
		<sql:update>
			INSERT INTO member (account,passwd,email) VALUES (?,?,?)
			<sql:param>${param.account }</sql:param>
			<sql:param>${BCrypt.hashpw(param.passwd, BCrypt.gensalt()) }</sql:param>
			<sql:param>${param.email }</sql:param>
		</sql:update>
		<c:redirect url="brad60.jsp"></c:redirect>
	</c:if>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>		
		<script type="text/javascript">
			function checkAccount(){
				$('#mesg').load('brad72.jsp?account=' + $('#account').val());
			}
		</script>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
	<h1>New Member</h1>
	<hr />
	<form method="post">
		<table border="1">
			<tr>
				<th>Account</th>
				<td><input name="account" id="account" onblur="checkAccount()" />
				<span id='mesg'></span></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd" /></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input name="email" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Add" /></td>
			</tr>
		</table>
	</form>
	
	</body>
</html>