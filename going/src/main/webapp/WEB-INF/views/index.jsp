<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>YAGAJA</title>

    <%@ include file="include/static-head.jsp" %>



</head>

<body>
    <%@ include file="include/header.jsp" %>
    



    <section class="main-page1">

        <div class="main-content">
            <h1>CAMPING OF THE MONTH</h1>
            <div class="main-img">
                <img class="campin-img1" src="/assets/img/camp1.jpg" alt="이달의캠핑1">
                <img class="campin-img2" src="/assets/img/camp2.jpg" alt="이달의캠핑2">
                <img class="campin-img3" src="/assets/img/camp3.jpg" alt="이달의캠핑3">
            </div>
        </div>

    </section>


    <section class="main-page2">

        <div class="main-content">

            <div class="weather">
                <!-- 날씨  -->

                <h1>WEATHER</h1>
                <div class="tomorrow" data-location-id="065327" data-language="KO" data-unit-system="METRIC"
                    data-skin="light" data-widget-type="upcoming" style="padding-bottom:22px;position:relative;">
                    <a href="https://www.tomorrow.io/weather-api/" rel="nofollow noopener noreferrer" target="_blank"
                        style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;">
                        <img alt="Powered by the Tomorrow.io Weather API"
                            src="https://weather-website-client.tomorrow.io/img/powered-by.svg" width="250"
                            height="18" />
                    </a>
                </div>
            </div>

            <div class="best-review">
                <h1>BEST REVIEW</h1>
                <div class="review-box">
                    <img src="/assets/img/camp5.jpg" alt="베스트리뷰"><br>
                    <ul class="review">
                        <li class="review-title">홀리데이 캠핑장에 다녀오다!</li>
                        <li class="review-content">캠핑장이 오랜만인데 너무 너무 좋네요 하하하 또 가고싶어요 분위기도 너무 좋구요 가족끼리 오기 딱인거 같네요!</li>
                        <li class="review-views">4점</li>
                    </ul>

                </div>
            </div>

            <div class="ad">
                <div class="ad-box">

                    <img src="/assets/img/ad2.jpg" alt="광고1">
                    <img src="/assets/img/ad3.jpg" alt="광고2">
                    <img src="/assets/img/ad4.jpg" alt="광고3"></div>
            </div>



        </div>


    </section>


    <!-- 날씨 시작 -->
    <script>
        (function (d, s, id) {
            if (d.getElementById(id)) {
                if (window.__TOMORROW__) {
                    window.__TOMORROW__.renderWidget();
                }
                return;
            }
            const fjs = d.getElementsByTagName(s)[0];
            const js = d.createElement(s);
            js.id = id;
            js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

            fjs.parentNode.insertBefore(js, fjs);
        })(document, 'script', 'tomorrow-sdk');
    </script>


    <!-- 날씨 끝 -->

    <%@ include file="include/footer.jsp" %>

</body>

</html>