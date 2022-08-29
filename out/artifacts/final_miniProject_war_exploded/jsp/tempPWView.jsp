<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>임시 패스워드 발급</title>
<link rel="stylesheet" href="../resources/css/tempPWView.css" />
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	$(document).ready(function(){
		$("#btn_pwSearch").on("click", function(){
			location.href="./login.jsp"	
		})
	})
</script>
</head>

<body>
<jsp:include page="header.jsp" />

<div >
	<p style="height: 150px">비밀번호 </p>
</div>
<%
	request.setCharacterEncoding("UTF-8");
	String u_id = request.getParameter("u_id");
	String u_name = request.getParameter("u_name");
	System.out.println("아이디 = " + u_id);
	System.out.println("이름 = " + u_name);


	
	StringBuffer tempPW = new StringBuffer();
	
	try{
	
		
	
		String query1 = "select count(*) id_check from user where u_name = '" + u_name + "' and u_id = '" + u_id + "'";
		
		Statement stmt = null; 

		stmt = conn.createStatement();
		rs = stmt.executeQuery(query1);

		int id_check = 0;
		while(rs.next()) id_check = rs.getInt("id_check");
		
		stmt.close();
		rs.close();
		
		System.out.println("[패스워드 찾기 쿼리] : " + query1);
		
		if(id_check==0) response.sendRedirect("searchPassword.jsp?check=fail");
		
		//숫자 + 영문대소문자 7자리 임시패스워드 생성
		
		Random rnd = new Random();
		for (int i = 0; i < 7; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z : 아스키코드 97~122
		    	tempPW.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z : 아스키코드 65~122
		    	tempPW.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		    	tempPW.append((rnd.nextInt(10)));
		        break;
		    }
		}
	
		String query2 = "update user set password = '" + String.valueOf(tempPW) + "' where u_id = '" + u_id + "'";
		
		System.out.println("[임시 패스워드 생성 쿼리] : " + query2);
		
		stmt = conn.createStatement();
		stmt.executeUpdate(query2);
		
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		
		e.printStackTrace();
	}

%>

<section class="home_body_div" align=center>
	<form id="pwSearchForm">
     	<br><br><h1><strong>임시 패스워드 : <%= String.valueOf(tempPW) %></strong></h1>
      	 <br><input type="button" id="btn_pwSearch" class="btn_pwSearch" value="로그인 창으로 이동"> <br><br>    	
    </form> 
</section>
<jsp:include page="footer.jsp" />
</body>
</html>