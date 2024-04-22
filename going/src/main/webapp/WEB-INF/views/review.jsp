<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>REVIEW</title>
    <%@ include file="include/static-head.jsp" %>

</head>

<body>

    <%@ include file="include/header.jsp" %>


    <section>

        <div class="title">
            <h1>REVIEW / <span>리뷰</span></h1>
            <button type="button" class="write-button">NEW <br> WRITE</button>
        </div>


        <div class="bigBox">
            <c:forEach var="b" items="${rList}">


                <div class="review-list">
                    <div class="review-box">
                        <ul class="review">
                            <li class="camp-name">${b.campName}</li>
                            <li class="email">${b.email}</li>
                            <img src="#" alt="리뷰">
                            <li class="review-content">${b.reviewContent}</li>
                        </ul>
                        <button class="review-modify">수정</button>
                        <button class="review-delete">삭제</button>
                        <div class="good-button">👍🏻</div>
                        <!-- <div class="good-button">❤️</div> -->
                        <!-- <button type="button" class="good-button">🤍</button> -->
                        <div class="good-count">${b.reviewLike}</div>

                    </div>
                </div>



            </c:forEach>
        </div>

    </section>


    <%@ include file="include/footer.jsp" %>




    <script>
        // 하트를 눌렀을때 좋아요 up!
        const $goodButton = document.querySelector('.good-button');


        $goodButton.addEventListener('click', e => {


            if ($goodButton.textContent === '👍🏻') {
                $goodButton.textContent = '👍';
            } else {
                $goodButton.textContent = '👍🏻';
            }
        })


        // 리뷰 작성 버튼을 눌렀을때 리뷰 등록 페이지로 이동시키기
        const writeButton = document.querySelector('.write-button');

        if (writeButton) {

            writeButton.addEventListener('click', function () {
                // 원하는 경로로 이동합니다.
                window.location.href = '/main/review-write';
            });
        }

        // 리뷰 수정 버튼을 눌렀을때 리뷰 수정 페이지로 이동시키기
        const modifyButton = document.querySelector('.review-modify');

        if (modifyButton) {

            modifyButton.addEventListener('click', function () {
                // 원하는 경로로 이동합니다.
                window.location.href = '/main/review-modify';
            });
        }
    </script>




</body>

</html>