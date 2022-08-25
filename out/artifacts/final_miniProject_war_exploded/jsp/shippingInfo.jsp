<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-25
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문하기</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div >
  <p style="height: 150px">장바구니</p>
</div>
<div class="container">
  <form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
    <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
    <div class="form-group row">
      <label class="col-sm-2">성명</label>
      <div class="col-sm-3">
        <input name="name" type="text" class="form-control" />
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2">배송일</label>
      <div class="col-sm-3">
        <input name="shippingDate" type="text" class="form-control" />(YYYY/MM/DD)
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2">국가명</label>
      <div class="col-sm-3">
        <input name="country" type="text" class="form-control" />
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2">우편번호</label>
      <div class="col-sm-3">
        <input name="zipCode" type="text" class="form-control" />
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2">주소</label>
      <div class="col-sm-5">
        <input name="addressName" type="text" class="form-control" />
      </div>
    </div>
    <div class="form-group row">
      <div class="col-sm-offset-2 col-sm-10 ">
        <a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a>
        <input	type="submit" class="btn btn-primary" value="등록" />
        <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
      </div>
    </div>
  </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>