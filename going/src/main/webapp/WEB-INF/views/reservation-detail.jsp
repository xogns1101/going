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
        
                        <div class="wrapper">
        
                            <div class="nav">
                                <button class="material-icons"> <span class="lnr lnr-chevron-left"></span> </button>
                                <p class="current-date">1월</p>
                                <button class="material-icons"> <span class="lnr lnr-chevron-right"></span></span>
                            </div>
        
                            <div class="calendar">
                                <ul class="weeks">
                                    <li>Sun</li>
                                    <li>Mon</li>
                                    <li>Tue</li>
                                    <li>Wed</li>
                                    <li>Thu</li>
                                    <li>Fri</li>
                                    <li>Sat</li>
                                </ul>
                                <ul class="days">
                                    <li class="inactive">27</li>
                                    <li class="inactive">28</li>
                                    <li class="inactive">29</li>
                                    <li class="inactive">30</li>
                                    <li>1</li>
                                    <li>2</li>
                                    <li>3</li>
                                    <li>4</li>
                                    <li>5</li>
                                    <li>6</li>
                                    <li>7</li>
                                    <li>8</li>
                                    <li>9</li>
                                    <li>10</li>
                                    <li>11</li>
                                    <li>12</li>
                                    <li>13</li>
                                    <li>14</li>
                                    <li>15</li>
                                    <li>16</li>
                                    <li>17</li>
                                    <li>18</li>
                                    <li>19</li>
                                    <li>20</li>
                                    <li>21</li>
                                    <li>22</li>
                                    <li>23</li>
                                    <li>24</li>
                                    <li>25</li>
                                    <li>26</li>
                                    <li>27</li>
                                    <li>28</li>
                                    <li>29</li>
                                    <li>30</li>
                                    <li>31</li>
                                </ul>
                            </div>
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
    


<%@ include file="include/footer.jsp" %>





 <script>
        // 요소 선택
        const $liList = document.querySelectorAll('ul.days li');
        let activeCount = 0;
        let firstClickedIndex = 0; // 처음으로 클릭된 요소의 index를 저장하는 변수
        let lastClickedIndex = 0; // 마지막으로 클릭된 요소의 index를 저장하는 변수


        $liList.forEach($li => {
            $li.addEventListener('click', e => {

                // console.log('li에 클릭이벤트 발생! ');

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


            });

        });





    </script>
    
</body>
</html>