<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오전 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <meta charset="utf-8">
  <title>주문 </title>

</head>
<%@ include file="dbconn.jsp"%>
<%
  request.setCharacterEncoding("utf-8");
  String num = (String)request.getParameter("checkcart");
  System.out.println(num);
  String status = (String)request.getParameter("status");
  System.out.println(status);
  String url = "jdbc:mariadb://127.0.0.1:3306/webdev";
  String user = "webmaster";
  String pwd = "1234";
  Connection con = null;
  Statement stmt = null;
//  ResultSet rs = null;
//
//  try{
//
//    Class.forName("org.mariadb.jdbc.Driver");
//    con = DriverManager.getConnection(url, user, pwd);
//    String query = "update order_list set o_result = '" + status + "' where o_num = " + num;
//
//    System.out.println("[배송상태 수정 쿼리 ] : " + query);
//    stmt = con.createStatement();
//    stmt.executeUpdate(query);
//
//
//    /* 		response.sendRedirect("displayProducts1.jsp?p_num=" + p_num); */
//    stmt.close();
//    con.close();
//    response.sendRedirect("showOrders.jsp?o_num=" + num);
//  }catch(Exception e){
//    e.printStackTrace();
//    stmt.close();
//    con.close();
//  }
%>
<!--
<script>document.location.href='showOrders.jsp';</script> -->


</body>
<script>
  alert("되는지 확인")
</script>
</html>