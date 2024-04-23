
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>sign-up</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/sign-up2.css">

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

     <!-- sign-up ---------------------------------->
     <section>
             <div class="title">
                 <h1>SIGN-UP / <span>회원가입</span></h1>
             </div>

             <div class="signup-list">
                 <div class="signup-box">

                     <div class="plzId">아이디(이메일)을 입력해 주세요.</div>
                     <span id="idChk"></span></p>
                     <div class="Emailblank">
                         <input type="text" id="emailInput" placeholder="최대 30자">
                     </div>

                     <div class="plzPw">비밀번호를 입력해 주세요.</div>
                     <div class="Passwordblank">
                         <input type="password" id="passwordInput" placeholder="영문과 특수문자를 포함한 최소 8자">
                     </div>

                     <div class="plzPw2">비밀번호를 다시 입력해 주세요.</div>
                     <div class="Passwordblank2">
                         <input type="password" class="passwordInput2" placeholder="비밀번호가 일치해야 합니다.">
                     </div>

                     <div class="plzName">이름을 입력해 주세요.</div>
                     <div class="UserNameblank">
                         <input type="text" placeholder="한글로 최대 6자">
                     </div>

                     <div class="plzPhone">휴대폰 번호를 입력해 주세요.</div>
                     <div class="PhoneNumberblank">
                         <input type="phonenumber" placeholder="-을 포함하여 입력해 주세요">
                     </div>

                     <!-- 중복확인 -->
                     <div class="IdcheckButton">
                         <div class="Idcheck" onclick="handleClick()">중복확인</div>
                     </div>

                     <!-- 인증번호 받기 -->
                     <div class="ConfirmButton">
                         <div class="Confirm" onclick="handleVerificationCode()">인증번호 받기</div>
                     </div>

                     <!-- 회원가입 버튼 -->
                     <div class="JoinButton">
                         <div class="Join" onclick="handleJoin()">회원가입</div>
                     </div>

                 </div>
             </div>
         </section>


         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>

        <script>

            // 입력값 검증 통과 여부 배열
            const checkResultList = [false, false, false, false, false];

            // 이메일 검사 정규표현식
            const re = /\S+@\S+\.\S+/;

            // 아이디 입력값 검증
            const $emailInput = document.getElementById('emailInput');

            // 키를 눌렀다 떼는 순간 이벤트 발생
            $emailInput.onkeyup = e => {

            const idValue = $emailInput.value;
            // console.log(idValue);

            if (idValue.trim() === '') {
                alert('아이디를 입력해주세요.');
                checkResultList[0] = false;

            } else if (!re.test(idValue)) {
            // 정규표현식의 함수 test를 통해서 입력값이 패턴에 유효한지를 검증.
            // 패턴과 일치하는 입력값이면 true, 하나라도 어긋난다면 false.
                alert('이메일 형태로 입력해주세요.');
                checkResultList[0] = false;

            } else {
                    alert('올바른 아이디 입니다.');
                };
            }

            // 패스워드 검사 정규표현식
            const passwordPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

            // 패스워드 입력값 검증
            const $pwInput = document.getElementById('passwordInput');

            $pwInput.onkeyup = e => {
            const pwValue = $pwInput.value;
            if (pwValue.trim() === '') {
                alert('비밀번호는 필수 값 입니다.');
                checkResultList[1] = false;

            } else if (!passwordPattern.test(pwValue)) {
                alert('비밀번호는 특수 문자 포함 8자 이상입니다.');
                checkResultList[1] = false;

            } else {
                alert('사용 가능한 비밀번호 입니다.');
                checkResultList[1] = true;
            }
            };


                

         // 회원가입 처리
         const handleJoin = () => {
             const email = document.querySelector('emailInput').value;
             const password = document.querySelector('.passwordInput').value;
             const confirmPassword = document.querySelector('.passwordInput2').value;

             if (email === '') {
                 alert('아이디를 입력해주세요.');
                 return;
             }

             if (password !== confirmPassword) {
                 alert('비밀번호가 일치하지 않습니다.');
                 return;
             }

             // 회원가입 처리 로직...

             alert('회원가입이 완료되었습니다!');
         };

         // 이메일 중복 확인
         const handleClick = () => {
             const email = document.querySelector('.Emailblank input').value;

             if (email === '') {
                 alert('아이디를 입력해주세요.');
                 return;
             }

             if (email.length > 30) {
                 alert('아이디는 최대 30자까지 입력 가능합니다.');
                 return;
             }

             if (!validateEmail(email)) {
                 alert('유효한 이메일 주소를 입력해주세요.');
                 return;
             }

             if (isExistingId(email)) {
                 alert('이미 존재하는 아이디입니다.');
             } else {
                 alert('사용 가능한 아이디입니다.');
             }

             const password = document.querySelector('.Passwordblank input').value;

             if (!validatePassword(password)) {
                 alert('비밀번호에는 영문과 특수문자를 포함한 최소 8자 이상이 필요합니다.');
                 return;
             }

             const name = document.querySelector('.UserNameblank input').value;

             if (name.length > 6) {
                 alert('이름은 한글로 최대 6글자까지 입력 가능합니다.');
                 return;
             }
         };

         // 인증번호 받기
         const handleVerificationCode = () => {
             alert('인증번호가 전송되었습니다.');
         };

         // 이메일 유효성 검사
         const validateEmail = (email) => {
             const re = /\S+@\S+\.\S+/;
             return re.test(email);
         };

         // 비밀번호 유효성 검사
         const validatePassword = (password) => {
             const re = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*\d).{8,}$/;
             return re.test(password);
         };

         // 아이디 중복 확인 함수
         const isExistingId = (email) => {
             const existingIds = ['user1@example.com', 'user2@example.com', 'user3@example.com'];
             return existingIds.includes(email);
         };
         </script>



</body>
</html>

