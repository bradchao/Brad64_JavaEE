<%
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	
	int lottery1 = (Integer)request.getAttribute("lottery1");
	int lottery2 = (Integer)request.getAttribute("lottery2");
	
	//String a = request.getParameter("x");
	//String b = request.getParameter("y");
	
%>
I am brad38<hr />
<%= x %> | <%= y %><br />
<%= lottery1 %> | <%= lottery2 %><br />
