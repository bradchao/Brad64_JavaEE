package tw.brad.ok;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Brad11")
@MultipartConfig(
		location = "C:\\Users\\USER\\eclipse-workspace\\MyWeb2\\src\\main\\webapp\\upload"
		)
public class Brad11 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			System.out.println(part.getName());
			System.out.println(part.getSubmittedFileName());
			System.out.println(part.getContentType());
			System.out.println(part.getSize());
			System.out.println("----");
			if (part.getName().equals("upload") && part.getSize() > 0) {
				part.write(part.getSubmittedFileName());
			}
		}
		
	
	}

}
