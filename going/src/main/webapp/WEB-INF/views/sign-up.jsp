
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

        <form action="/user/sign-up" name="signup" id="signUpForm" method="post" style="margin-bottom: 0;">

    <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
        <tr>
            <td style="text-align: left">
              <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span>
              </p>
            </td>
          </tr>
      <tr>
        <td><input type="text" name="account" id="user_id" class="form-control tooltipstered" maxlength="20"
            required="required" aria-required="true"
            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
            placeholder="abc1234@naver.com">
        </td>

      </tr>

      <tr>
        <td style="text-align: left">
          <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="password" size="17" maxlength="20" id="password" name="password"
            class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
            style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
            placeholder="영문과 특수문자를 포함한 최소 8자"></td>
      </tr>
      <tr>
        <td style="text-align: left">
          <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
          </p>
        </td>
      </tr>
      <tr>
        <td><input type="password" size="17" maxlength="20" id="password_check" name="pw_check"
            class="form-control tooltipstered" maxlength="20" required="required" aria-required="true"
            style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
            placeholder="비밀번호가 일치해야합니다."></td>
      </tr>

      <tr>
        <td style="text-align: left">
          <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="text" name="name" id="user_name" class="form-control tooltipstered" maxlength="6"
            required="required" aria-required="true"
            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
            placeholder="한글로 최대 6자"></td>
      </tr>

      <tr>
        <td style="text-align: left">
          <p><strong>휴대폰 번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="phoneNumberChk"></span></p>
        </td>
      </tr>
      <tr>
        <td><input type="email" name="email" id="user_email" class="form-control tooltipstered"
            required="required" aria-required="true"
            style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
            placeholder="ex) abc@mvc.com"></td>
      </tr>


      <tr>
        <td style="width: 100%; text-align: center; colspan: 2;">
          <input type="button" value="회원가입" class="btn form-control tooltipstered" id="signup-btn"
            style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
        </td>
      </tr>

    </table>
  </form>



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
            document.getElementById('idChk').innerHTML = '<b style="color: red;">[이메일은 필수값입니다!]</b>';
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

            
            document.getElementById('signup-btn').addEventListener('click', e => {

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
                        checkResultList[0] = true;
                };

            });
        
            // 패스워드 검사 정규표현식
            const passwordPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

            // 패스워드 입력값 검증
            const $pwInput = document.getElementById('passwordInput');

            document.getElementById('signup-btn').addEventListener('click', e => {

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
            });

         

            // 패스워드 확인란 입력값 검증
            const $pwCheckInput = document.getElementById('passwordCheck');

            document.getElementById('signup-btn').addEventListener('click', e => {

                const pwCheckValue = $pwCheckInput.value;

                if (pwCheckValue.trim() === '') {
                    alert('비밀번호 확인은 필수 입니다.');
                    checkResultList[2] = false;

                } else if ($pwCheckInput.value !== $pwInput.value) {
                alert('위에 비밀번호와 동일하게 작성해 주세요');
                    checkResultList[2] = false;

                } else {
                    alert('올바른 비밀번호 입니다.');
                    checkResultList[2] = true;
                }

            });

         


            // 이름 검사 정규표현식
            const namePattern = /^[가-힣]+$/;

            // 이름 입력값 검증
            const $nameInput = document.getElementById('nameInput');

            document.getElementById('signup-btn').addEventListener('click', e => {

                const nameValue = $nameInput.value;

                if (nameValue.trim() === '') {
                    alert('이름은 작성은 필수 입니다.')
                    checkResultList[3] = false;

                } else if (!namePattern.test(nameValue)) {
                    alert('이름은 한글로만 작성해 주세요.');
                    checkResultList[3] = false;

                } else {
                    alert('올바른 이름 입니다.');
                    checkResultList[3] = true;
                }
            });

             // 휴대폰 검사 정규표현식
            const phoneNumberPattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

            // 휴대폰 번호 검증
            const $phoneNumberInput = document.getElementById('phoneNumberInput');

            document.getElementById('signup-btn').addEventListener('click', e => {

                const phoneNumberInput = $phoneNumberInput.value;

                if (phoneNumberInput.trim() === '') {
                    alert('휴대폰 번호는 작성은 필수 입니다.')
                    checkResultList[4] = false;

                } else if (!phoneNumberPattern.test(phoneNumberInput)) {
                    alert('제대로된 번호를 입력해주세요');
                    checkResultList[4] = false;

                } else {
                    alert('올바른 휴대폰 번호 입니다.');
                    checkResultList[4] = true;
                }



            });



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

