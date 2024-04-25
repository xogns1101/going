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

        <div class="animated-title">
            <div class="track">
                <div class="content">&nbsp;야가자캠핑에 오신것을 환영합니다!&nbsp;회원가입을 하시면 리뷰를 작성하실 수 있으니 많은 가입 부탁드립니다.&nbsp;야가자캠핑에
                    오신것을 환영합니다!&nbsp;회원가입을 하시면 리뷰를 작성하실 수 있으니 많은 가입 부탁드립니다&nbsp;야가자캠핑에 오신것을 환영합니다!&nbsp;</div>
            </div>
        </div>

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
                    <img src="/review${r.reviewImage}" alt="베스트리뷰"><br>
                    <ul class="review">
                        <input type="hidden" name="rno" value="${r.reviewNo}">
                        <li class="camp-name">${r.campName}</li>
                        <li class="review-content">${r.reviewContent}</li>
                        <li class="review-views"></li>
                        <li class="star-rating">
                            <input type="radio" id="5-stars" name="reviewPoint" value="5" readonly />
                            <label for="5-stars" class="star">&#9733;</label>
                            <input type="radio" id="4-stars" name="reviewPoint" value="4" readonly />
                            <label for="4-stars" class="star">&#9733;</label>
                            <input type="radio" id="3-stars" name="reviewPoint" value="3" readonly />
                            <label for="3-stars" class="star">&#9733;</label>
                            <input type="radio" id="2-stars" name="reviewPoint" value="2" readonly />
                            <label for="2-stars" class="star">&#9733;</label>
                            <input type="radio" id="1-stars" name="reviewPoint" value="1" readonly />
                            <label for="1-stars" class="star">&#9733;</label>
                        </li>

                        <input type="hidden" name="starPoint" id="starPoint" value="${r.reviewPoint}">
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

        // 스타포인트값
        const reviewPoint = '${r.reviewPoint}';
        document.getElementById(reviewPoint + '-stars').click();

        // JavaScript 코드
        document.addEventListener("DOMContentLoaded", function () {
            // 별 모양 요소들을 가져옵니다.
            var stars = document.querySelectorAll('.star');

            // 각 별 모양에 이벤트 리스너를 추가합니다.
            stars.forEach(function (star) {
                star.addEventListener('mouseover', function () {
                    // 호버 시 클래스를 추가합니다.
                    star.classList.add('hovered');
                });

                star.addEventListener('mouseleave', function () {
                    // 마우스가 벗어날 때 클래스를 제거합니다.
                    star.classList.remove('hovered');
                });

                star.addEventListener('click', function (event) {
                    // 클릭 이벤트의 기본 동작을 막습니다.
                    event.preventDefault();
                });
            });
        });
    </script>


    <!-- 날씨 끝 -->

    <%@ include file="include/footer.jsp" %>

</body>

</html>