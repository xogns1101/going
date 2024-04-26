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


            <!-- 공지사항  -->

            <div class="animated-title">
                <c:if test="${login != null}">
                    <div class="track">
                        <div class="content">⛺공지&nbsp;&nbsp;&nbsp;야가자캠핑에 오신것을 환영합니다!&nbsp;&nbsp;&nbsp;${login.name}님 캠핑은
                            어떠셨나요~?&nbsp;&nbsp;&nbsp;공지사항 필수로 확인해주세요~&nbsp;&nbsp;⛺공지&nbsp;&nbsp;&nbsp;야가자캠핑에 오신것을
                            환영합니다!&nbsp;&nbsp;&nbsp;${login.name}님 캠핑은 어떠셨나요~?&nbsp;&nbsp;&nbsp;공지사항 필수로
                            확인해주세요~&nbsp;야가자캠핑에 오신것을 환영합니다!&nbsp;</div>
                    </div>
                </c:if>
            </div>


            <!-- 베스트 캠핑장  -->
            <h1>CAMPING OF THE MONTH</h1>
            <div class="best-camping">
                <div class="main-img">
                    <div class="main-img1">
                        <img class="campin-img1" src="/assets/img/camp5.jpg" alt="이달의캠핑1">
                    </div>
                    <div class="main-img2">
                        <img class="campin-img2" src="/assets/img/camp2.jpg" alt="이달의캠핑2">
                        <img class="campin-img3" src="/assets/img/camp1.jpg" alt="이달의캠핑3">
                    </div>
                </div>

                <p>캠핑예약 바로가기 <br> <a href="/main/reservation">GO</a> </p>

            </div>
        </div>


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const animatedTitle = document.querySelector('.animated-title');
                const mainContent = document.querySelector('.main-content');
                const loginStatus = "${login}";

                if (loginStatus === null || loginStatus === "") {
                    animatedTitle.style.display = "none";
                } else if (loginStatus !== null) {
                    mainContent.style.marginTop = "0px";
                }

            });
        </script>

    </section>


    <section class="main-page0">

        <!-- 캠핑 리스트 -->

        <p class="camping-animation">

            <div></div>
            <div class='highlight'></div>
            <div></div>
            <div></div>

        </p>


        <script>
            var divs = document.querySelectorAll("div");
            divs.forEach(function (elm) {
                elm.addEventListener("mouseenter", function () {
                    var panel = document.querySelector(".highlight");
                    panel.classList.toggle("highlight");
                    elm.classList.toggle("highlight");
                });
            });

            window.addEventListener("keyup", function (e) {
                var panel = document.querySelector(".highlight");
                if (
                    (e.keyCode == 37 || e.keyCode == 38) &&
                    panel != document.querySelectorAll("div")[0]
                ) {
                    panel.previousElementSibling.classList.toggle("highlight");
                    panel.classList.toggle("highlight");
                }
                if (
                    (e.keyCode == 39 || e.keyCode == 40) &&
                    panel != document.querySelectorAll("div")[3]
                ) {
                    panel.nextElementSibling.classList.toggle("highlight");
                    panel.classList.toggle("highlight");
                }
            });

            window.focus();
        </script>

    </section>






    <section class="main-page2">

        <div class="main-content">

            <!-- 날씨  -->
            <div class="weather">

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


            <!-- 최신리뷰 확인 -->

            <div class="best-review">
                <h1>NEW REVIEW</h1>
                <div class="review-box">
                    <ul class="review">
                        <input type="hidden" name="rno" value="${r.reviewNo}">
                        <li class="review-views"></li>

                        <img src="/review${r.reviewImage}" alt="최신리뷰" aria-placeholder="등록된 리뷰가 없습니다."><br>

                        <div class="review-title">
                            <li class="camp-name">${r.campName}</li>
                            <!-- 별점 시작 -->
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
                            <!-- 별점 끝 -->
                        </div>

                        <li class="review-content">${r.reviewContent}</li>
                    </ul>


                </div>
            </div>

            <div class="ad">
                <div class="ad-box">
                    <img src="/assets/img/ad2.jpg" alt="광고1">
                    <img src="/assets/img/ad3.jpg" alt="광고2">
                    <img src="/assets/img/ad4.jpg" alt="광고3">
                </div>
            </div>



        </div>


    </section>



    <script>
        // 날씨
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



        // 광고 클릭 이벤트
        const $ad = document.querySelector('.ad');

        $ad.addEventListener('click', e => {


            if (e.target.matches('ad')) {
                return;
            }

            if (e.target.matches('img')) {

                window.open("https://campingcore.co.kr/", "_blank");
            }


        })


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