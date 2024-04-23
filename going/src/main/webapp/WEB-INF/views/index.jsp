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












    <footer>


        <div class="footer-wrap">
            <div class="footer-content">
                <p class="footer-main">
                    YAGAJA &#124; 대표자명 : 홍길동 &#124; 사업자등록번호 : 123-12-1234
                    <br>주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀) &#124; 문의 : 02-123-1234
                </p>
                <br>

                <p class="footer-link">
                    <span class="modal-open" data-modal-target="terms-modal">이용약관</span> &#124;
                    <span class="modal-open" data-modal-target="privacy-modal">개인정보처리방침</span>
                </p>

                <br>

                <p class="footer-copyright">Copyright ⓒ 2024~ YAGAJA All Rights Reserved.</p>

            </div>


            <h1 class="footer-logo"><a href="/main"><span>Y</span>⛺<span>GAJA</span></a></h1>
            <!-- <a href="#" class="go-top"><span class="lnr lnr-arrow-up"></span></a> -->

            <div id="terms-modal" class="modal">
                <div class="modal-content">
                    <span class="modal-close">&times;</span>
                    <p style="font-size: 20px;">제1조(목적)</p>
                    <br>
                    <p>이 약관은 YAGAJA 회사(전자상거래 사업자)가 운영하는 YAGAJA 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</p><br>
                    <p>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><br>
                    <p>... 이하 생략</p>
                </div>
            </div>
    
            <div id="privacy-modal" class="modal">
                <div class="modal-content">
                    <span class="modal-close">&times;</span>
                    <p style="font-size: 20px;">※ 총 칙</p>
                    <br>
                    <p>1. YAGAJA는 "정보통신망이용촉진및정보보호등에관한법률"상의 개인정보보호 규정과 정보통신부가 제정한 "개인정보보호지침" 및 "개인정보의 기술적/관리적 보호조치 기준"을 준수하고 있습니다.</p>
                    <p>또한 YAGAJA는 "개인정보보호정책"을 제정하여 회원들의 개인정보 보호를 위해 최선을 다하겠음을 선언합니다.</p><br>
                    <p>2. YAGAJA의 "개인정보보호정책"은 관련 법률 및 정부 지침의 변경과 YAGAJA의 내부 방침 변경에 의해 변경될 수 있습니다. </p>
                    <p>YAGAJA의 "개인정보보호방침"이 변경될 경우 변경사항은 YAGAJA 홈페이지의 공지사항에 최소 7일간 게시됩니다. </p><br>
                    <p>... 이하 생략</p>
                </div>
            </div>
    
            
        </div>


    </footer>

    <script>
        // footer 이용약관, 개인정보처리방침 모달
        document.addEventListener('DOMContentLoaded', function () {
            const modalOpenButtons = document.querySelectorAll('.modal-open');
            const modalCloseButtons = document.querySelectorAll('.modal-close');
            const modals = document.querySelectorAll('.modal');

            modalOpenButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const targetModalId = button.getAttribute('data-modal-target');
                    const targetModal = document.getElementById(targetModalId);
                    targetModal.style.display = 'block';
                });
            });

            modalCloseButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const modal = button.closest('.modal');
                    modal.style.display = 'none';
                });
            });

            modals.forEach(modal => {
                modal.addEventListener('click', function (event) {
                    if (event.target === modal) {
                        modal.style.display = 'none';
                    }
                });
            });
        });
    </script>

</body>

</html>