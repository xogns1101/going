<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>RESERVATION-상세보기</title>

    <%@ include file="include/static-head.jsp" %>

</head>

<body>

    <%@ include file="include/header.jsp" %>



    <section id="reservation-detail">

        <div class="detail">

            <div class="detail-title">
                <h1>⛺ ${r.campName}</h1>
                <hr>
            </div>

            <div class="detail-content1">
                <img src="/assets/img/camp1.jpg" alt="캠핑장 사진">
                <ul class="basic-info">
                    <li>기본정보</li>
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

            <div class="reserve-info">
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

                <form action="/jq/kakaopay" method="get">

                    <div class="reserve-box">
                        <div class="check">
                            <div class="in">입실</div>

                            <div class="reg-date">2024-04-22</div>

                            <div class="between">&nbsp; &nbsp; ~</div>
                        </div>



                        <div class="check">
                            <div class="out">퇴실</div>
                            <div class="reg-dates">2024-04-23</div>

                        </div>



                    </div>

                    <button type="submit" class="reserve-button">예약하기</button>
                </form>
            </div>
        </div>

    </section>

    <script>
        const $date = document.querySelector('.calendar-dates')

        let activeCount = 0;
        let firstClickedDate = ""; // 처음으로 클릭된 요소의 날짜를 저장하는 변수
        let lastClickedDate = ""; // 마지막으로 클릭된 요소의 날짜를 저장하는 변수

        const $regDate = document.querySelector('.reg-date');
        const $regDates = document.querySelector('.reg-dates');







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


            // 달력일자선택

            $date.addEventListener('click', e => {
                const clickedDate = e.target.textContent;

                // 클릭된 요소가 날짜인 경우에만 처리
                if (e.target.classList.contains('date')) {
                    console.log('클릭한 일자', clickedDate);

                    // 선택한 날짜가 활성화되어 있지 않은 경우
                    if (!e.target.classList.contains('active')) {
                        // 현재 선택한 일자를 활성화
                        e.target.classList.add('active');
                        activeCount++;

                        // 활성화된 일자가 2개 이상이면 선택한 일자 초기화
                        if (activeCount > 2) {
                            document.querySelectorAll('.date').forEach(date => {
                                date.classList.remove('active');
                            });
                            activeCount = 0;
                        }
                    } else {
                        // 선택한 일자를 비활성화
                        e.target.classList.remove('active');
                        activeCount--;
                    }

                    // 입실일 선택
                    if (activeCount === 1) {
                        firstClickedDate = clickedDate;
                        console.log('입실 날짜:', firstClickedDate);


                        // 년도와 월 변수 선언
                        let dayString = firstClickedDate
                        let monthString = (currentMonthIndex + 1).toString();

                        // 한 자리 숫자인 경우 앞에 0을 붙임
                        if (dayString.length === 1) {
                            dayString = '0' + dayString;
                        }
                        if (monthString.length === 1) {
                            monthString = '0' + monthString;
                        }


                        $regDate.textContent = currentYear + '-' + monthString + '-' + dayString;


                    }

                    // 퇴실일 선택
                    if (activeCount === 2) {
                        lastClickedDate = clickedDate;
                        console.log('퇴실 날짜:', lastClickedDate);

                        // 년도와 월 변수 선언
                        let dayString = lastClickedDate
                        let monthString = (currentMonthIndex + 1).toString();

                        // 한 자리 숫자인 경우 앞에 0을 붙임
                        if (dayString.length === 1) {
                            dayString = '0' + dayString;
                        }
                        if (monthString.length === 1) {
                            monthString = '0' + monthString;
                        }


                        $regDates.textContent = currentYear + '-' + monthString + '-' + dayString;


                    }

                }
            });
















        };
    </script>




    <%@ include file="include/footer.jsp" %>
</body>

</html>