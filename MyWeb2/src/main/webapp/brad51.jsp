<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		<c:set var="x" value="123"/>	
		<c:set var="x" value="124" scope="request" />
		PageScope x = ${x }<br />
		Request x = ${requestScope.x }<br />
		<hr />
		<c:out value="Hello, World" /><br />
		<c:out value="${x }" /><br />
		<c:out value="${param.i }" default="no param.i" />
		<hr />
		
		<jsp:useBean id="member" class="tw.brad.classes.Member"></jsp:useBean>
		<c:set target="${member }" property="id">10</c:set>
		<c:set target="${member }" property="account">brad</c:set>
		<c:set target="${member }" property="email">brad@brad.tw</c:set>
		${member.id }|${member.account }|${member.email }<br />
		${member }<br />
		<c:remove var="member"/>
		<hr />
		${member }<br />
		
		
		
	</body>
</html>