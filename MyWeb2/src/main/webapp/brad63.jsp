<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String key = request.getParameter("key");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/iii", "root", "root");
	
	String sql = "SELECT * FROM gift"; 
	PreparedStatement pstmt;
	if (key != null){
		sql += " WHERE name LIKE ? OR city LIKE ? " + 
				"OR town LIKE ? OR feature LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + key + "%");
		pstmt.setString(2, "%" + key + "%");
		pstmt.setString(3, "%" + key + "%");
		pstmt.setString(4, "%" + key + "%");
	}else{
		pstmt = conn.prepareStatement(sql);
	}
	
	ResultSet rs = pstmt.executeQuery();
	
	JSONArray root = new JSONArray();
	while (rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("id", rs.getInt("id"));
		obj.put("name", rs.getString("name"));
		obj.put("feature", rs.getString("feature"));
		obj.put("city", rs.getString("city"));
		obj.put("town", rs.getString("town"));
		root.put(obj);
	}
	out.print(root.toString().trim());
%>