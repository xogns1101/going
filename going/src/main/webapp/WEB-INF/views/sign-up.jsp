
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

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  		
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  		


</head>

<body>
     <!-- header -------------------------------- -->
            <%@ include file="include/header.jsp" %>

     <!-- sign-up ---------------------------------->
     <!-- <section>
             <div class="title">
                 <h1>SIGN-UP / <span>회원가입</span></h1>
             </div>

             <form action="/user/sign-up" name="signup" id="signUpForm" method="post">

       
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
                         <input type="password" id="passwordCheck" class="passwordInput2" placeholder="비밀번호가 일치해야 합니다.">
                     </div>

                     <div class="plzName">이름을 입력해 주세요.</div>
                     <div class="UserNameblank">
                         <input type="text" id="nameInput" placeholder="한글로 최대 6자">
                     </div>

                     <div class="plzPhone">휴대폰 번호를 입력해 주세요.</div>
                     <div class="PhoneNumberblank">
                         <input type="phonenumber" id="phoneNumberInput"  placeholder="-을 포함하여 입력해 주세요">
                     </div>

                     중복확인 -->
                     <!--
                     <div class="IdcheckButton">
                         <div class="Idcheck" onclick="handleClick()">중복확인</div>
                     </div>
                    
                        인증번호 받기 -->
                        <!--
                     <div class="ConfirmButton">
                         <div class="Confirm" onclick="handleVerificationCode()">인증번호 받기</div>
                     </div>
        -->
                     <!-- 회원가입 버튼 
                     <div class="JoinButton">
                         <div id="signup-btn" onclick="handleJoin()">회원가입</div>
                     </div>
            </form>
                 </div>
             </div>
         </section>
        -->

        <div class="signup-list">
            <div class="signup-box mt-5">

        <form action="/user/sign-up" name="signup" id="signUpForm" method="post" style="margin-bottom: 0;">

    <table style="cellspacing: 0; margin: 0 auto; width: 100%">
        <tr>
            <td style="text-align: left">
              <p><strong style="margin-left: 640px;" class="mt-3">이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
                <span id="emailChk"></span></p>
            </td>
          </tr>
          <tr>
            <td><input type="text" name="email" id="emailInput" class="form-control tooltipstered mt-5 col-4" maxlength="20"
                required="required" aria-required="true"
                style="margin-bottom: 25px; margin-left: 640px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                placeholder="abc1234@naver.com">
            </td>

          </tr>

      <tr>
        <td style="text-align: left">
          <p><strong style="margin-left: 640px;">비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="password" size="17" maxlength="20" id="password" name="password"
            class="form-control tooltipstered col-4" maxlength="20" required="required" aria-required="true"
            style="ime-mode: inactive; margin-left: 640px; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
            placeholder="영문과 특수문자를 포함한 최소 8자"></td>
      </tr>
      <tr>
        <td style="text-align: left">
          <p><strong style="margin-left: 640px;">비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
          </p>
        </td>
      </tr>
      <tr>
        <td><input type="password" size="17" maxlength="20" id="password_check" name="pw_check"
            class="form-control tooltipstered col-4" maxlength="20" required="required" aria-required="true"
            style="ime-mode: inactive; margin-bottom: 25px; margin-left: 640px; height: 40px; border: 1px solid #d9d9de"
            placeholder="비밀번호가 일치해야합니다."></td>
      </tr>

      <tr>
        <td>
          <p><strong style="margin-left: 640px;">이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="text" name="name" id="user_name" class="form-control tooltipstered col-4" maxlength="6"
            required="required" aria-required="true"
            style="margin-bottom: 25px; width: 100%; margin-left: 640px; height: 40px; border: 1px solid #d9d9de"
            placeholder="한글로 최대 6자"></td>
      </tr>

      <tr>
        <td style="text-align: left">
          <p><strong style="margin-left: 640px;">휴대폰 번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="phoneNumberChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="text" name="phoneNumber" id="user_phone" class="form-control tooltipstered col-4"
            required="required" aria-required="true"
            style="margin-bottom: 25px; width: 100%; margin-left: 640px; height: 40px; border: 1px solid #d9d9de"
            placeholder="010-1234-5678"></td>
      </tr>


      <tr>
        <td style="width: 100%; text-align: center; colspan: 2;">
          <input type="button" value="회원가입" class="btn form-control tooltipstered col-4" id="signup-btn"
            style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
        </td>
      </tr>

    </table>
  </form>
