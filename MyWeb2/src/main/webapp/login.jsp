<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>

	<form method="post" action="check.jsp">
		<table border="1">
			<tr>
				<th>Account</th>
				<td><input name="account" /></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Login" />
				</td>
			</tr>
		</table>
	</form>

	
	</body>
</html>