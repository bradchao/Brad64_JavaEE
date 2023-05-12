<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="tw.brad.classes.Member"></jsp:useBean>
<jsp:setProperty property="account" value="${param.account }" name="member"/>
<jsp:setProperty property="email" value="${param.email }" name="member"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		HelloV2, ${member.account }
		<hr />
		${member.email }	
		<hr />
		${member }
	</body>
</html>