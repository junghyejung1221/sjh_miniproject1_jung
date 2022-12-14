<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-25
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>shop</title>
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
</head>
<body>

<!--HEADER-->
<jsp:include page="header.jsp" />

<section class="signin">
    <h1>로그인</h1>
    <div class="signin__card">
        <h2>
            <strong >Welcome!!</strong> 탬버린즈에 오신 것을 환영합니다.
        </h2>
        <form action="loginSession.jsp" method="post">
            <input type="text" placeholder="아이디를 입력하세요. " name="sessionId" />
            <input type="password" placeholder="비밀번호를 입력하세요. " name="sessionPw" />
            <input type="submit" value="로그인 " />
            <p>
                * 비밀번호를 타 사이트와 같이 사용할 경우 도용 위험이 있으니, <br>
                정기적으로 비밀번호를 변경하세요!
            </p>
        </form>
        <div class="actions">
            <a href="./signup.jsp">회원가입</a>
            <a href="./searchID.jsp">아이디 찾기</a>
            <a href="./searchPassword.jsp">비밀번호 찾기</a>
        </div>
    </div>
</section>

<!--FOOTER-->
<jsp:include page="footer.jsp" />

</body>
</html>
