<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("utf-8");


  String name = (String)request.getParameter("name");
  String zipCode = request.getParameter("zipCode");
  String addressName = request.getParameter("addressName");
  String phone = request.getParameter("phone");

  session.setMaxInactiveInterval(3600*7); //세션 유지 기간 설정
  session.setAttribute("name", name); //세션 생성
  session.setAttribute("zipCode", zipCode); //세션 생성
  session.setAttribute("addressName", addressName); //세션 생성
  session.setAttribute("phone", phone); //세션 생성
  response.sendRedirect("orderConfirmation.jsp");
%>

