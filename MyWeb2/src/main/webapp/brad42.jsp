<%@page import="tw.brad.classes.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member1 = new Member();
	member1.setId(1);
	member1.setAccount("brad");
	member1.setEmail("brad@brad.tw");
%>
<jsp:useBean id="member2" class="tw.brad.classes.Member"></jsp:useBean>
<jsp:setProperty property="id" value="2" name="member2"/>
<jsp:setProperty property="account" value="mark" name="member2"/>
<jsp:setProperty property="email" value="mark@abc.com" name="member2"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		Member1: <br />
		<%= member1.getId() %> : <%= member1.getAccount() %> : 
		<%= member1.getEmail() %><hr />
		
		Member2: <br />
		<jsp:getProperty property="id" name="member2"/> :
		<jsp:getProperty property="account" name="member2"/> :
		<jsp:getProperty property="email" name="member2"/> <hr />
		
		Member2: <br />
		<%= member2.getId() %> : <%= member2.getAccount() %> : 
		<%= member2.getEmail() %><hr />
	
	
	</body>
</html>