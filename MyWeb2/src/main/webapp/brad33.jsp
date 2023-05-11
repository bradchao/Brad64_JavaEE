<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="brad34.jsp" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Brad Big Company</title>
	</head>
	<body>
		<h1>The BEST 9 x 9 Table</h1>
		<form>
			<input type="number" name="start"> :
			<input type="number" name="rows"> x
			<input type="number" name="cols"> 
			<input type="submit" value="Show" /> 
		</form>
		<hr />
		<table border="1" width="100%">
		<%
			final int ROWS = 3;
			final int START = 1;
			final int COLS = 3;
			
			for (int k=0; k<ROWS; k++){
				out.print("<tr>");
				for (int j=START; j<(START+COLS); j++){
					int newj = j + k * COLS;
					out.print("<td>");
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