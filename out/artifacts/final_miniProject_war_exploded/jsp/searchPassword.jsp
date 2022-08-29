<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>패스워드 찾기</title>
<link rel="stylesheet" href="../resources/css/searchPassword.css" />
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function pwSearchCheck(){

	if($("#u_id").val() == "") { alert("아이디를 입력하세요."); $("#u_id").focus();  return false; }
	if($("#u_name").val() == '') { alert("이름을 입력하세요."); $("#u_name").focus(); return false; }
	$("#pwSearchForm").attr("action", "tempPWView.jsp").submit();
}

function press() {
	
	if(event.keyCode == 13){ pwSearchCheck(); }
	
}

</script>
</head>

<body>
<jsp:include page="header.jsp" />


<div >
	<p style="height: 150px">비밀번호 </p>
</div>

<%

	String check = request.getParameter("check")==null?"true":request.getParameter("check");

%>

<section class="home_body_div" align=center>

	<form name="pwSearchForm" class="pwSearchForm" id="pwSearchForm" method="post">
     	<h1><strong>임시 패스워드 발급</strong></h1>
     	<div class="pwSearchFormDivision">
         	<div class="idForm"><input type="text" name="u_id" id="u_id" class="u_id" placeholder="아이디를 입력하세요."></div>
         	<div class="nameForm"><input type="text" id="u_name" name="u_name" class="u_name" onkeydown="press(this.form)" placeholder="이름을 입력하세요."></div>
         	<% if(check.equals("fail")) { %>
         		<p style="text-align: center; color:red;">입력한 조건에 맞는 사용자가 존재하지 않습니다. 다시 입력하세요 !!!</p>
         	<% } %>
         	<p id="tempPW"></p>
         	<input type="button" id="btn_pwSearch" class="btn_pwSearch" value="임시 패스워드 발급" onclick="pwSearchCheck()"> <br><br>
     	</div> 
	</form>

</section>
<jsp:include page="footer.jsp" />

</body>
</html>