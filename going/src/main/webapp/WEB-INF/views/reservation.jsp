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
                        <img src="/assets/img/camp4.jpg" alt="캠핑"><br>
                        <ul class="camping">
                            <li class="camp-name">${b.campName}</li>
                            <li class="camp-address">${b.campAddress}</li>
                            <li class="camp-number">${b.campNumber}</li>
                            <li class="camp-homepage">${b.campHomepage}</li>
                            <li class="camp-price">${b.campPrice}</li>
                        </ul>

                        <div class="btn-group">
                            <button type="button" class="more-button"
                            data-href="/main/reservation-detail?camp_id=${b.campId}">MORE</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
            location.href='/main/reservation-detail/' + campId;

            }




        })

    </script>
    




    <%@ include file="include/footer.jsp" %>
</body>

</html>