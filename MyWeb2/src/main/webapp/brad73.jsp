<%@page import="java.net.http.HttpResponse"%>
<%@page import="tw.brad.classes.BCrypt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String account = request.getParameter("account");
	String passwd = request.getParameter("passwd");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/iii","root","root");
	String sql = "INSERT INTO member (account,passwd,email) " +
		"VALUES (?,?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, account);
	pstmt.setString(2, BCrypt.hashpw(passwd, BCrypt.gensalt()));
	pstmt.setString(3, email);
	
	int n = pstmt.executeUpdate();
	if (n>0){
		response.sendError(HttpServletResponse.SC_OK);
	}else{
		response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	}
%>