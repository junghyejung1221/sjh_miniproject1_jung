<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오후 4:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%> --%>
--%>
--%>
<%

  String display= "none";
  String user_id = (String) session.getAttribute("userid");
  System.out.println("장바구니 창 아이디: "+user_id);
%>

<!doctype html>
<html lang="ko">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ include file="dbconn.jsp"%>
<%
  int p_num =0;
  int sum =0;


  request.setCharacterEncoding("utf-8");


  String query = "select c.c_num, p.p_num,p.p_name,p.p_price,c.c_quan,c.c_order from product As p, cart AS c where c.p_num=p.p_num AND c.u_id = '" +user_id +"' ;";
  System.out.println("[상세 보기 쿼리] : " + query);


  Statement stmt = null;

  stmt = conn.createStatement();
  rs = stmt.executeQuery(query);


%>
<script>
  function orderCheck(){

    if(($("#check_cnum:checked").length)>0){

      document.selectCartForm.action = 'address.jsp';
      document.selectCartForm.submit();

    }
    else{
      alert("물건을 선택해 주세요");
      return false

    }

    /*    document.selectCartForm.action = 'address.jsp';
       document.selectCartForm.submit(); */
  }

  function delete_Check(){

    if(($("#check_cnum:checked").length)>0){

      document.selectCartForm.action = 'removeCartProcess.jsp';
      document.selectCartForm.submit();

    }
    else{
      alert("물건을 선택해 주세요");
      return false

    }

    /*    document.selectCartForm.action = 'address.jsp';
       document.selectCartForm.submit(); */
  }

  function count(type)  {
    // 결과를 표시할 element
    const resultElement = document.getElementById('result');

    // 현재 화면에 표시된 값
    let number = resultElement.innerText;

    // 더하기/빼기
    if(type === 'plus') {
      number = parseInt(number) + 1;
    }else if(type === 'minus')  {
      number = parseInt(number) - 1;
    }

    // 결과 출력
    resultElement.innerText = number;
  }
  function update_Form(){

    // $("input[type=text][name='c_quan[]']");
    // let quans =  $("input[type=text][name='c_quan[]']");
    // let nums =  $("input[type=hidden][name='c_num[]']");
    // let nn = quans.length;
    // let num =[];
    //   let quan =[];
    //
    //
    // for (let i = 0 ; i < nn ; i++ ){
    //   num.push($(nums.get(i)).val());
    //   quan.push($(quans.get(i)).val());
    //   console.log("quan" + i + "c_num는 "+ num + " 값 :  " +  quan);
    // }

      // document.selectCartForm.num.value = num.join(",");
      // // document.selectCartForm.quan.value = quan;
      // document.selectCartForm.submit();
      // document.selectCartForm.setAttribute('Num',num);



    document.selectCartForm.action = 'updateProcess.jsp';
    document.selectCartForm.submit();

  }

  function cancelCheck(){

    alert("아이디를 입력하세요");

    document.selectCartForm.action = 'Main.jsp';
    document.selectCartForm.submit();
  }


</script>

<head>
  <meta charset="utf-8">
  <title>CSS</title>
  <style>
    .sidemenu {
      margin-bottom: 100px;
    }
    .sidemenu ul {
      list-style-type: none;
      margin-left: 250px;
      padding: 0;
      width: 200px;
      background-color: #f1f1f1;
    }
    .sidemenu li a {
      display: block;
      color: #000;
      padding: 8px 16px;
      text-decoration: none;
    }
    .sidemenu li a.active {
      background-color: #f3d967;
      color: white;
    }
    .sidemenu li a:hover:not(.active) {
      background-color: #555;
      color: white;
    }

    .my_right {
      list-style-type: none;
      margin-left: 50px;
      margin-bottom: 100px;
      padding: 0;
      width: 1000px;
      background-color: #f1f1f1;
      border: 1px solid #bcbcbc;
    }
    .my_right li a {
      display: block;
      color: #000;
      padding: 8px 16px;
      text-decoration: none;
    }
    .my_right li a.active {
      background-color: #f3d967;
      color: white;
    }
    .my_right li a:hover:not(.active) {
      background-color: #555;
      color: white;
    }
    .my_box {
      display: flex;
    }
    .text_rs{
        width: 200px;
        font-size: 20px ;
        text-align: center;
        margin: 10px;
    }
    .b_btn{
        display: flex;
    }
  </style>
</head>

<%

  String cartId = session.getId();
%>
<jsp:include page="header.jsp" />


<body>
<!--HEADER-->
<jsp:include page="header.jsp" />


<div >
  <p style="height: 150px">장바구니 </p>
</div>


<div class="my_box">
  <div class = "sidemenu">
    <ul>
      <li><a  href="myPage.jsp">My Page</a></li>
      <li><a href="userInfo.jsp">회원 정보 수정 </a></li>
      <li><a class="active" href="userCart.jsp">장바구니</a></li>
      <li><a href="orderResult.jsp">주문확인</a></li>
    </ul>
  </div>
  <div class = "my_right">
      <a href="./productsAll.jsp" class="btn btn-secondary"> &laquo; 쇼핑하기</a>
    <h4 style="text-align: center; font-size: 50px; font-weight: bold ">장바구니</h4>

    <div class="container">
      <div class="row">


        <!--  <table width="100%">
           <tr>
          <td align="left"><a href="removeAllCartProcess.jsp" class="btn btn-danger">삭제하기</a></td>
             <td align="right"><a href="./address.jsp" class="btn btn-success">주문하기</a></td>
           </tr>
         </table> -->
      </div>
      <div style="padding-top: 50px">
        <form name="selectCartForm" class="selectCartForm" style="text-align: center">
          <table class="table table-hover" >
            <tr>
              <th></th>
              <th> 상품</th>
              <th>가격</th>
              <th>수량</th>
              <th>소계</th>

              <th>수량 변경</th>
            </tr>

            <%
              while(rs.next()){
            %>
            <tr>
              <td><input type="checkbox" name="check_cnum" id="check_cnum" value="<%=rs.getInt("c.c_num") %>" /></td>
              <td><div class="text_rs"><%=rs.getString("p.p_name") %> </div> </td>
              <td><div class="text_rs"><%=rs.getInt("p.p_price") %>  </div> </td>
              <td><div class="text_rs"><input type="text"  name="c_quan[]" value="<%=rs.getInt("c.c_quan") %>" style="width: 30px; text-align: center" >  </div>   </td>
<%--              <input type="text" id="c_quan" name="c_quan" value="<%=rs.getInt("c.c_quan") %>">--%>
              <td><div class="text_rs"> <%=rs.getInt("p.p_price") * rs.getInt("c.c_quan") %>  </div></td>


              <td>
<%--                <input type="hidden" name="c_num[]" value="<%=rs.getInt("c.c_num") %>" />--%>
    <input type="hidden" name="c_num" value="<%=rs.getInt("c.c_num") %>" />

    <input  type="button"  value="변경" onclick="update_Form()" >

              </td>
            </tr>
            <%
                sum +=rs.getInt("p.p_price") * rs.getInt("c.c_quan");
              }
            %>
            <tr>
              <th></th>
              <th></th>
              <th></th>
              <th>총액</th>
              <th><%=sum %></th>
            </tr>
          </table>

            <div class="b_btn">

            <input class="btn btn-success" name="order" type="submit" value="주문하기" onclick="orderCheck()">
            <input  class="btn btn-success" name="delete" type="submit" value="삭제하기" onclick="delete_Check()" >
            </div>
        </form>

      </div>

    </div>

  </div>
</div>

<!--FOOTER-->
<jsp:include page="footer.jsp" />
</body>
</html>