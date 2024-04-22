<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>reservation-admin</title>

    <link rel="stylesheet" href="assets/css/reservation-admin2.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">

         <script src="https://kit.fontawesome.com/89a0fea006.js" crossorigin="anonymous"></script>

            <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>

     <!-- header -------------------------------- -->
            <%@ include file="include/header.jsp" %>

     <!-- reservation-admin ---------------------------------->
     <section>
             <div class="title">
                        <h1>RESERVATION / <span>예약현황</span></h1>
                    </div>

                        <div class="camp-list">
                            <div class="camp-box">
                                <c:forEach var="b" items="${nList}">
                                <table border="1">
                                    <thead>
                                        <tr class="column">
                                            <th class="campId">캠핑장 아이디</th>
                                            <th class="campName">캠핑장 이름</th>
                                            <th class="campEmail">회원 아이디</th>
                                            <th class="campregDate">입실</th>
                                            <th class="campregDates">퇴실</th>
                                            <th class="campPrice">가격</th>
                                            <th class="phoneNumber">휴대폰 번호</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="campId">${b.campId}</td>
                                            <td class="campName">${b.campName}</td>
                                            <td class="campEmail">${b.email}</td>
                                            <td class="campregDate">${b.regDate}</td>
                                            <td class="campregDates">${b.regDates}</td>
                                            <td class="campPrice">${b.campPrice}</td>
                                            <td class="phoneNumber">${b.phoneNumber}</td>

                                        </tr>


                                        <!-- 추가 행은 필요에 따라 추가하세요 -->


                                    </tbody>
                                </table>
                                </c:forEach>

                                <!-- 전체기간 조회 -->
                                <!-- <div class="total-date-wrapper">
                                    <div class="total-date-background"></div>
                                    <input type="checkbox" class="total-date-click-button" onclick="handleTotalDateClick(this)">
                                    <div class="total-date">전체기간</div>
                                </div> -->

                                <!-- 제목 조회 -->
                                <!-- <div class="title-wrapper">
                                    <div class="only-title-background"></div>
                                    <input type="checkbox" class="only-title-click-button" onclick="handleOnlyTitleClick(this)">
                                    <div class="only-title">제목만</div>
                                </div>
                                 -->


                                <!-- 검색어 조회 -->
                                <!-- <div class="search-wrapper">
                                    <div class="search-content-background"></div>
                                    <input type="text" class="search-content" placeholder="검색어를 입력해 주세요">
                                    <button class="search-click-button" onclick="handleSearchClick()">검색</button>
                                </div> -->

                                <!-- 페이지 사이즈 체크 -->
                                <!-- <div class="page-size-wrapper">
                                    <div class="page-size-background"></div>
                                    <div class="page-size">8개씩</div>
                                    <input type="checkbox" class="page-size-click-button" onclick="handlePageSizeClick(this)">
                                </div> -->

                            </div>
                        </div>

         </section>


         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>


         <script>



             </script>


</body>
</html>