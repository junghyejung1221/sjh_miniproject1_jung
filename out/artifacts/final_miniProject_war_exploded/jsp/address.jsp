<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오후 12:14
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
    <form action="./ProcessOrderList.jsp" class="form-horizontal" method="post">
        <div class="form-group row">
            <label class="col-sm-2">주문자명</label>
            <div class="col-sm-3">
                <input name="name" type="text" class="form-control" />
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
            <label class="col-sm-2">전화번호</label>
            <div class="col-sm-5">
                <input name="phone" type="text" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <a href="./cart.jsp" class="btn btn-secondary" role="button"> 이전 </a>
                <input	type="submit" class="btn btn-primary" value="등록" />
                <a href="./Main.jsp" class="btn btn-secondary" role="button"> 취소 </a>
            </div>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>