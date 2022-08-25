<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-25
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cartId = session.getId();

    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_shippingDate = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_addressName = "";

    Cookie[] cookies = request.getCookies();

    if(cookies != null){
        for(int i = 0; i<cookies.length; i++){
            Cookie thisCookie = cookies[i];
            String n = thisCookie.getName();
            if(n.equals("Shipping_cartId"))
                shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            if(n.equals("Shipping_name"))
                shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            if(n.equals("Shipping_shippingDate"))
                shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            if(n.equals("Shipping_country"))
                shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            if(n.equals("Shipping_zipCode"))
                shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
            if(n.equals("Shipping_addressName"))
                shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
        }
    }
%>

<html>
<head>

    <title> 주문 정보</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div >
    <p style="height: 150px">주문 정보</p>
</div>

<div class="container col-8 alert alert-info">
    <div class = "text-center ">
        <h1> 영수증</h1>
    </div>
    <div class="row justify-content-between">
        <div class="col-4" align="left">
            <strong> 배송 주소 </strong> <br> 성명 : <br>
            우편번호 :<br>
            주소 :  <br>
        </div>
        <div class ="col-4" align="right">
            <p> <em> 배송일:</em>
        </div>
    </div>
    <div>
        <table class="table table-hover">
            <tr>
                <th class="text-center">도서</th>
                <th class="text-center">#</th>
                <th class="text-center">가격</th>
                <th class="text-center">소계</th>
            </tr>

            <tr>
                <td class="text-center"><em>이름</em></td>
                <td class="text-center">수량</td>
                <td class="text-center">원</td>
                <td class="text-center">총계원</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="text-right"><strong>총액:</strong></td>
                <td class="text-center text-danger"><strong></strong></td>
            </tr>
        </table>

        <a href=" ./shippingInfo.jsp?cartId=<%=shipping_cartId %>"class="btn btn-secondary" role="button">이전</a>
        <a href=" ./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
        <a href=" ./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>

    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>