</div>
</div>



         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>

        <script>

            // 입력값 검증 통과 여부 배열
            const checkResultList = [false, false, false, false, false];

            // 이메일 검사 정규표현식
            const emailPattern = /\S+@\S+\.\S+/;

            // 아이디 입력값 검증
            const $emailInput = document.getElementById('emailInput');

            // 키를 눌렀다 떼는 순간 이벤트 발생
            $emailInput.onkeyup = e => {

                const emailInput = $emailInput.value;
                // console.log(idValue);

                if (emailInput.trim() === '') {
                $emailInput.style.borderColor = 'red';
                document.getElementById('emailChk').innerHTML = '<b style="color: red;">[이메일은 필수값입니다!]</b>';
                checkResultList[0] = false;

                } else if (!emailPattern.test(emailInput)) {
                // 정규표현식의 함수 test를 통해서 입력값이 패턴에 유효한지를 검증.
                // 패턴과 일치하는 입력값이면 true, 하나라도 어긋난다면 false.
                $emailInput.style.borderColor = 'red';
                document.getElementById('emailChk').innerHTML = '<b style="color: red;">[아이디는 4~14글자의 영문,숫자로 입력하세요!]</b>';
                checkResultList[0] = false;

                } else {
                // 비동기 요청으로 아이디 중복 확인 진행
                fetch('/user/check/email/' + emailInput)
                    .then(res => res.json())
                    .then(flag => {
                    if (flag) { // 중복
                        $emailInput.style.borderColor = 'red';
                        document.getElementById('emailChk').innerHTML = '<b style="color: red;">[이메일이 중복되었습니다.]</b>';
                        checkResultList[0] = false;
                    
                    } else {
                        $emailInput.style.borderColor = 'skyblue';
                        document.getElementById('emailChk').innerHTML = '<b style="color: skyblue;">[사용 가능한 이메일입니다.]</b>';
                        checkResultList[0] = true;
                    }
                    });
                }
            }

             // 패스워드 검사 정규표현식
            const passwordPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

            // 패스워드 입력값 검증
            const $pwInput = document.getElementById('password');

            $pwInput.onkeyup = e => {

                const pwValue = $pwInput.value;
                if (pwValue.trim() === '') {
                    $pwInput.style.borderColor = 'red';
                    document.getElementById('pwChk').innerHTML = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
                    checkResultList[1] = false;

                } else if (!passwordPattern.test(pwValue)) {
                    $pwInput.style.borderColor = 'red';
                    document.getElementById('pwChk').innerHTML = '<b style="color: red;">[특수문자 포함 8자 이상!]</b>';
                    checkResultList[1] = false;

                } else {
                    $pwInput.style.borderColor = 'skyblue';
                    document.getElementById('pwChk').innerHTML = '<b style="color: skyblue;">[사용가능한 비밀번호입니다.]</b>';
                    checkResultList[1] = true;
                }

        };


        // 패스워드 확인란 입력값 검증
        const $pwCheckInput = document.getElementById('password_check');
            $pwCheckInput.onkeyup = e => {
            const pwCheckValue = $pwCheckInput.value;
            if (pwCheckValue.trim() === '') {
                $pwCheckInput.style.borderColor = 'red';
                document.getElementById('pwChk2').innerHTML = '<b style="color: red;">[비밀번호 확인란은 필수값입니다!]</b>';
                checkResultList[2] = false;

            } else if ($pwCheckInput.value !== $pwInput.value) {
                $pwCheckInput.style.borderColor = 'red';
                document.getElementById('pwChk2').innerHTML = '<b style="color: red;">[비밀번호가 다릅니다.]</b>';
                checkResultList[2] = false;

            } else {
                $pwCheckInput.style.borderColor = 'skyblue';
                document.getElementById('pwChk2').innerHTML = '<b style="color: skyblue;">[비밀번호가 일치 합니다.]</b>';
                checkResultList[2] = true;
            }
            };


            // 이름 검사 정규표현식
            const namePattern = /^[가-힣]+$/;

            // 이름 입력값 검증
            const $nameInput = document.getElementById('user_name');

            $nameInput.onkeyup = e => {

                const nameValue = $nameInput.value;

                if (nameValue.trim() === '') {
                    $nameInput.style.borderColor = 'red';
                    document.getElementById('nameChk').innerHTML = '<b style="color: red;">[이름은 필수 정보 입니다.!]</b>';
                    checkResultList[3] = false;

                } else if (!namePattern.test(nameValue)) {
                    $nameInput.style.borderColor = 'red';
                    document.getElementById('nameChk').innerHTML = '<b style="color: red;">[이름은 한글로 작성해 주세요.]</b>';
                    checkResultList[3] = false;

                } else {
                    $nameInput.style.borderColor = 'skyblue';
                    document.getElementById('nameChk').innerHTML = '<b style="color: skyblue;">[사용가능한 이름입니다.]</b>';
                    checkResultList[3] = true;
                }

            };

             // 휴대폰 검사 정규표현식
            const phoneNumberPattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

            // 휴대폰 번호 검증
            const $userPhone = document.getElementById('user_phone');

            $userPhone.onkeyup = e => {

            const userPhone = $userPhone.value;

            if (userPhone.trim() === '') {
                $userPhone.style.borderColor = 'red';
                document.getElementById('phoneNumberChk').innerHTML = '<b style="color: red;">[휴대폰 번호는 필수 정보 입니다.!]</b>';
                checkResultList[4] = false;

            } else if (!phoneNumberPattern.test(userPhone)) {
                $userPhone.style.borderColor = 'red';
                document.getElementById('phoneNumberChk').innerHTML = '<b style="color: red;">[올바른 휴대폰 번호를 작성해 주세요.]</b>';
                checkResultList[4] = false;

            } else {
                $userPhone.style.borderColor = 'skyblue';
                document.getElementById('phoneNumberChk').innerHTML = '<b style="color: skyblue;">[사용가능한 휴대번호 입니다.]</b>';
                checkResultList[4] = true;
            }

            };



            // 회원가입 버튼 클릭 이벤트
            document.getElementById('signup-btn').onclick = e => {

            // 5개의 입력칸이 모두 통과되었을 경우 폼을 서브밋.
            const $form = document.getElementById('signUpForm');

            if (checkResultList.includes(false)) {
            alert('입력란을 다시 확인하세요!');
            } else {
            $form.submit();
            }

            } 

        //  // 회원가입 처리
        //  const handleJoin = () => {
        //      const email = document.querySelector('emailInput').value;
        //      const password = document.querySelector('.passwordInput').value;
        //      const confirmPassword = document.querySelector('.passwordInput2').value;

        //      if (email === '') {
        //          alert('아이디를 입력해주세요.');
        //          return;
        //      }

        //      if (password !== confirmPassword) {
        //          alert('비밀번호가 일치하지 않습니다.');
        //          return;
        //      }

        //      // 회원가입 처리 로직...

        //      alert('회원가입이 완료되었습니다!');
        //  };

        //  // 이메일 중복 확인
        //  const handleClick = () => {
        //      const email = document.querySelector('.Emailblank input').value;

        //      if (email === '') {
        //          alert('아이디를 입력해주세요.');
        //          return;
        //      }

        //      if (email.length > 30) {
        //          alert('아이디는 최대 30자까지 입력 가능합니다.');
        //          return;
        //      }

        //      if (!validateEmail(email)) {
        //          alert('유효한 이메일 주소를 입력해주세요.');
        //          return;
        //      }

        //      if (isExistingId(email)) {
        //          alert('이미 존재하는 아이디입니다.');
        //      } else {
        //          alert('사용 가능한 아이디입니다.');
        //      }

        //      const password = document.querySelector('.Passwordblank input').value;

        //      if (!validatePassword(password)) {
        //          alert('비밀번호에는 영문과 특수문자를 포함한 최소 8자 이상이 필요합니다.');
        //          return;
        //      }

        //      const name = document.querySelector('.UserNameblank input').value;

        //      if (name.length > 6) {
        //          alert('이름은 한글로 최대 6글자까지 입력 가능합니다.');
        //          return;
        //      }
        //  };

        //  // 인증번호 받기
        //  const handleVerificationCode = () => {
        //      alert('인증번호가 전송되었습니다.');
        //  };

        //  // 이메일 유효성 검사
        //  const validateEmail = (email) => {
        //      const re = /\S+@\S+\.\S+/;
        //      return re.test(email);
        //  };

        //  // 비밀번호 유효성 검사
        //  const validatePassword = (password) => {
        //      const re = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*\d).{8,}$/;
        //      return re.test(password);
        //  };

        //  // 아이디 중복 확인 함수
        //  const isExistingId = (email) => {
        //      const existingIds = ['user1@example.com', 'user2@example.com', 'user3@example.com'];
        //      return existingIds.includes(email);
        //  };
         </script>



</body>
</html>

