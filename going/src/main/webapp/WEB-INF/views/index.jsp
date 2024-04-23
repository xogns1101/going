<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>YAGAJA</title>
    <link rel="stylesheet" href="/assets/css/main.css">

    <!-- linear icons -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">



</head>

<body>

    <header>
        <div id="wrap">
            <h1 class="logo"><a href="/main">Y⛺GAJA</a></h1>
            <div class="logo-content">
                <a href="/main/introduce">INTRO</a>
                <a href="/main/reservation">RESERVATION</a>
                <a href="/main/notice">NOTICE</a>
                <a href="/main/review">REVIEW</a>
            </div>
            <div class="login">
                <a href="/user/sign-in"><p>LOGIN</p></a><br>
            </div>
            <div class="logout">
                <a href="/user/sign-out">LOGOUT</a><br>
                <a href="/user/mypage">MYPAGE</a>
            </div>



            <!-- 로그인이 되어있으면 로그아웃이랑 마이페이지만 뜰수있도록

                <div class="login">
                <c:if test="${login == null}">
                    <a href="/user/sign-in">LOGIN</a><br>
                </c:if>


                <c:if test="${sessionScope.login != null}">
                    <a href="/user/sign-out">LOGOUT</a><br>
                    <a href="/user/mypage">MYPAGE</a>
                </c:if>
            </div> 

        -->


            


            <p class="menu-open">
                <span class="lnr lnr-menu"></span>
            </p>
        </div>

        <nav class="gnb">
            <p class="close">
                <span class="lnr lnr-cross"></span>
            </p>
            <ul>
                <li><a href="/main/introduce">INTRO</a></li>
                <li><a href="/main/reservation">RESERVATION</a></li>
                <li><a href="/main/notice">NOTICE</a></li>
                <li><a href="/main/review">REVIEW</a></li>
                <li><a href="/user/sign-in">LOGIN</a></li>
                <li><a href="/user/sign-out">LOGOUT</a></li>
                <li><a href="/user/mypage">MYPAGE</a></li>
            </ul>
        </nav>

        <script>
            //버튼의 요소 노드 취득
            const menuBtn = document.querySelector('header .menu-open');
            const closeBtn = document.querySelector('.gnb .close');

            const gnb = document.querySelector('.gnb');

            //클릭 이벤트 생성
            menuBtn.addEventListener('click', () => {
                gnb.classList.add('open');
            });

            closeBtn.addEventListener('click', () => {
                gnb.classList.remove('open');
            });
        </script>
        
    </header>




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

                    <img src="/assets/img/ad2.png" alt="광고">
                    <img src="/assets/img/ad3.png" alt="광고">
                    <img src="/assets/img/ad4.png" alt="광고"></div>
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












    <footer>


        <div class="footer-wrap">
            <div class="footer-content">
                <p class="footer-main">
                    YAGAJA &#124; 대표자명 : 홍길동 &#124; 사업자등록번호 : 123-12-1234
                    <br>주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀) &#124; 문의 : 02-123-1234
                </p>
                <br>

                <p class="footer-link"><a href="">이용약관</a> &#124; <a href="">개인정보처리방침</a></p>

                <br>

                <p class="footer-copyright">Copyright ⓒ 2024~ YAGAJA All Rights Reserved.</p>

            </div>


            <h1 class="footer-logo"><a href="/main"><span>Y</span>⛺<span>GAJA</span></a></h1>
            <!-- <a href="#" class="go-top"><span class="lnr lnr-arrow-up"></span></a> -->
        </div>


    </footer>

</body>

</html>