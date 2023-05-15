<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] var1 = {"Brad","Eric","Andy","Tony"};
	//pageContext.setAttribute("names", var1);
	
	String[] var2 = {"Brad2","Eric2","Andy2","Tony2"};
	//request.setAttribute("names", var2);
	
	String[] var3 = {"Brad3","Eric3","Andy3","Tony3"};
	//session.setAttribute("names", var3);
	
	String[] var4 = {"Brad4","Eric4","Andy4","Tony4"};
	application.setAttribute("names", var4);
	
	int a = 10;
	session.setAttribute("a", a);

	int b = 10;
	application.setAttribute("b", b);
	
	LinkedList<String> list = new LinkedList<>();
	list.add("aa");list.add("bb");list.add("cc");
	pageContext.setAttribute("list", list);
	
	HashMap<String,String> map = new HashMap<>();
	map.put("k1", "111");
	map.put("k2", "222");
	map.put("k3", "333");
	pageContext.setAttribute("map", map);

%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
	Page Name1: ${pageScope.names[2] }<br />
	Request Name2: ${requestScope.names[2] }<br />
	Session Name3: ${sessionScope.names[2] }<br />
	Application Name4: ${applicationScope.names[2] }<br />
	Name : ${names[2] }
	<hr />
	list => ${list[param.i] }<br />
	<hr />
	map => ${map["k1"] }<br />
	map => ${map.k2 }<hr />
	${param.x + param.y }<br />
	${param.x == 10 }
	</body>
</html>