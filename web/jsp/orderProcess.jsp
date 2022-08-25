<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-25
  Time: 오후 7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.*"%>
<html>
<head>
  <meta charset="utf-8">
  <title>주문 등록</title>
</head>
<body>

<fmt:setLocale value="en" scope="page"/>
<%@ include file="dbconn.jsp"%>
<%--유저ID도 장바구니 집어넣기--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
  String user_id = (String) session.getAttribute("userid");
  System.out.println(user_id);
  if (user_id == null) {
    System.out.println("아이디 없음 로그인 해주세요!!"); %>
<script>
  alert("유저 아이디가 없습니다. 로그인해주세요");
  document.location.href='login.jsp';

</script>

<%
}
else if (user_id != null){



  //primary key 생성위해 order count해주는 db설정
  request.setCharacterEncoding("utf-8");
  Statement stmt0 = conn.createStatement();
  String query0 = "SELECT * FROM ordercount WHERE id = 'a'";
  rs = stmt0.executeQuery(query0);

  int count =0;
  while(rs.next()) {
    count = rs.getInt("num");
    System.out.println(count);
  }

  count = Integer.valueOf(count) + 1;
  System.out.println("order 아이디 변환후"+count);

//  //orderlist db에 넣기
//  String num = (String)request.getParameter("btn_addCart");
//  System.out.println(num);
//
//  Statement stmt = conn.createStatement();
//  String query = "INSERT INTO cart(c_num,u_id,p_num,c_quan) VALUES ( "+ count +",'" + user_id + "'," + num + ",'1234')";
//
//  rs = stmt.executeQuery(query);


  //pnum 찾기
  String queryp_num = "select c.c_num, p.p_num,p.p_name,p.p_price,c.c_quan,c.c_order from product As p, cart AS c where c.c_order='1' AND c.p_num=p.p_num AND c.u_id = '" +user_id +"' ;";
  System.out.println("[상세 보기 쿼리] : " + queryp_num);


  Statement stmtp_num = null;

  stmtp_num = conn.createStatement();
  rs = stmtp_num.executeQuery(queryp_num);

  int pnum ;
  ResultSet rs2 = null;
  while(rs.next()){
    pnum = rs.getInt("p.p_num");

    //order product 넣기
    Statement stmt2 = conn.createStatement();
    String query2 = "INSERT INTO order_product(o_num, u_id ,p_num) VALUES (  '" + count+"', '" + user_id +"', '"+ pnum +"' );";


    System.out.println("[상세 보기 쿼리] : " + query2);

    rs2 = stmt2.executeQuery(query2);
  }

//order list 넣기
  Statement stmto_list = conn.createStatement();
  String queryo_list = "INSERT INTO order_list(o_num, u_id ) VALUES (  '" + count+"', '" + user_id +"' );";


  System.out.println("[상세 보기 쿼리] : " + queryo_list);

  rs = stmto_list.executeQuery(queryo_list);




  //cart 지우기
  Statement stmt = conn.createStatement();
  String query = "DELETE from cart where c_order='1' AND u_id = '" +user_id +"' ;";
  System.out.println("[상세 보기 쿼리] : " + query);

  rs = stmt.executeQuery(query);

  //ordercount update
  Statement stmt_d = conn.createStatement();
  String query_d = " UPDATE ordercount SET num = " + count+ " WHERE id = 'a'";
  rs = stmt_d.executeQuery(query_d);




%>

<script>
  alert("주문 완료");
  document.location.href='Main.jsp';

</script>

<%
  }
%>
</body>
</html>

