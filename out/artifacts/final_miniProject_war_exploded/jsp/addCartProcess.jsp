<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-23
  Time: 오후 12:19
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
    //primary key 생성위해 cart를 count해주는 db설정
    request.setCharacterEncoding("utf-8");
    Statement stmt0 = conn.createStatement();
    String query0 = "SELECT * FROM cartcount WHERE id = 'a'";
    rs = stmt0.executeQuery(query0);

    int count =0;
    while(rs.next()) {
        count = rs.getInt("num");
        System.out.println(count);
    }

    count = Integer.valueOf(count) + 1;
    System.out.println("cart 아이디 변환후"+count);

    //cart db에 넣기
    String num = (String)request.getParameter("btn_addCart");
    System.out.println(num);

    Statement stmt = conn.createStatement();
    String query = "INSERT INTO cart(c_num,u_id,p_num,c_quan) VALUES ( "+ count +",'abc1111'," + num + ",'1234')";

    rs = stmt.executeQuery(query);


    //cartcount update
    Statement stmt2 = conn.createStatement();
    String query2 = " UPDATE cartcount SET num = " + count+ " WHERE id = 'a'";
    rs = stmt2.executeQuery(query2);




%>

<script>

    alert("장바구니 등록 완료");
    document.location.href='cart.jsp';

</script>

</body>
</html>

