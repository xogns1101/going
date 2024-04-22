<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>sign-in</title>

    <link rel="stylesheet" href="assets/css/sign-in2.css">

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

     <!-- sign-in ---------------------------------->
     <section>
             <div class="title">
                         <h1>LOG-IN / <span>로그인</span></h1>
                     </div>

                     <div class="signin-list">
                         <div class="signin-box">

                             <div class="plzId">아이디를 입력해 주세요.</div>
                             <div class="Emailblank">
                                 <input type="text" id="emailInput" placeholder="이메일을 입력해 주세요.">
                             </div>

                             <div class="plzPw">비밀번호를 입력해 주세요.</div>
                             <div class="Passwordblank">
                                 <input type="password" id="passwordInput" placeholder="최소 8자">
                             </div>

                             <!-- 자동로그인 -->
                             <div class="auto-login">
                                 <input type="checkbox" id="autoLogin">
                                 <label for="autoLogin">자동 로그인</label>
                             </div>

                             <!-- 로그인 버튼 -->
                             <div class="LoginButton">
                                 <div class="Login" onclick="handleLogin()">로그인</div>
                             </div>

                             <!-- 회원가입 버튼 -->
                             <div class="JoinButton">
                                 <a href="sign-up2.html" class="Join">회원가입</a>
                             </div>

                                    <a id="custom-login-btn"
                                        href="/kakao/login">
                                           <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
                                            width="300"/>
                                    </a>

                         </div>
                     </div>
         </section>


         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>


         <script>

function handleLogin() {
            // 입력된 이메일과 비밀번호 가져오기
            var email = document.getElementById('emailInput').value;
            var password = document.getElementById('passwordInput').value;

            // 로그인 검증 (임의로 예시로 이메일이 'test@test.com', 비밀번호가
            // 'password'일 때 로그인 성공으로 가정)
            if (email === 'test@test.com' && password === 'password') {
                alert('로그인 성공!');

                // 자동 로그인 처리
                if (document.getElementById('autoLogin').checked) {
                    // 여기에 자동 로그인 관련 처리 추가
                    alert('자동 로그인 설정됨');
                }

                // 여기에 로그인 성공 후 이동할 페이지 설정
                // window.location.href = '로그인 성공 후 이동할 페이지 URL';
            } else {
                alert('이메일 또는 비밀번호가 올바르지 않습니다.');
            }
        }

             </script>


</body>
</html>