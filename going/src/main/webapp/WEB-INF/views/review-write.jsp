<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Review-Write</title>


    <%@ include file="include/static-head.jsp" %>






</head>
<body>

    <form action="#" method="get" enctype="multipart/form-data">

        <h1>Review⛺ / 등록</h1>

        <div class="modal-detail">
            <input type="text" id="review-title" placeholder="캠핑장 이름을 입력하세요."><br>
            <input type="text" id="review-content" placeholder="리뷰내용">
        </div>

        <div class="profile">

            <div class="thumbnail-box">
                <img src="/assets/img/camp3.jpg" alt="리뷰사진">
            </div>


            <input type="file" id="review-image" accept="image/*">
        </div>

        <div class="two-Btn">
          <button class="list-button">
            <svg class="btn-layer">
              <path d="M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z"></path>
            </svg>
            <svg class="plane">
              <use xlink:href="#plane"></use>
            </svg>
            <ul>
              <li>목록</li>
              <li>⛺</li>

          <button class="button">
            <svg class="btn-layer">
              <path d="M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z"></path>
            </svg>
            <svg class="plane">
              <use xlink:href="#plane"></use>
            </svg>
            <ul>
              <li>등록</li>
              <li>⛺</li>
            </ul>
          </button>
        </div>


        <!-- SVG -->
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 140 100" id="btn-layer" preserveAspectRatio="none">
            <path d="M133,77.5H7c-3.9,0-7-3.1-7-7v-41c0-3.9,3.1-7,7-7h126c3.9,0,7,3.1,7,7v41C140,74.4,136.9,77.5,133,77.5z"></path>
          </symbol>
          <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 26" id="plane" preserveAspectRatio="none">
            <path d="M5.25,15.24,18.42,3.88,7.82,17l0,4.28a.77.77,0,0,0,1.36.49l3-3.68,5.65,2.25a.76.76,0,0,0,1-.58L22,.89A.77.77,0,0,0,20.85.1L.38,11.88a.76.76,0,0,0,.09,1.36Z"></path>
          </symbol>
        </svg>


          <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.4/gsap.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin3.min.js"></script>
    <script>
       // 버튼 애니메이션 효과 부분

      gsap.registerPlugin(MorphSVGPlugin);

      document.querySelectorAll('.button').forEach(element => {

        let path = element.querySelector('.btn-layer path'),
        tl = gsap.timeline();

        element.addEventListener('click', e => {
          e.preventDefault();
          if (element.classList.contains('active')) {
            return;
          }
          element.classList.add('active');

          tl.to(path, {
            morphSVG: 'M136,77.5h-1H4.8H4c-2.2,0-4-1.8-4-4v-47c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0C44,22.5,66,10,66,10  s3,12.5,69.1,12.5c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47C140,75.7,138.2,77.5,136,77.5z',
            duration: .3,
            delay: .3 }).
          to(path, {
            morphSVG: 'M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z',
            duration: 1.7,
            ease: 'elastic.out(1, .15)',
            onComplete() {
              element.classList.remove('active');
            } })
        })
      })

      document.querySelectorAll('.list-button').forEach(element => {

      let path = element.querySelector('.btn-layer path'),
      tl = gsap.timeline();

      element.addEventListener('click', e => {
        e.preventDefault();
        if (element.classList.contains('active')) {
          return;
        }
        element.classList.add('active');

        tl.to(path, {
          morphSVG: 'M136,77.5h-1H4.8H4c-2.2,0-4-1.8-4-4v-47c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0C44,22.5,66,10,66,10  s3,12.5,69.1,12.5c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47C140,75.7,138.2,77.5,136,77.5z',
          duration: .3,
          delay: .3 }).
        to(path, {
          morphSVG: 'M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z',
          duration: 1.7,
          ease: 'elastic.out(1, .15)',
          onComplete() {
            element.classList.remove('active');
          } })
      })
    })


      // 파일 선택 부분


     // 'thumbnail-box' 요소에서 'img' 요소를 선택합니다
    const imgElement = document.querySelector('.thumbnail-box img');

    // 파일 선택 입력 요소를 선택합니다
    const fileInput = document.getElementById('review-image');

    // 파일 선택 이벤트 리스너를 추가합니다
    fileInput.addEventListener('change', function(event) {
        // 선택한 파일을 가져옵니다
        const file = event.target.files[0];

        // 파일이 존재할 경우
        if (file) {
            // FileReader 객체를 생성합니다
            const reader = new FileReader();

            // 파일을 읽을 때 발생하는 'load' 이벤트 리스너
            reader.onload = function(e) {
                // 읽은 파일의 데이터 URL을 가져옵니다
                const imageUrl = e.target.result;

                // 'thumbnail-box'의 'img' 요소의 'src' 속성을 읽은 이미지로 설정합니다
                imgElement.src = imageUrl;
            };

            // 파일을 데이터 URL 형식으로 읽습니다
            reader.readAsDataURL(file);
        } else {
            // 파일이 선택되지 않았을 경우 처리할 수 있습니다
            console.l+og('파일이 선택되지 않았습니다.');
        }
    });




      </script>


    </form>



</body>
</html>