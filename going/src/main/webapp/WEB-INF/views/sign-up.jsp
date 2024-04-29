<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>sign-up</title>
    <%@ include file="include/static-head.jsp" %>
 

</head>

<body>
    <!-- header -------------------------------- -->
    <%@ include file="include/header.jsp" %>

    <!-- sign-up ---------------------------------->



    <!-- 섹션 -->
    <section class="signup-list">
        <div class="signup-box">

            <h1>SIGN-UP</h1>

            <form action="/user/sign-up" name="signup" id="signUpForm" method="post">

                <table>
                    <tr>
                        <td>
                            <p><strong>이메일</strong>&nbsp;&nbsp;&nbsp;
                                <span id="emailChk"></span></p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="email" id="emailInput" maxlength="20" required="required"
                                aria-required="true" placeholder="abc1234@naver.com">
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <p><strong>비밀번호</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" maxlength="20" id="password" name="password" maxlength="25"
                                required="required" aria-required="true" placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                    </tr>
                    <tr>
                        <td>
                            <p><strong>비밀번호 재확인</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="password" maxlength="20" id="password_check" name="pw_check" maxlength="20"
                                required="required" aria-required="true" placeholder="비밀번호가 일치해야합니다.">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p><strong>이름</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="name" id="user_name" maxlength="5" required="required"
                                aria-required="true" placeholder="한글로 최대 5자"></td>
                    </tr>

                    <tr>
                        <td>
                            <p><strong>휴대폰 번호</strong>&nbsp;&nbsp;&nbsp;<span id="phoneNumberChk"></span></p>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="phoneNumber" id="user_phone" required="required"
                                aria-required="true" placeholder="010-1234-5678"></td>
                    </tr>


                    <tr class="join-btn">
                        <td>
                            <input type="button" value="회원가입" class="btn" id="signup-btn">
                        </td>
                    </tr>

                </table>
            </form>
        </div>
    </section>



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
                document.getElementById('emailChk').innerHTML =
                    '<b style="color: red;">[이메일 형태로 입력하세요!]</b>';
                checkResultList[0] = false;

            } else {
                // 비동기 요청으로 아이디 중복 확인 진행
                fetch('/user/check/email/' + emailInput)
                    .then(res => res.json())
                    .then(flag => {
                        if (flag) { // 중복
                            $emailInput.style.borderColor = 'red';
                            document.getElementById('emailChk').innerHTML =
                                '<b style="color: red;">[이메일이 중복되었습니다.]</b>';
                            checkResultList[0] = false;

                        } else {
                            $emailInput.style.borderColor = 'skyblue';
                            document.getElementById('emailChk').innerHTML =
                                '<b style="color: skyblue;">[사용 가능한 이메일입니다.]</b>';
                            checkResultList[0] = true;
                        }
                    });
            }
        }

        // 패스워드 검사 정규표현식
                const passwordPattern = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*?_~]).{8,}$/;

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
                document.getElementById('phoneNumberChk').innerHTML =
                    '<b style="color: red;">[휴대폰 번호는 필수 정보 입니다.!]</b>';
                checkResultList[4] = false;

            } else if (!phoneNumberPattern.test(userPhone)) {
                $userPhone.style.borderColor = 'red';
                document.getElementById('phoneNumberChk').innerHTML =
                    '<b style="color: red;">[올바른 휴대폰 번호를 작성해 주세요.]</b>';
                checkResultList[4] = false;

            } else {
                $userPhone.style.borderColor = 'skyblue';
                document.getElementById('phoneNumberChk').innerHTML =
                    '<b style="color: skyblue;">[사용가능한 휴대번호 입니다.]</b>';
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
                // 비밀번호 길이 체크
                const pwValue = $pwInput.value;
                if (pwValue.length < 8) {
                    alert('비밀번호는 최소 8자 이상이어야 합니다.');
                } else {
                    $form.submit();
                    alert('회원가입이 완료되었습니다. 다시 로그인해주세요.');
                }
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