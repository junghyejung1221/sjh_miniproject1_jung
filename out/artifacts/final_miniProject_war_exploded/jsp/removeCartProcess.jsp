<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-23
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Locale"%>
<%@ page import="static java.lang.Integer.*" %>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>카트 등록</title>
</head>
<body>

<fmt:setLocale value="en" scope="page"/>
<%@ include file="dbconn.jsp"%>
<%
  request.setCharacterEncoding("utf-8");


  ArrayList<String> list ;
  String[] checkNum= request.getParameterValues("check_cnum");



//session.getAttribute("checkList") == null 이든 아니든 상관없이
  list = new ArrayList<String>();
  for(String num: checkNum){

    list.add(num);
  }

  System.out.println("prdlist:" + list);

  Statement stmt = conn.createStatement();


  for(int i=0;i<list.size(); i++) {
    System.out.println(list.get(i) + "<br>");
    String query = "DELETE FROM cart  where c_num = " + list.get(i);

    System.out.println("[삭제 완료 확인 쿼리 ] : " + query);

    stmt = conn.createStatement();
    stmt.executeQuery(query);


  }

%>

<%--<%--%>

<%--  request.setCharacterEncoding("utf-8");--%>

<%--  //cart db삭제--%>
<%--  String[] num = request.getParameterValues("btn_dcart");--%>
<%--  System.out.println("삭제할 물품 숫자 ::::  " +num);--%>

<%--  Statement stmt = conn.createStatement();--%>
<%--  String query = "DELETE FROM cart WHERE c_num = '" + num + "'";--%>

<%--  rs = stmt.executeQuery(query);--%>


<%--%>--%>

<script>

  alert("삭제 완료");
  document.location.href='userCart.jsp';

</script>

</body>
</html>

