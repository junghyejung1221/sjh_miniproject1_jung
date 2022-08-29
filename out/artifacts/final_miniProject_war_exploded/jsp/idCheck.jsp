<%@page import="java.sql.*"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconn.jsp"%>

<%
	/* Connection con = null;
	Statement stmt = null;
	ResultSet rs = null; */

	String u_id = request.getParameter("u_id");
	String query = "select count(*) as id_count from user where u_id = '" + u_id +"'";
	System.out.println("ID조회 = " + query);
/* 
    String url = "jdbc:mysql://10.10.14.30:3306/webdev";
    String uid = "shopManager";
    String pwd = "1234"; */

     int id_count = 0;
	
    /*Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, pwd);	*/
		
		Statement stmt = null; 

		  stmt = conn.createStatement();
		  rs = stmt.executeQuery(query);

		while(rs.next()) id_count = rs.getInt("id_count"); 
		
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	
		
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("id_count", id_count);
		
		System.out.println("[아이디 중복 확인 JSON] : " + jsonObject);
		response.getWriter().print(jsonObject);
%>
    
    
