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
                    <div class="review-box" data-bno="${b.reviewNo}">
                        <ul class="review">
                            <li class="rno">${b.reviewNo}</li>
                            <li class="camp-name">${b.campName}</li>
                            <li class="email">${b.email}</li>
                            <img src="/local${b.reviewImage}" alt="리뷰">
                            <li class="review-content">${b.reviewContent}</li>
                        </ul>
                        <button class="review-modify">수정</button>
                        <button class="review-delete" data-href="/main/review-delete?rno=${b.reviewNo}">삭제</button>
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
        const $goodButton = document.querySelectorAll('.bigBox .good-button');

        $goodButton.forEach(function (fingerbutton) {
            fingerbutton.addEventListener('click', function () {
                if (fingerbutton.textContent === '👍🏻') {
                    fingerbutton.textContent = '👍';
                } else {
                    fingerbutton.textContent = '👍🏻';
                }
            })
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
        

        // 삭제 버튼을 눌렀을때 리뷰 삭제 진행시키기
        

        const $btn = document.querySelector('.bigBox');

        $btn.addEventListener('click', e => {
            
            if (e.target.matches('.review-delete')) {
                // 리뷰 삭제 버튼을 클릭한 경우에만 실행
                const isConfirmed = confirm('정말로 삭제하시겠습니까?');

                if (isConfirmed) {
                    const reviewNo = e.target.closest('.review-box').dataset.bno;
                    console.log(reviewNo);
                    // 서버에 삭제 요청 보내기
                    location.href = '/main/review-delete?rno=' + reviewNo;
                }
            } if(e.target.matches('.review-modify')) {
                const reviewNo = e.target.closest('.review-box').dataset.bno;
                console.log(reviewNo);

                location.href = '/main/review-modify?rno=' + reviewNo;


            }
        });
    </script>




</body>

</html>