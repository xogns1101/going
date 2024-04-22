<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<%
    // 현재 날짜 정보 가져오기
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = dateFormat.format(currentDate);

    // 현재 년, 월 정보 가져오기
    Calendar calendar = Calendar.getInstance();
    int currentYear = calendar.get(Calendar.YEAR);
    int currentMonth = calendar.get(Calendar.MONTH) + 1;
%>

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


            <!-- - 캠핑장 전기		VARCHAR(50)			camp_electric
        - 캠핑장 온수		VARCHAR(50)			camp_hot_water
        - 캠핑장 와이파이 	VARCAHR(50)			camp_wifi
        - 캠핑장 장작		VARCHAR(50)			camp_firewood
        - 캠핑장 마트		VARCHAR(50)			camp_mart
        - 캠핑장 침대		VARCHAR(50)			camp_bed
        - 캠핑장 냉장고		VARCHAR(50)			camp_ice_box
         -->


            <hr>

            <div class="reserve-info">
                <h1>예약하기</h1>


                <!-- ------------달력----------- -->


                <div class="calendar-container">
                    <div class="calendar-header">
                        <button id="prevBtn" class="btn"><span class="lnr lnr-chevron-left"></span> </button>
                        <h2 id="currentMonth"><%= currentYear %>년 <%= currentMonth %>월</h2>
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
                    <div class="calendar-dates" id="calendarDates">
                        <%
                        // 달력 날짜 생성 및 출력
                        int firstDayOfMonth = calendar.get(Calendar.DAY_OF_WEEK) - 1;
                        int lastDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        
                        for (int i = 1; i <= firstDayOfMonth; i++) {
                            out.print("<div class='date prev-date'>" + (lastDayOfMonth - firstDayOfMonth + i) + "</div>");
                        }
                        for (int i = 1; i <= lastDayOfMonth; i++) {
                            out.print("<div class='date'>" + i + "</div>");
                        }
                    %></div>
                </div>



                <!-- 예약 하기 -->

                <form action="#">

                    <div class="reserve-box">
                        <div class="check">
                            <div class="in">입실</div>
                            <div class="reg-date">2024-01-11</div>
                            <div class="between">&nbsp; &nbsp; ~</div>
                        </div>



                        <div class="check">
                            <div class="out">퇴실</div>
                            <div class="reg-dates">2024-01-12 <span class="#">( 1</span>박 )</div>

                        </div>
                    </div>

                    <button type="submit" class="reserve-button">예약하기</button>
                </form>
            </div>
        </div>

    </section>

    <script>
        const $date = document.querySelectorAll('.date');
     
        // 이전/다음 달 이동 기능 구현
        const prevBtn = document.getElementById('prevBtn');
        const nextBtn = document.getElementById('nextBtn');
        const currentMonth = document.getElementById("currentMonth");
        const calendarDates = document.getElementById("calendarDates");


        // 현재 날짜 정보 가져오기
        let currentDate = new Date();
        let currentYear = currentDate.getFullYear();
        let currentMonthIndex = currentDate.getMonth(); // 0부터 시작하는 인덱스
        let currentDay = currentDate.getDate();

        prevBtn.addEventListener('click', showPrevMonth);
        nextBtn.addEventListener('click', showNextMonth);

        function showPrevMonth() {
            currentMonthIndex--;
        if (currentMonthIndex < 0) {
            currentYear--;
            currentMonthIndex = 11; // 12월
      }
        showCalendar(currentYear, currentMonthIndex);
    }
        

        function showNextMonth() {
            currentMonthIndex++;
        if (currentMonthIndex > 11) {
            currentYear++;
            currentMonthIndex = 0; // 1월
        }
        showCalendar(currentYear, currentMonthIndex);
        }

        function showCalendar(year, monthIndex) {
        // 달력 헤더에 현재 년도와 월 표시
        currentMonth.textContent = `${year}년 ${monthIndex + 1}월`; // monthIndex는 0부터 시작하므로 +1

        
        showCalendar(year, monthIndex); 
    }




        // 달력일자선택


        $date.addEventListener('click', e => {
            const clickedDate = e.target.textContent;
            if (e.target.classList.contains('date')) {
                // 클릭된 요소가 date 클래스를 포함하는 경우에만 처리
                console.log('클릭한 일자', clickedDate);
            }

            // class 속성이 없으면 추가, 있으면 수정
            if (!e.target.classList.contains('active')) {


                if (activeCount < 2) {
                    e.target.classList.add('active');
                    activeCount++;
                }

            } else {
                e.target.classList.remove('active');
                activeCount--;
            };

            // 클릭된 요소의 날짜 추적
            if (e.target.classList.contains('active')) {
                if (firstClickedDate === "") {
                    firstClickedDate = clickedDate;
                    console.log('입실날짜', firstClickedDate);
                    return;
                } else {
                    lastClickedDate = clickedDate;
                    console.log('퇴실날짜', lastClickedDate);
                }
            }



        });
    </script>




<%@ include file="include/footer.jsp" %>
</body>

</html>