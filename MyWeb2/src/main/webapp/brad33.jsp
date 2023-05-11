<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="brad34.jsp" %>    
<%
	String start = request.getParameter("start");
	String rows = request.getParameter("rows");
	String cols = request.getParameter("cols");

	final int ROWS = rows == null ? 2 : Integer.parseInt(rows);
	final int START = start == null ? 2 : Integer.parseInt(start);
	final int COLS = cols == null ? 2 : Integer.parseInt(cols);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		<h1>The BEST 9 x 9 Table</h1>
		<form onsubmit="return checkData();">
			<input type="number" id="start" name="start" value="<%= START %>"> :
			<input type="number" id="rows" name="rows" value="<%= ROWS %>"> x
			<input type="number" id="cols" name="cols" value="<%= COLS %>"> 
			<input type="submit" value="Show" /> 
		</form>
		<hr />
		<table border="1" width="100%">
		<%
			for (int k=0; k<ROWS; k++){
				out.print("<tr>");
				for (int j=START; j<(START+COLS); j++){
					int newj = j + k * COLS;
					
					if (k % 2 == 0){
						if (j % 2 == 0){
							out.print("<td bgcolor='pink'>");
						}else{
							out.print("<td bgcolor='yellow'>");
						}
					}else{
						if (j % 2 != 0){
							out.print("<td bgcolor='pink'>");
						}else{
							out.print("<td bgcolor='yellow'>");
						}
					}
					
					for (int i=1; i<=9; i++){
						int r = newj * i;
						out.print(String.format("%d x %d = %d<br />", newj, i, r));
					}
					out.print("</td>");
				}
				out.print("</tr>");
			}
		%>
		</table>
	</body>
</html>
<script type="text/javascript">
	function checkData(){
		let start = document.getElementById('start').value;
		let rows = document.getElementById('rows').value;
		let cols = document.getElementById('cols').value;
		
		if (start > 0 && rows > 0 && cols > 0){
			return true
		}else{
			alert("xxxxxx");
			return false;
		}
	}
</script>
