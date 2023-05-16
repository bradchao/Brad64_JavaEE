<%@page import="org.json.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:import url="https://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx" 
	var="data"></c:import>
<%
	String json = (String)pageContext.getAttribute("data");

	Properties prop = new Properties();
	prop.put("user", "root");
	prop.put("password", "root");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/iii", prop);
	
	Statement stmt = conn.createStatement();
	// 1. delete from food
	stmt.executeUpdate("DELETE FROM food");
	// 2. ALTER TABLE food AUTO_INCREMENT = 1
	stmt.executeUpdate("ALTER TABLE food AUTO_INCREMENT = 1");
	
	String sql = "INSERT INTO food (name,address,tel,picurl,lat,lng)" + 
			" VALUES (?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	JSONArray root = new JSONArray(json);
	for (int i=0; i<root.length(); i++) {
		JSONObject row = root.getJSONObject(i);
		
		pstmt.setString(1, row.getString("Name"));
		pstmt.setString(2, row.getString("Address"));
		pstmt.setString(3, row.getString("Tel"));
		pstmt.setString(4, row.getString("PicURL"));
		try {
			pstmt.setDouble(5, Double.parseDouble(row.getString("Latitude")));
		}catch(Exception e) {
			pstmt.setDouble(5, 0);
		}
		try {
			pstmt.setDouble(6, Double.parseDouble(row.getString("Longitude")));
		}catch(Exception e) {
			pstmt.setDouble(6, 0);
		}
		pstmt.executeUpdate();
	}

%>
