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
                            <li class="rno">${b.reviewNo}</li>
                            <li class="camp-name">${b.campName}</li>
                            <li class="email">${b.email}</li>
                            <img src="#" alt="리뷰">
                            <li class="review-content">${b.reviewImage},${b.reviewContent}</li>
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

        <!-- 모달창 삭제버튼을 위한 버튼-->
        <div class="modal" id="modal">
            <div class="modal-content">
                <p>정말로 삭제할까요?</p>
                <div class="modal-buttons">
                    <button class="confirm" id="confirmDelete"><i class="fas fa-check"></i> 예</button>
                    <button class="cancel" id="cancelDelete"><i class="fas fa-times"></i> 아니오</button>
                </div>
            </div>
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
        const modifyButtons = document.querySelectorAll('.bigBox .review-modify');

        modifyButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                // 원하는 경로로 이동합니다.
                window.location.href = '/main/review-modify';
            });
        });

        // 삭제에 필요한 요소들 먼저 얻기
        const $deleteButton = document.querySelector('.review-delete');
        const $modal = document.getElementById('modal');
        const $confirmDelete = document.getElementById('confirmDelete'); 
        const $cancelDelete = document.getElementById('c ancelDelete');
        const $bigBox = document.querySelector('.bigBox');

        $bigBox.addEventListener('click', e => {
            if (e.target.mathces($bigBox)) return;

            if (e.target.mathces($deleteButton)) {
                console.log('삭제버튼');
                $modal.style.display = 'flex';
            
            }

        })

        /////////////////////////////////////////////// 삭제 코드
        // document.querySelectorAll('.review-delete').forEach(function (button) {
        //     button.addEventListener('click', function () {
        //         // 현재 삭제 버튼이 속한 review-box 요소를 찾습니다.
        //         const reviewBox = button.closest('.review-box');

        //         // 만약 review-box를 찾았다면 해당 요소를 삭제합니다.
        //         if (reviewBox) {
        //             reviewBox.remove(); // 요소 삭제

        //             // 여기에 새로운 게시물을 추가하는 코드를 작성합니다.
        //             const newReview = document.createElement('div');
        //             newReview.innerHTML = `
        //         <div class="review-box">
        //             <!-- 여기에 새로운 게시물의 내용을 추가합니다. -->
        //         </div>
        //     `;

        //             // 삭제된 요소의 다음 형제 요소로 새로운 게시물을 삽입합니다.
        //             reviewBox.parentNode.insertBefore(newReview.firstChild, reviewBox.nextSibling);
        //         }
        //     });
        // });
    
    
    
    
    </script>

    


</body>

</html>