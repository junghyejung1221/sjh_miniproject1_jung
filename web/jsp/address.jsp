<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-26
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>shop</title>

    <!--Open Graph-->
    <!--http://ogp.me/-->
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="tamburins" />
    <meta property="og:title" content="tamburins" />
    <meta property="og:description" content="tamburins" />
    <meta property="og:url" content="https://www.tamburins.com/" />

    <!--Twitter Card-->
    <!--https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started-->
    <meta property="twitter:card" content="summary" />
    <meta property="twitter:site" content="tamburins" />
    <meta property="twitter:title" content="tamburins" />
    <meta property="twitter:description" content="tamburins" />
    <meta property="twitter:url" content="https://www.tamburins.com/" />

    <!--파비콘-->
    <!--<link rel="shortcut icon" href="favicon.ico" />-->
    <link rel="icon" href="./favicon.png" />
    <!--브라우저 스타일 초기화-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
    <!--Google Fonts - 나눔고딕-->
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <!--Google Material Icons-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

    <link rel="stylesheet" href="../resources/css/common.css" />
    <link rel="stylesheet" href="../resources/css/main.css" />
    <link rel="stylesheet" href="../resources/css/signin.css" />


    <!--GSAP & ScrollToPlugin-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous"></script>
    <!--Swiper-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <!--ScrollMagic-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"></script>
    <!--Lodash-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js" integrity="sha512-90vH1Z83AJY9DmlWa8WkjkV79yfS2n2Oxhsi2dZbIv0nC4E6m5AbH8Nh156kkM7JePmqD6tcZsfad1ueoaovww==" crossorigin="anonymous"></script>

    <script defer src="../resources/js/youtube.js"></script>
    <script defer src="../resources/js/common.js"></script>
    <script defer src="../resources/js/main.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        // function formSubmit() {
        //     if(document.getElementById("Name").value.length == 0 ) {
        //         alert('이름을 입력하세요');
        //         document.getElementById("Name").focus();
        //         return false;
        //     }
        //     if(document.getElementById("zipCode").value == "" ) {
        //         alert('우편 번호를 입력하세요');
        //         document.getElementById("zipCode").focus();
        //         return false;
        //     }
        //     if(document.getElementById("addressName").value == "" ) {
        //         alert('주소를 입력하세요');
        //         document.getElementById("addressName").focus();
        //         return false;
        //     }
        //     if(document.getElementById("phone").value == "" ) {
        //         alert('전화번호를 입력하세요');
        //         document.getElementById("phone").focus();
        //         return false;
        //     }
        // }

        const patt = new RegExp("[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}");
        const res = patt.test( $("#phone").val());

        function add_Form(){
            if($("#Name").val()=='') { alert("이름을 입력하세요!!!"); $("#name").focus(); return false;  }
            if($("#zipCode").val()=='') { alert("우편번호를 입력하세요!!!");  $("#zipCode").focus(); return false;  }
            if($("#addressName").val()=='') { alert("주소를 입력하세요!!!");  $("#addressName").focus(); return false;  }
            if($("#phone").val()=='') { alert("전화번호를 입력하세요!!!");  $("#phone").focus(); return false;  }
            if( !patt.test( $("#phone").val()) ){alert("전화번호를 정확히 입력하여 주십시오.");  $("#phone").focus(); return false;}


            $("#next_form").attr("action", "./ProcessOrderList.jsp").submit();


        }
    </script>
</head>
<body>

<!--HEADER-->
<jsp:include page="header.jsp" />

<section class="signin">
    <h1>로그인</h1>
    <div class="signin__card">
        <h2>
            <strong >주문자 정보를 입력해주세요! </strong>
        </h2>

        <div class="container">
<%--            <form action="./ProcessOrderList.jsp" id="next_form" class="form-horizontal" method="post" >--%>
    <form  id="next_form" class="form-horizontal" method="post" >

    <div class="form-group row">

                    <div class="col-sm-3">
                        <label class="col-sm-2">주문자명 : </label> <input  placeholder="주문자 이름을 입력하세요. " id="Name" name="name" type="text" class="form-control" />
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-3">
                        <label class="col-sm-2">우편번호 : </label> <input  placeholder="우편번호를 입력하세요. " id="zipCode" name="zipCode" type="text" class="form-control" />
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-5">
                        <label class="col-sm-2">주소 : </label><input  placeholder="주소를 입력하세요. " id="addressName" name="addressName" type="text" class="form-control" />
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-5">
                        <label class="col-sm-2">전화번호 :</label> <input  placeholder="00*-000*-0000" id="phone" name="phone" type="text" class="form-control" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"  />
                    </div>
                </div>

                <div class="form-group row">
                        <a href="./cart.jsp" class="btn btn-secondary" role="button"> 이전 </a>
<%--                        <input id="submit"	type="submit" class="btn" value="등록" />--%>
                    <input id="next" type="button" class="btn" value="등록"  onclick="add_Form()" />

                </div>
            </form>
        </div>
    </div>
</section>

<%
    request.setCharacterEncoding("utf-8");
    /* String[] checknum = request.getParameterValues("check_cnum"); */



    session.setMaxInactiveInterval(3600*7); //세션 유지 기간 설정

    ArrayList<String> list = (ArrayList<String>)session.getAttribute("checkList");
    String[] checkNum= request.getParameterValues("check_cnum");



//session.getAttribute("checkList") == null 이든 아니든 상관없이
    list = new ArrayList<String>();
    for(String num: checkNum){

        list.add(num);
    }


    session.setAttribute("checkList", list);
    System.out.println("prdlist:"+list);
%>

<!--FOOTER-->
<jsp:include page="footer.jsp" />

</body>
</html>
