<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		output :
		{
			page : n,
			error : 0,
			data : [
			        {
			        	name: xxx,
			        	tel: 123
			        },
			        {
			        	name: xxx,
			        	tel: 123
			        },
			        {
			        	name: xxx,
			        	tel: 123
			        }
			        ]
		}
		
	*/
	String pp = request.getParameter("page");
	if (pp == null){
		return;
	}
	int p = Integer.parseInt(pp);
	

	JSONObject obj = new JSONObject();
	if (p <= 0){
		obj.put("page", p);
		obj.put("error", 1);
		out.print(obj.toString());
		return;
	}
	if (p > 10){
		obj.put("page", p);
		obj.put("error", 2);
		out.print(obj.toString());
		return;
	}
	
	obj.put("page", p);
	obj.put("error", 0);
	
	JSONArray ary = new JSONArray();
	for (int i=0; i<10; i++){
		JSONObject row = new JSONObject();
		row.put("name", "Brad:" + (int)(Math.random()*100));
		row.put("tel", "Tel:" + (int)(Math.random()*100));
		ary.put(row);
	}
	obj.put("data", ary);
	
	out.print(obj.toString());
%>