<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicon-16x16.png">
    <title>RESERVATION-상세보기</title>

    <%@ include file="include/static-head.jsp" %>

</head>

<body>

    <%@ include file="include/header.jsp" %>



    <section id="reservation-detail">


        <div class="detail">

            <div class="detail-title">
                <h1 name="campName">⛺ ${r.campName}</h1>
                <hr>
            </div>

            <div class="detail-content1">
                <img src="${r.image}" alt="캠핑장 사진">
                <ul class="basic-info">
                    <li>기본정보</li>
                    <li>가격: <span class="camp-price" name="campPrice">${r.campPrice}</span> 원</li>
                    <li>주소: <span class="camp-address">${r.campAddress}</span></li>
                    <li>전화번호: <span class="camp-number">${r.campNumber}</span></li>
                    <li>홈페이지: <span class="camp-homepage">${r.campHomepage}</span></li>
                </ul>
            </div>
            <hr>

            <div class="detail-content2">
                <h1>이용안내</h1>
                <ul class="use-info">
                    <li class="camp-hot-water">${r.campHotWater}</li>
                    <li class="camp-wifi">${r.campWifi}</li>
                    <li class="camp_firewood">${r.campFirewood}</li>
                    <li class="camp-mart">${r.campMart}</li>
                    <li class="camp-bed">${r.campBed}</li>
                    <li class="camp-ice-box">${r.campIceBox}</li>
                </ul>
            </div>


            <!-- - 캠핑장 전기      VARCHAR(50)         camp_electric
        - 캠핑장 온수      VARCHAR(50)         camp_hot_water
        - 캠핑장 와이파이    VARCAHR(50)         camp_wifi
        - 캠핑장 장작      VARCHAR(50)         camp_firewood
        - 캠핑장 마트      VARCHAR(50)         camp_mart
        - 캠핑장 침대      VARCHAR(50)         camp_bed
        - 캠핑장 냉장고      VARCHAR(50)         camp_ice_box
         -->


            <hr>

            <div class="reserve-info" data-campId="${r.campId}">
                <h1>예약하기</h1>


                <!-- ------------달력----------- -->



                <div class="calendar-container">
                    <div class="calendar-header">
                        <button id="prevBtn" class="btn"><span class="lnr lnr-chevron-left"></span> </button>
                        <h2 id="currentMonth"></h2>
                        <button id="nextBtn" class="btn"><span class="lnr lnr-chevron-right"></span></button>
                    </div>
                    <div class="calendar-days">
                        <div class="day">Sun</div>
                        <div class="day">Mon</div>
                        <div class="day">Tue</div>
                        <div class="day">Wed</div>
                        <div class="day">Thu</div>
                        <div class="day">Fri</div>
                        <div class="day">Sat</div>
                    </div>
                    <div class="calendar-dates" id="calendarDates"></div>
                </div>



                <!-- 예약 하기 -->


                <form action="/main/reservation-detail/${r.campId}" method="post">

                    <input type="hidden" name="name" id="name">
                    <input type="hidden" name="phoneNumber" id="phoneNumber">
                    <input type="hidden" name="email" id="email">
                    <input type="hidden" name="campName" id="campName" value="${r.campName}">
                    <input type="hidden" name="campAddress" id="campAddress" value="${r.campAddress}">
                    <input type="hidden" name="campHomepage" id="campHomepage" value="${r.campHomepage}">
                    <input type="hidden" name="campNumber" id="campNumber" value="${r.campNumber}">


                    <div class="reserve-box">
                        <div class="check">
                            <div class="in">입실</div>

                            <div>
                                <input type="date" class="reg-date" name="regDate">

                            </div>
                            <div class="between">&nbsp; &nbsp; ~</div>
                        </div>



                        <div class="check">
                            <div class="out">퇴실</div>

                            <input type="date" class="reg-dates" name="regDates">

                        </div>



                    </div>

                    <div class="hidden-info">
                        <div name="email">이메일</div>
                        <div name="name">이름</div>
                        <div name="phoneNumber">전화번호</div>
                    </div>

                    <button type="submit" class="reserve-button"
                        data-href="/main/reservation-detail?${b.campId}">예약하기</button>


                </form>


            </div>
        </div>

    </section>

    <script>
        window.onload = function () {


            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const currentMonth = document.getElementById('currentMonth');
            const calendarDates = document.getElementById('calendarDates');

            let today = new Date();
            let currentMonthIndex = today.getMonth();
            let currentYear = today.getFullYear();
            prevBtn.addEventListener('click', showPrevMonth);
            nextBtn.addEventListener('click', showNextMonth);
            showCalendar(currentYear, currentMonthIndex);

            function showCalendar(year, monthIndex) {
                currentMonth.textContent = `\${year}년  \${monthIndex + 1}월`;
                let firstDayOfMonth = new Date(year, monthIndex, 1).getDay();
                let lastDayOfMonth = new Date(year, monthIndex + 1, 0).getDate();
                let lastDayOfPrevMonth = new Date(year, monthIndex, 0).getDate();
                let dates = "";
                for (let i = firstDayOfMonth - 1; i >= 0; i--) {
                    dates += `<div class="date prev-date">\${lastDayOfPrevMonth - i}</div>`;
                }
                for (let i = 1; i <= lastDayOfMonth; i++) {
                    dates += `<div class="date">\${i}</div>`;
                }
                calendarDates.innerHTML = dates;
            }

            function showPrevMonth() {
                currentMonthIndex--;
                if (currentMonthIndex < 0) {
                    currentYear--;
                    currentMonthIndex = 11;
                }
                showCalendar(currentYear, currentMonthIndex);
                activeCount = 0;
            }

            function showNextMonth() {
                currentMonthIndex++;
                if (currentMonthIndex > 11) {
                    currentYear++;
                    currentMonthIndex = 0;
                }
                showCalendar(currentYear, currentMonthIndex);
                activeCount = 0;
            }





            // 예약하기 눌렀을때 값 전달하기
            const $reserveBtn = document.querySelector('.reserve-button');

            $reserveBtn.addEventListener('click', e => {

                const campId = e.target.dataset.campId;
                console.log('camp_id: ' + campId);
                const $campName = document.getElementById('campName');



                const confirmation = confirm('캠핑장: ' + $campName.value + '\n' + '예약 진행 하시겠습니까?');

                if (confirmation) {

                    alert('예약이 완료되었습니다!\n신나는 캠핑 즐기세요!');

                    location.href = `/main/reservation`;

                } else {

                    alert('예약이 취소되었습니다. \n다시 예약해주세요.');
                    e.preventDefault();
                    return false;
                }


            });


        }
    </script>




    <%@ include file="include/footer.jsp" %>
</body>

</html>