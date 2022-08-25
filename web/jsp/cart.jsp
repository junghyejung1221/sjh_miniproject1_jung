<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-19
  Time: 오후 6:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
  <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <%
    String cartId = session.getId();
  %>
  <title>장바구니</title>
</head>
<body>
<jsp:include page="header.jsp" />
<%@ include file="dbconn.jsp"%>
<%
  int p_num =0;

  request.setCharacterEncoding("utf-8");


  String query = "select * from cart ";
  System.out.println("[상세 보기 쿼리] : " + query);


  Statement stmt = null;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(query);


%>
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
        <td><%=rs.getString("p_num") %></td>
        <td>example</td>
        <td>example</td>
        <td>example</td>
        <td><form name="deletecart" action="removeCartProcess.jsp" method="post" class="badge badge-danger">
            <input type="hidden" name="btn_dcart" value=" <%=rs.getString("c_num") %>">
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
