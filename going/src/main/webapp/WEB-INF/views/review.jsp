<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>REVIEW</title>

    <link rel="stylesheet" href="../css/review.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="/header.jsp" %>

<section>


        <div class="title">
            <h1>REVIEW / <span>리뷰</span></h1>


            <button type="button" class="write-button">NEW <br> WRITE</button>
        </div>

 <c:forEach var="b" items="${review}">
             <div class="review-list">


                 <div class="review-box">
                     <ul class="review">
                         <li class="camp-name">${b.campName}</li>
                         <li class="email">${b.email}</li>

                         <img src="../img/camp2.jpg" alt="리뷰">

                         <li class="review-content">${b.reviewContent}</li>


                     </ul>


                         <button class="review-modify">수정</button>
                         <button class="review-delete">삭제</button>


                     <div class="good-button">👍🏻</div>
                     <!-- <div class="good-button">❤️</div> -->

                     <!-- <button type="button" class="good-button">🤍</button> -->



                 </div>
             </div>

         </c:forEach>




     </section>



     <footer>

         <div class="footer-wrap">
             <div class="footer-content">
                 <p>
                     상호 : YAGAJA &#124; 대표자명 : 홍길동 &#124; 사업자등록번호 : 123-12-1234 &#124; 주소 : 서울특별시 마포구 백범로 23, 3층 (신수동,
                     케이터틀)
                     &#124; 문의 : 02-123-1234
                 </p>
                 <br>

                 <p>이용약관 &#124; 개인정보처리방침</p>

             </div>


             <h3 class="footer-logo">Y⛺GAJA</h3>
         </div>


     </footer>



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


 </script>



<%@ include file="/footer.jsp" %>

 </body>

 </html>