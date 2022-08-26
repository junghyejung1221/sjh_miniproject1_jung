<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 6:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
    String user_id = (String) session.getAttribute("userid");
    System.out.println("장바구니 창 아이디: "+user_id);
%>
<html>
<head>
  <title>장바구니</title>
</head>
<body>
<%
    String cartId = session.getId();
%>
<jsp:include page="header.jsp" />
<%@ include file="dbconn.jsp"%>
<%
  int p_num =0;

  request.setCharacterEncoding("utf-8");


  String query = "select c.c_num, p.p_num,p.p_name,p.p_price,c.c_quan,c.c_order from product As p, cart AS c where c.p_num=p.p_num AND c.u_id = '" +user_id +"' ;";
  System.out.println("[상세 보기 쿼리] : " + query);


  Statement stmt = null;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(query);


%>
<script type="text/javascript">
    function YnCheck(obj){
        if ($("#checkYn").is(':checked')==true){
            data.set("checkYn",1) ;
        }else {
            data.set("checkYn", 0) ;
        }
    };
</script>
<div >
    <p style="height: 150px">장바구니</p>
</div>
<div class="container">
  <div class="row">
    <table width="100%">
      <tr>
        <td align="left"><a href="removeAllCartProcess.jsp" class="btn btn-danger">삭제하기</a></td>
        <td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
      </tr>
    </table>
  </div>
  <div style="padding-top: 50px">
    <table class="table table-hover">
      <tr>
        <th>상품</th>
        <th>가격</th>
        <th>수량</th>
        <th>소계</th>
        <th>선택</th>
          <th>비고</th>
      </tr>
<%--      <%--%>
<%--        int sum = 0;--%>
<%--        ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");--%>
<%--        if (cartList == null)--%>
<%--          cartList = new ArrayList<Product>();--%>

<%--        for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기--%>
<%--          Product product = cartList.get(i);--%>
<%--          int total = product.getUnitPrice() * product.getQuantity();--%>
<%--          sum = sum + total;--%>
<%--      %>--%>
<%--      <tr>--%>
<%--        <td><%=product.getProductId()%> - <%=product.getPname()%></td>--%>
<%--        <td><%=product.getUnitPrice()%></td>--%>
<%--        <td><%=product.getQuantity()%></td>--%>
<%--        <td><%=total%></td>--%>
<%--        <td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>--%>
<%--      </tr>--%>
<%--      <%--%>
<%--        }--%>
<%--      %>--%>
      <%
        while(rs.next()){
      %>
      <tr>
        <td><%=rs.getString("p.p_name") %></td>
        <td><%=rs.getInt("p.p_price") %></td>
        <td><%=rs.getInt("c.c_quan") %></td>
        <td>example</td>
<%--          <td class = "Check">--%>
<%--          <input type="checkbox"  name="class1" <%=rs.getInt("c.c_num") %> ">  value="1" checked>--%>
<%--          <label for="ck1<%=rs.getInt("c.c_num") %> "> </label></td>--%>
<%--          </td>--%>

<%--          <td class = "Check">--%>
<%--              <input type="checkbox"  name="class1" id="checkYn" onchange="YnCheck(this);" >--%>
<%--              <label for= "checkYn"> </label>--%>
<%--          </td>--%>

          <td><form name="addOrder" action="addOrder.jsp" >
              <input type="checkbox"  name="class1" <%=rs.getInt("c.c_num") %> ">
              <input type="submit" value="Submit">
          </form></td>


          <td><form name="deletecart" action="removeCartProcess.jsp" method="post" class="badge badge-danger">
<%--            <input type="hidden" name="btn_dcart" value=" <%=rs.getString("c_num") %>">--%>
            <input type="submit" value="삭제">
        </form></td>
      </tr>
      <%
        }
      %>
      <tr>
        <th></th>
        <th></th>
        <th>총액</th>
        <th>sum</th>
        <th></th>
      </tr>
    </table>
    <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
  </div>
  <hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
