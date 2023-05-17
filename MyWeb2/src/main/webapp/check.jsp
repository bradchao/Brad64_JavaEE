<%@page import="tw.brad.classes.Member"%>
<%@page import="tw.brad.classes.BCrypt"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String account = request.getParameter("account");
	String passwd = request.getParameter("passwd");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/iii", "root", "root");

	String sql = "SELECT * FROM member WHERE account = ?"; 
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, account);

	ResultSet rs = pstmt.executeQuery();
	if (rs.next()){
		String hashed = rs.getString("passwd");
		if (BCrypt.checkpw(passwd, hashed)){
			// ok
			Member member = new Member();
			member.setAccount(rs.getString("account"));
			member.setEmail(rs.getString("email"));
			session.setAttribute("member", member);
			session.setMaxInactiveInterval(180);
			response.sendRedirect("brad60.jsp");
		}else{
			// xxxx
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
	}else{
		// xxx
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	
	
%>