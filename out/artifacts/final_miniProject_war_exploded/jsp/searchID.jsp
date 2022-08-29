<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../resources/css/searchID.css" />
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function IDSearchCheck(){

	if($("#u_name").val() == '') { alert("이름을 입력하세요."); $("#u_name").focus();  return false; }
	if($("#u_phone").val() == '') { alert("전화번호를 입력하세요."); $("#u_phone").focus(); return false; }
	$("#IDSearchForm").attr("action", "IDView.jsp").submit();
}

function press() {
	if(event.keyCode == 13){ pwSearchCheck(); }
}

</script>
</head>

<%
	String check = request.getParameter("check")==null?"true":request.getParameter("check");
%>

<body>

<jsp:include page="header.jsp" />
<div >
	<p style="height: 150px">ID찾기</p>
</div>


<section class="home_body_div" align=center>
	<form name="IDSearchForm" class="IDSearchForm" id="IDSearchForm" method="post">
      <h1><strong>아이디 찾기</strong></h1>
     	<div class="IDSearchFormDivision">
         	<div class="nameForm"><input type="text" name="u_name" id="u_name" class="u_name" placeholder="이름을 입력하세요."></div>
         	<div class="telnoForm"><input type="text" id="u_phone" name="u_phone" class="u_phone" onkeydown="press(this.form)" placeholder="전화번호를 입력하세요."></div>
         	<% if(check.equals("fail")){ %>
          		<p style="text-align: center; color:red; font-size: 11px; ">입력한 조건에 맞는 사용자가 존재하지 않습니다. <br>다시 입력하세요!</p>
          	<%} %>	
          	<input type="button" id="btn_IDSearch" class="btn_IDSearch" value="아이디 찾기" onclick="IDSearchCheck()">   <br><br>
     	</div> 
	</form>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>