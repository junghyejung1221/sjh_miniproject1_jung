<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
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

        .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 20px;}
        .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:300px; }

        .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
        .orderView li::after { content:""; display:block; clear:both; }

        .thumb { float:left; width:200px;margin-bottom:20px; }
        .thumb img { width:200px; height:200px; }
        .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
        .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:calc(100% - 220px); margin-right:10px; }
    </style>
</head>

<%@ include file="dbconn.jsp"%>
<%
    String user_id = (String) session.getAttribute("userid");
    System.out.println("장바구니 창 아이디: "+user_id);

    request.setCharacterEncoding("utf-8");


    String query = "select * from receipt where u_id = '" +user_id +"' ;";
    System.out.println("[주문 보기 쿼리] : " + query);


    Statement stmt = null;

    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

%>
<body>
<!--HEADER-->
<jsp:include page="header.jsp" />


<div >
    <p style="height: 150px">주문확인</p>
</div>


<div class="my_box">
    <div class = "sidemenu">
        <ul>
            <li><a href="myPage.jsp">My Page</a></li>
            <li><a href="userInfo.jsp">회원 정보 수정 </a></li>
            <li><a href="userCart.jsp">장바구니</a></li>
            <li><a class="active" href="orderResult.jsp">주문확인</a></li>
        </ul>
    </div>





    <div class = "my_right">
        <section id="content">
            <%
                String code;
                while(rs.next()){
                    code = rs.getString("r_code");
            %>
            <div class="orderInfo">

    <p><span>주문자 : <%=rs.getString("r_name") %> </span></p>
    <p><span>주소 : <%=rs.getString("r_address") %> </span> </p>
    <p><span>주문번호 : <%=rs.getString("r_code") %></span></p>
    <p><span>연락처 : <%=rs.getString("r_phone") %></span></p>

            </div>

            <%
                String queryorder = "select p.p_image, p.p_price,p.p_name ,o.o_result,o.p_num,o.o_result,o.o_quan,o.o_total from product As p, order_list As o  where o.p_num=p.p_num AND o.o_code = '"+ code +"' AND o.u_id = '" +user_id +"' ;";
                System.out.println("[주문order 보기 쿼리] : " + queryorder);


                Statement stmtorder = null;
                ResultSet rsorder = null ;

                stmtorder = conn.createStatement();
                rsorder = stmtorder.executeQuery(queryorder);

            %>

            <ul class="orderView">
                    <li>
                        <%
                            while(rsorder.next()){
                        %>
                        <div class="thumb">
                            <img src="<%=rsorder.getString("p.p_image") %>" />
                        </div>

                        <div class="gdsInfo">
                                <span>배송상황 : <%=rsorder.getString("o.o_result") %> </span>
                                <span>상품명 : <%=rsorder.getString("p.p_name") %></span>
                                <span>개당 가격 : <%=rsorder.getString("p.p_price") %> 원</span>
                                <span>구입 수량 : <%=rsorder.getString("o.o_quan") %> 개</span>
                                <span>최종 가격 : <%=rsorder.getString("o.o_total") %>  원</span>
                            <hr>
                            <br>
                        </div>
                        <%
                            }
                        %>
                    </li>

            </ul>

            <%
                }
            %>
        </section>
    </div>
</div>

<!--FOOTER-->
<jsp:include page="footer.jsp" />
</body>
</html>