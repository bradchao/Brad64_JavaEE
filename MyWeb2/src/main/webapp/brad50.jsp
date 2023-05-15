<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	Integer a = (Integer)session.getAttribute("a");
	a++;
	session.setAttribute("a", a);
	*/
	
	Integer b = (Integer)application.getAttribute("b");
	b++;
	application.setAttribute("b", b);

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
	I am brad50<hr />
	Name3: ${sessionScope.names[2] }<br />
	Name4: ${applicationScope.names[2] }<br />
	<hr />
	b = ${applicationScope.b }<br />
	</body>
</html>