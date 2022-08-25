<%--
  Created by IntelliJ IDEA.
  User: iot29
  Date: 2022-08-25
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<!--badges-->
<jsp:include page="badges.jsp" />

<!--VISUAL-->
<jsp:include page="visual.jsp" />


<!--NOTICE-->
<jsp:include page="notice.jsp" />



<!--YOUTUBE VIDEO-->
<section class="youtube">
    <div class="youtube__cover"></div>
    <video class="video--transform" playsinline="" autoplay="" muted="" loop="" poster="https://www.tamburins.com/img/store/dosan/Dosan1_poster.jpg">
        <source src="https://www.tamburins.com/img/store/dosan/Dosan1.mp4" type="video/mp4">
    </video>
</section>


<!--AWARDS-->
<section class="awards">
    <div class="inner">

        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide1.jpg" alt="대통령 표창" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide2.jpg" alt="대통령 표창 (3년 연속)" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide3.jpg" alt="우수사업주 인증" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide4.jpg" alt="경연대회 대상" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide5.jpg" alt="대한상의회장상" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide6.jpg" alt="기업사회공헌 활동 부문" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide7.jpg" alt="KSI 1위 (5년 연속)" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide8.jpg" alt="KS-SQI 1위 (5년 연속)" />
                </div>
                <div class="swiper-slide">
                    <img src="../resources/images/awards_slide10.jpg" alt="동반성장 부문 (4년 연속)" />
                </div>
            </div>
        </div>

        <div class="swiper-prev">
            <span class="material-icons">arrow_back</span>
        </div>
        <div class="swiper-next">
            <span class="material-icons">arrow_forward</span>
        </div>

    </div>
</section>


<!--FOOTER-->
<jsp:include page="footer.jsp" />


<!--TO TOP BUTTON-->
<div id="to-top">
    <div class="material-icons">arrow_upward</div>
</div>

</body>
</html>
