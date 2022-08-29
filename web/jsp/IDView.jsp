<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾아줌</title>
<link rel="stylesheet" href="../resources/css/IDView.css" />
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	$(document).ready(function(){
		$("#btn_IDSearch").on("click", function(){
			location.href="./login.jsp"	
		})
	})
</script>
</head>

<body>
<jsp:include page="header.jsp" />


<div >
	<p style="height: 150px">ID </p>
</div>

<%
	request.setCharacterEncoding("UTF-8");
	String u_name = request.getParameter("u_name");
	String u_phone = request.getParameter("u_phone");
	System.out.println("이름 = " + u_name);
	System.out.println("번호 = " + u_phone);

	String u_id = "";
	
	String query = "select u_id from user where u_name = '" + u_name + "' and u_phone = '" + u_phone + "'";

	try{	
	
		Statement stmt = null; 

	  	stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()) u_id = rs.getString("u_id");
		
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		
		System.out.println("[아이디 찾기 쿼리] : " + query);
		
		if(u_id.equals("") || u_id == null) response.sendRedirect("searchID.jsp?check=fail");

	}catch(Exception e){
		
		e.printStackTrace();
	}
 
%>

<section class="home_body_div" align=center>
	<form id="IDSearchForm"class="IDSearchForm" id="IDSearchForm" method="post">
     	<br><br>
     	<h1><strong>아이디 : <%=u_id %></strong></h1>
 		<br><input type="button" id="btn_IDSearch" class="btn_IDSearch" value="로그인 창으로 이동"> <br><br>    	
    </form> 
</section>
<jsp:include page="footer.jsp" />
</body>
</html>