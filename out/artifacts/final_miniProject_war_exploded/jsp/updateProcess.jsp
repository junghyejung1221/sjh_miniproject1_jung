<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-29
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>

<%@ include file="dbconn.jsp"%>
<%

  request.setCharacterEncoding("utf-8");

  Statement stmt1 = null;

  String query = null;
  ResultSet rs1 = null;

  String num[] = request.getParameterValues("c_num");
  String quans[] = request.getParameterValues("c_quan[]");



  for(int i=0;i < num.length ; i++) {
    System.out.println(num[i]);
    System.out.println(quans[i]);

    query = "update cart set c_quan = '"+  quans[i]  +"' where c_num = '" + num[i]  +"' ";
    stmt1 = conn.createStatement();
    stmt1.executeQuery(query);
  }

  response.sendRedirect("userCart.jsp");

%>
