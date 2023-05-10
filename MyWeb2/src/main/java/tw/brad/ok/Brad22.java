package tw.brad.ok;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Brad22")
public class Brad22 extends HttpServlet {
	private Connection conn;
	
    public Brad22() {
    	Properties prop = new Properties();
    	prop.put("user", "root");
    	prop.put("password", "root");
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn = DriverManager.getConnection(
    			"jdbc:mysql://localhost/iii", prop);
    		System.out.println("OK");
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM food");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print("<table width='100%' border='1'>");
			while (rs.next()) {
				out.print("<tr>");
				out.printf("<td>%s</td>", rs.getString("id"));
				out.printf("<td>%s</td>", rs.getString("name"));
				out.printf("<td>%s</td>", rs.getString("tel"));
				out.printf("<td><img src='%s' width='128px' height='96px' /></td>", rs.getString("picurl"));
				out.print("</tr>");
			}
			out.print("</table>");
			
		}catch(SQLException se) {
			System.out.println(se);
		}
	
	
	
	}

}
