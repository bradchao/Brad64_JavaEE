<%@page import="org.json.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:import url="https://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx" 
	var="data"></c:import>
<c:catch var="err">
<%
	String json = (String)pageContext.getAttribute("data");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Properties prop = new Properties();
	prop.put("user", "root");
	prop.put("password", "root");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/iii", prop);
	
	Statement stmt = conn.createStatement();
	// 1. delete from food
	stmt.executeUpdate("DELETE FROM gift");
	// 2. ALTER TABLE food AUTO_INCREMENT = 1
	stmt.executeUpdate("ALTER TABLE gift AUTO_INCREMENT = 1");
	
	String sql = "INSERT INTO gift (name,feature,pic,city,town)" + 
			" VALUES (?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	JSONArray root = new JSONArray(json);
	for (int i=0; i<root.length(); i++) {
		JSONObject row = root.getJSONObject(i);
		
		pstmt.setString(1, row.getString("Name"));
		pstmt.setString(2, row.getString("Feature"));
		pstmt.setString(3, row.getString("Column1"));
		pstmt.setString(4, row.getString("County"));
		pstmt.setString(5, row.getString("Township"));
		pstmt.executeUpdate();
	}
	out.print("Finish");
%>
</c:catch>
${err }