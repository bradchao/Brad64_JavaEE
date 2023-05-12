<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String account = request.getParameter("account");
	String email = request.getParameter("email");
%>

<jsp:useBean id="member" class="tw.brad.classes.Member"></jsp:useBean>
<jsp:setProperty property="account" value="<%= account %>" name="member"/>
<jsp:setProperty property="email" value="<%= email %>" name="member"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		Hello, <jsp:getProperty property="account" name="member"/>
		<hr />
		<jsp:getProperty property="email" name="member"/>
		
			
	</body>
</html>