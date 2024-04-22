<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ModifyInformation</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/modify-information.css">

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

     <!-- modify-information ---------------------------------->
     <section>
        <div class="title">
                    <h1>회원정보 수정</h1>
                </div>

                <div class="signup-list">
                    <div class="signup-box">

                        <div class="plzId">이메일은 변경할 수 없습니다.</div>
                        <div class="Emailblank">
                            <input type="text" placeholder="${b.userName}" disabled>
                        </div>

                        <div class="plzPw">변경하실 비밀번호를 입력해 주세요.</div>
                        <div class="Passwordblank">
                            <input type="password" placeholder="영문과 특수문자를 포함한 최소 8자">
                        </div>

                        <div class="plzPw2">비밀번호를 다시 입력해 주세요.</div>
                        <div class="Passwordblank2">
                            <input type="password" placeholder="비밀번호가 일치해야 합니다.">
                        </div>

                        <div class="plzName">이름을 입력해 주세요.</div>
                        <div class="UserNameblank">
                            <input type="text" placeholder="한글로 최대 6자">
                        </div>

                        <div class="plzPhone">변경하실 휴대폰 번호를 입력해 주세요.</div>
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

                        <!-- 회원정보 수정 버튼 -->
                        <div class="ModifyButton">
                            <div class="Modify" onclick="handleModify()">수정완료</div>
                        </div>

                    </div>
                </div>

         </section>


         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>


         <script>
             // 회원가입 처리
                    function handleModify() {
                        var password = document.querySelector('.Passwordblank input').value;
                        var confirmPassword = document.querySelector('.Passwordblank2 input').value;

                        if (password !== confirmPassword) {
                            alert('비밀번호가 일치하지 않습니다.');
                            return;
                        }

                        // 회원정보 수정 처리 로직...

                        alert('회원정보가 수정되었습니다!');
                    }

              // 인증번호 발급
                     function handleVerificationCode() {
                         var phoneNumber = document.querySelector('.PhoneNumberblank input').value;

                         if (phoneNumber === '') {
                             alert('휴대폰 번호를 입력해주세요.');
                             return;
                         }

                         // 여기서 인증번호를 발급하는 로직을 수행합니다.
                         // 이 예시에서는 간단히 알림으로 대체합니다.
                         alert('인증번호가 전송되었습니다.');
                     }

                     // 이메일 유효성 검사
                     function validateEmail(email) {
                         var re = /\S+@\S+\.\S+/;
                         return re.test(email);
                     }

                     // 비밀번호 유효성 검사
                     function validatePassword(password) {
                         var re = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*\d).{8,}$/;
                         return re.test(password);
                     }


             </script>


</body>
</html>