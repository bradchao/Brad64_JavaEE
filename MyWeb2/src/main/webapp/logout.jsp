<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session.setAttribute("member", null);
	session.invalidate();
	response.sendRedirect("login.jsp");
%>