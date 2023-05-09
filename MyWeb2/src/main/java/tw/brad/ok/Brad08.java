package tw.brad.ok;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Brad08")
public class Brad08 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String op = request.getParameter("op");
		System.out.println(op);
		
		String result = "";
		try {
			int temp = Integer.parseInt(x) + Integer.parseInt(y);
			result += temp; 
		}catch(Exception e) {
			x = y = "";
		}
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append("<form>")
			.append(String.format("<input name='x' value='%s' />\n", x))
			.append("<select name='op'>")
			.append("<option value='1'>+</option>")
			.append("<option value='2'>-</option>")
			.append("<option value='3'>x</option>")
			.append("<option value='4'>/</option>")
			.append("</select>\n")
			.append(String.format("<input name='y' value='%s' />\n", y))
			.append("<input type='submit' value='=' />\n")
			.append(result)
			.append("</form>");
	
	}

}
