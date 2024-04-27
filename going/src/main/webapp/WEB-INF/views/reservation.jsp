<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>RESERVATION</title>
    <%@ include file="include/static-head.jsp" %>
</head>

<body>
    <%@ include file="include/header.jsp" %>


    <section>


        <div class="title">
            <h1>RESERVATION / <span>예약</span></h1>
        </div>


        <div class="camping">
            <c:forEach var="b" items="${camp}">

                <div class="camping-list">
                    <div class="camping-box" data-bno="${b.campId}">
                        <img src="${b.campImage}" alt="캠핑"><br>
                        <ul class="camping">
                            <li class="camp-name">${b.campName}</li>
                            <li class="camp-address">${b.campAddress}</li>
                            <li class="camp-number">${b.campNumber}</li>
                            <li class="camp-homepage">${b.campHomepage}</li>
                            <li class="camp-price">${b.campPrice}</li>
                        </ul>

                        <div class="reserve-more">예약? 👇</div>
                        <div class="btn-group">
                            <button type="button" class="more-button"
                                data-href="/main/reservation-detail?camp_id=${b.campId}">MORE</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 검색어 조회 -->

        <form action="/main/reservation" method="get">
            <div class="search-content-background">
                <select class="form-select" name="type" id="search-type">
                    <option value="name">캠핑장 이름</option>
                    <option value="address">주소</option>
                </select>
                <input type="text" class="search-content" name="keyword" value="${s.keyword}"
                    placeholder="검색어를 입력해 주세요">
                <button type="submit" class="search-click-button">검색</button>
            </div>
        </form>


        <!--페이징 부분-->

        <div class="pageBox">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-lg pagination-custom">
                    <c:if test="${maker.page.pageNo != 1}">
                        <li><a
                                href="/main/reservation?pageNo=1&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                        </li>
                    </c:if>
                    <c:if test="${maker.prev}">
                        <li><a
                                href="/main/reservation?pageNo=${maker.begin-1}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">prev</a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                        <li data-page-num="${i}">
                            <a
                                href="/main/reservation?pageNo=${i}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${maker.next}">
                        <li><a
                                href="/main/reservation?pageNo=${maker.end+1}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">next</a>
                        </li>
                    </c:if>
                    <c:if test="${maker.page.pageNo != maker.finalPage}">
                        <li><a
                                href="/main/reservation?pageNo=${maker.finalPage}&amount=${s.amount}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>


    </section>

    <script>
        const $btn = document.querySelector('.camping');

        $btn.addEventListener('click', e => {

            console.log('이벤트 타겟: ', e.target);

            if (e.target.matches('.camping')) return;

            if (e.target.matches('.btn-group *')) {
                console.log('more 버튼 클릭됨');


                const campId = e.target.closest('.camping-box').dataset.bno;
                console.log('camp_id: ' + campId);

                // 서버에 요청 보내기
                location.href = '/main/reservation-detail/' + campId;

            }




        })


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

        fixSearchOption();
        appendPageActive();
    </script>





    <%@ include file="include/footer.jsp" %>
</body>

</html>