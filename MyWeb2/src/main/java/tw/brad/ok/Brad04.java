package tw.brad.ok;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Brad04")
public class Brad04 extends HttpServlet {
	public Brad04() {
		System.out.println("Brad04()");
	}
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		pw.append("doGet");
		
		System.out.println("doGet");
	}

}
