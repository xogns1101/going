<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/mypage2.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/89a0fea006.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>

<body>

    <!-- header -------------------------------- -->
    <%@ include file="include/header.jsp" %>

    <!-- mypage ---------------------------------->
    <section>
        <div class="title">
            <h1>MY PAGE</h1>
        </div>

        <div class="mypage-list">
            <div class="mypage-box">


                <wrap class="User">
                    <div class="Profile">내 프로필</div>

                    <div class="Profileblank1">
                        <div class="UserName" name="name">${r.name}</div>
                        <i class="fa-solid fa-user fa-2x"></i>

                    </div>

                    <div class="Profileblank2">
                        <div class="PhoneNumber">${r.phoneNumber}</div>
                        <i class="fa-solid fa-phone fa-2x"></i>

                    </div>

                    <div class="Profileblank3">
                        <div class="Email">${r.email}</div>
                        <i class="fa-solid fa-envelope fa-2x"></i>

                    </div>

                    <!-- 환영박스  -->
                    <div class="Welcomemsgbox">
                        <div class="Welcomemsg">${r.name}님<br />♥환영합니다♥ <br> <span>(예약내역을 확인하시고 결제진행바랍니다.)</span></div>
                    </div>

                    <!-- 수정버튼
                     <div class="ModifyButton" onclick="handleModifyButtonClick(this)">
                     <div class="ModifyButtonText" onclick="handleModifyButtonClick(this)">수정하기</div>
                     </div>
                        -->

                </wrap>



                <wrap class="camp">

                    <div class="camp-title">
                        <div class="Reservation">예약내역</div>


                        <img src="/assets/img/kakaopay.png" alt="카카오페이">

                        <!-- 예약내역이 있다면 조건문 -->
                        <!-- <c:if test="">

                            <img src="/assets/img/kakaopay.png" alt="카카오페이">

                        </c:if> -->
                    </div>

                    <div class="Reservationblank1">
                        <div class="CampName">캠핑장명 : ${c.campName}</div>
                        <i class="fa-solid fa-campground fa-2x"></i>

                    </div>

                    <div class="Reservationblank2">
                        <div class="CampDate">예약일자 : ${c.regDate} ~ ${c.regDates}</div>
                        <i class="fa-solid fa-calendar-days fa-2x"></i>

                    </div>

                    <div class="Reservationblank3">
                        <div class="CampInfo">업체위치 : ${c.campAddress}<br>
                                              홈페이지 : ${c.campHomepage} <br>
                                              전화번호 : ${c.campNumber}</div>
                        <i class="fa-solid fa-location-dot fa-2x"></i>

                    </div>

                    <!-- 상세버튼
                    <div class="DetailButton" onclick="handleDetailButtonClick(this)">
                    <div class="DetailButtonText" onclick="handleDetailButtonClick(this)">상세보기</div>
                    </div>
                    -->
                    <!-- 캠프장 사진  -->
                    <div class="CampImgbox">
                        <img src="/assets/img/camping-img.jpg" alt="img">

                    </div>

                </wrap>








            </div>
        </div>

    </section>


    <!-- footer --------------------->
    <%@ include file="include/footer.jsp" %>


    <script>

        // 카카오페이 결제 클릭이벤트

        const $kakao = document.querySelector('.camp-title');

        $kakao.addEventListener('click', e => {

            if (e.target.matches('.camp-title')) {
                return;
            }

            // 카카오페이만 클릭되도록
            if (e.target.matches('img')) {
                
                location.href = "/jq/kakaopay";

            }
        })



        // function handleModifyButtonClick(element) {
        //     // 클릭된 버튼의 부모 요소를 찾아 수정 작업을 수행합니다.
        //     var parentElement = element.parentElement;

        //     // 여기에 원하는 수정 작업을 추가하세요.
        //     // 예를 들어, 콘솔에 메시지를 출력하거나 다른 동작을 수행할 수 있습니다.
        //     console.log("수정 버튼이 클릭되었습니다.");

        //     // 이벤트 전파를 중단합니다.
        //     event.stopPropagation();

        //     // 수정하기버튼 클릭 시 modifyinformation.jsp 페이지로 이동합니다.
        //     window.location.href = "modifyinformation.jsp";
        // }

        // function handleDetailButtonClick(element) {
        //     // 클릭된 버튼의 부모 요소를 찾아 상세 작업을 수행합니다.
        //     var parentElement = element.parentElement;

        //     // 여기에 원하는 상세 작업을 추가하세요.
        //     // 예를 들어, 콘솔에 메시지를 출력하거나 다른 동작을 수행할 수 있습니다.
        //     console.log("상세 버튼이 클릭되었습니다.");

        //     // 이벤트 전파를 중단합니다.
        //     event.stopPropagation();

        //     // 상세보기버튼 클릭 시 modify-information.html 페이지로 이동합니다.
        //     window.location.href = "";
        // }
    </script>


</body>

</html>