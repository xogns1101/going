<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicon-16x16.png">
    <title>RESERVATION-관리자</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/reservation-admin.css">

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

    <!-- reservation-admin ---------------------------------->
    <section>
        <div class="title">
            <h1>RESERVATION / <span>예약현황</span></h1>
        </div>

        <div class="camp-list">
            <div class="camp-box">

                <table border="1">
                    <thead>
                        <tr class="column">
                            <th class="campId">번호</th>
                            <th class="campName">캠핑장 이름</th>
                            <th class="campEmail">회원 아이디</th>
                            <th class="campregDate">입실</th>
                            <th class="campregDates">퇴실</th>
                            <th class="campPrice">가격</th>
                            <th class="phoneNumber">휴대폰 번호</th>

                        </tr>
                    </thead>
                    <c:forEach var="b" items="${rList}">
                        <tbody>
                            <tr>
                                <td class="campId">${b.reservationNumber}</td>
                                <td class="campName">${b.campName}</td>
                                <td class="campEmail">${b.email}</td>
                                <td class="campregDate">${b.regDate}</td>
                                <td class="campregDates">${b.regDates}</td>
                                <td class="campPrice">${b.campPrice}</td>
                                <td class="phoneNumber">${b.phoneNumber}</td>
                            </tr>



                            <!-- 추가 행은 필요에 따라 추가하세요 -->
                        </tbody>
                    </c:forEach>
                </table>


                <!-- 검색어 조회 -->

                <!-- <form action="/main/reservation-list" method="get">
                    <div class="search-content-background">
                        <select class="form-select" name="type" id="search-type">
                            <option value="all">모두</option>
                            <option value="campName">캠핑장 이름</option>
                            <option value="userEmail">회원 아이디</option>
                        </select>
                        <input type="text" class="search-content" name="keyword" value="${s.keyword}"
                            placeholder="검색어를 입력해 주세요">
                        <button type="submit" class="search-click-button">검색</button>
                    </div>
                </form> -->


                <!-- ----------------------------------------------------------------------- -->
                <!-- 게시글 목록 하단 영역 -->
                <div class="bottom-section">
        
                    <!--페이징 부분-->
        
                    <div class="pageBox">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-lg pagination-custom">
                                <c:if test="${maker.page.pageNo != 1}">
                                    <li><a
                                            href="/main/reservation-list?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                                    </li>
                                </c:if>
                                <c:if test="${maker.prev}">
                                    <li class="prev"><a
                                            href="/main/reservation-list?pageNo=${maker.begin-1}&type=${s.type}&keyword=${s.keyword}">&lt;</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                                    <li data-page-num="${i}">
                                        <a
                                            href="/main/reservation-list?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${maker.next}">
                                    <li class="next"><a
                                            href="/main/reservation-list?pageNo=${maker.end+1}&type=${s.type}&keyword=${s.keyword}">&gt;</a>
                                    </li>
                                </c:if>
                                <c:if test="${maker.page.pageNo != maker.finalPage}">
                                    <li><a
                                            href="/main/reservation-list?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
        
        
        
                </div>

            </div>

        </div>






    </section>


    <!-- footer --------------------->
    <%@ include file="include/footer.jsp" %>


    <script>
        // 사용자가 현재 머물고 있는 페이지 버튼에 active 스타일 부여
        function appendPageActive() {

            // 현재 서버에서 넘겨준 페이지 번호
            const currPage = '${maker.page.pageNo}';

            // li 태그들을 전부 확인해서
            // 현재 페이지 번호와 일치하는 li를 찾은 후 active 클래스 이름 붙이기
            const $ul = document.querySelector('.pagination');
            const $liList = [...$ul.children];

            $liList.forEach($li => {
                if (currPage === $li.dataset.pageNum) {
                    $li.classList.add('active');
                }
            });
        }

        // 검색조건 셀렉트박스 옵션타입 고정하기
        function fixSearchOption() {
            const $select = document.getElementById('search-type');
            // 셀렉트 박스 내에 있는 option 태그들 전부 가져오기
            const $options = [...$select.children];

            $options.forEach($opt => {
                if ($opt.value === '${s.type}') {
                    // option 태그에 selected를 주면 그 option이 고정됨.
                    $opt.setAttribute('selected', 'selected');
                }
            });

        }

        appendPageActive();
        fixSearchOption();
    </script>


</body>

</html>