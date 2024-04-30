<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicon-16x16.png">
  <title>Review-Write</title>
  <%@ include file="include/static-head.jsp" %>

  <link rel="stylesheet" href="/assets/css/review-write.css">

</head>

<body>

  <%@ include file="include/header.jsp" %>

  <div class="review-wrapper">
    <form id="reviewForm" action="/main/review-write" method="post" enctype="multipart/form-data">
      <h1>Review⛺ / <span>등록</span></h1>
      <div class="star-rating">
        <input type="radio" id="5-stars" name="reviewPoint" value="5" />
        <label for="5-stars" class="star">&#9733;</label>
        <input type="radio" id="4-stars" name="reviewPoint" value="4" />
        <label for="4-stars" class="star">&#9733;</label>
        <input type="radio" id="3-stars" name="reviewPoint" value="3" />
        <label for="3-stars" class="star">&#9733;</label>
        <input type="radio" id="2-stars" name="reviewPoint" value="2" />
        <label for="2-stars" class="star">&#9733;</label>
        <input type="radio" id="1-stars" name="reviewPoint" value="1" />
        <label for="1-stars" class="stars">&#9733;</label>
      </div>
      <input type="hidden" name="starPoint" id="starPoint">

      <!-- <input type="text" id="review-title" placeholder="캠핑장 이름을 입력하세요."><br> -->
      <!-- <input type="text" id="review-content" name="reviewContent" placeholder="리뷰내용"> -->
      <textarea id="review-content" name="reviewContent" rows="4" cols="50" placeholder="리뷰내용" maxlength="300"></textarea>
    
      <div class="profile">
        <div class="thumbnail-box">
          <img src="/assets/img/no-image.png" alt="리뷰사진">
        </div>
        <input type="file" class="review-image" name="reviewImage" accept="image/*">
      </div>
      <div class="two-Btn">
        <button class="list-button">
          <svg class="btn-layer">
            <path
              d="M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z">
            </path>
          </svg>
          <svg class="plane">
            <use xlink:href="#plane"></use>
          </svg>
          <ul>
            <li>목록</li>
            <li>⛺</li>
            <button class="write-button" type="submit">
              <svg class="btn-layer">
                <path
                  d="M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z">
                </path>
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
          <path d="M133,77.5H7c-3.9,0-7-3.1-7-7v-41c0-3.9,3.1-7,7-7h126c3.9,0,7,3.1,7,7v41C140,74.4,136.9,77.5,133,77.5z">
          </path>
        </symbol>
        <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 26" id="plane" preserveAspectRatio="none">
          <path
            d="M5.25,15.24,18.42,3.88,7.82,17l0,4.28a.77.77,0,0,0,1.36.49l3-3.68,5.65,2.25a.76.76,0,0,0,1-.58L22,.89A.77.77,0,0,0,20.85.1L.38,11.88a.76.76,0,0,0,.09,1.36Z">
          </path>
        </symbol>
      </svg>
    </form>
  </div>

  <%@ include file="include/footer.jsp" %>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.4/gsap.min.js"></script>
  <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin3.min.js"></script>
  <script>
    // 버튼 애니메이션 효과 부분

    gsap.registerPlugin(MorphSVGPlugin);

    document.querySelectorAll('.button').forEach(element => {

      let path = element.querySelector('.btn-layer path'),
        tl = gsap.timeline();

      element.addEventListener('mouseover', e => {
        e.preventDefault();
        if (element.classList.contains('active')) {
          return;
        }
        element.classList.add('active');

        tl.to(path, {
          morphSVG: 'M136,77.5h-1H4.8H4c-2.2,0-4-1.8-4-4v-47c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0C44,22.5,66,10,66,10  s3,12.5,69.1,12.5c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47C140,75.7,138.2,77.5,136,77.5z',
          duration: .3,
          delay: .3
        }).
        to(path, {
          morphSVG: 'M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z',
          duration: 1.7,
          ease: 'elastic.out(1, .15)',
          onComplete() {
            element.classList.remove('active');
          }
        })
      })
    })

    document.querySelectorAll('.list-button').forEach(element => {

      let path = element.querySelector('.btn-layer path'),
        tl = gsap.timeline();

      element.addEventListener('mouseover', e => {
        e.preventDefault();
        if (element.classList.contains('active')) {
          return;
        }
        element.classList.add('active');

        tl.to(path, {
          morphSVG: 'M136,77.5h-1H4.8H4c-2.2,0-4-1.8-4-4v-47c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0C44,22.5,66,10,66,10  s3,12.5,69.1,12.5c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47C140,75.7,138.2,77.5,136,77.5z',
          duration: .3,
          delay: .3
        }).
        to(path, {
          morphSVG: 'M136,77.5c0,0-11.7,0-12,0c-90,0-94.2,0-94.2,0s-10.8,0-25.1,0c-0.2,0-0.8,0-0.8,0c-2.2,0-4-1.8-4-4v-47  c0-2.2,1.8-4,4-4c0,0,0.6,0,0.9,0c39.1,0,61.1,0,61.1,0s3,0,69.1,0c0.2,0,0.9,0,0.9,0c2.2,0,4,1.8,4,4v47  C140,75.7,138.2,77.5,136,77.5z',
          duration: 1.7,
          ease: 'elastic.out(1, .15)',
          onComplete() {
            element.classList.remove('active');
          }
        })
      })
    })

    // 입력창 막는 부분
    document.querySelector('.write-button').addEventListener('click', function (event) {
      var reviewContent = document.getElementById('review-content').value.trim();
      var reviewImage = document.querySelector('.review-image').files.length;
      var reviewPoint = document.querySelector('input[name="reviewPoint"]:checked');

      while (!reviewContent || !reviewImage || !reviewPoint) {
        alert('모든 항목을 입력해주세요.');
        event.preventDefault(); // 제출을 막습니다.
        break;
      }
    });


    // 파일 선택 부분
    const $fileInput = document.querySelector('.review-image');

    // 'thumbnail-box' 요소에서 'img' 요소를 선택합니다
    const $imgElement = document.querySelector('.thumbnail-box img');


    // 파일 선택 이벤트 리스너를 추가합니다
    $fileInput.addEventListener('change', function (event) {
      // 선택한 파일을 가져옵니다
      const file = event.target.files[0];

      // 파일이 존재할 경우
      if (file) {
        // FileReader 객체를 생성합니다
        const reader = new FileReader();

        // 파일을 읽을 때 발생하는 'load' 이벤트 리스너
        reader.onload = function (e) {
          // 읽은 파일의 데이터 URL을 가져옵니다
          const imageUrl = e.target.result;

          console.log(imageUrl);

          // 'thumbnail-box'의 'img' 요소의 'src' 속성을 읽은 이미지로 설정합니다
          $imgElement.setAttribute('src', imageUrl);
        };

        // 파일을 데이터 URL 형식으로 읽습니다
        reader.readAsDataURL(file);

      } else {
        // 파일이 선택되지 않았을 경우 처리할 수 있습니다
        console.log('파일이 선택되지 않았습니다.');
      }



    });

    // 리스트 버튼 클릭 후 다른 목록 페이지 이동
    const listButton = document.querySelector('.list-button');

    if (listButton) {

      listButton.addEventListener('click', function () {
        // 원하는 경로로 이동합니다.
        window.location.href = 'http://localhost:8181/main/review';
      });
    }

    const writeButton = document.querySelector('.write-button');

    if (writeButton) {

      writeButton.addEventListener('click', function () {
        // 원하는 경로로 이동합니다.
        window.location.href = 'redirect:/main/review';
      });
    }






    // HTML 폼에서 리뷰 포인트 값을 가져오는 함수
    function getReviewPoint() {
      const reviewPointInputs = document.getElementsByName("reviewPoint");
      let selectedValue = null;
      for (const input of reviewPointInputs) {
        if (input.checked) {
          selectedValue = input.value; // 선택된 값을 정수로 변환 == 우선 문자열로 바꾸는 내용 때문에 ParseInt 뗏습니다. 오류 나면 이쪽부분 보기
          break;
        }
      }
      return selectedValue;
    }


    document.getElementById('reviewForm').onsubmit = e => {
      e.preventDefault(); // submit 중지
      const reviewPoint = getReviewPoint();
      if (!reviewPoint) {
        console.error("리뷰 포인트를 선택하세요.");
        return;
      }

      document.getElementById('starPoint').value = reviewPoint;

      e.target.submit();

    }

    // 텍스트 리뷰내용 쪽 부분
    // <input> 요소
    var inputElement = document.getElementById("review-content");
    // <textarea> 요소
    var textareaElement = document.getElementById("review-textarea");

    // <input> 요소의 입력 내용이 변경될 때마다 호출되는 함수
    inputElement.addEventListener("input", function () {
      // <input> 요소의 입력 내용을 <textarea> 요소에 복사
      textareaElement.value = inputElement.value;
    });
  </script>






</body>

</html>