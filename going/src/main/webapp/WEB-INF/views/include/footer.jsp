<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>

</head>

<body>

    <footer>


        <div class="footer-wrap">
            <div class="footer-content">
                <p class="footer-main">
                    YAGAJA &#124; 대표자명 : 홍길동 &#124; 사업자등록번호 : 123-12-1234
                    <br>주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀) &#124; 문의 : 02-123-1234
                </p>
                <br>

                <p class="footer-link">
                    <span class="modal-open" data-modal-target="terms-modal">이용약관</span> &#124;
                    <span class="modal-open" data-modal-target="privacy-modal">개인정보처리방침</span>
                </p>


                <br>

                <p class="footer-copyright">Copyright ⓒ 2024~ YAGAJA All Rights Reserved.</p>

            </div>


            <h1 class="footer-logo"><a href="/main"><span>Y</span>⛺<span>GAJA</span></a></h1>
            <!-- <a href="#" class="go-top"><span class="lnr lnr-arrow-up"></span></a> -->
        </div>

        <div id="terms-modal" class="modal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <p style="font-size: 20px;">제1조(목적)</p>
                <br>
                <p>이 약관은 YAGAJA 회사(전자상거래 사업자)가 운영하는 YAGAJA 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.</p><br>
                <p>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」</p><br>
                <p>... 이하 생략</p>
            </div>
        </div>

        <div id="privacy-modal" class="modal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <p style="font-size: 20px;">※ 총 칙</p>
                <br>
                <p>1. YAGAJA는 "정보통신망이용촉진및정보보호등에관한법률"상의 개인정보보호 규정과 정보통신부가 제정한 "개인정보보호지침" 및 "개인정보의 기술적/관리적 보호조치 기준"을 준수하고 있습니다.</p>
                <p>또한 YAGAJA는 "개인정보보호정책"을 제정하여 회원들의 개인정보 보호를 위해 최선을 다하겠음을 선언합니다.</p><br>
                <p>2. YAGAJA의 "개인정보보호정책"은 관련 법률 및 정부 지침의 변경과 YAGAJA의 내부 방침 변경에 의해 변경될 수 있습니다. </p>
                <p>YAGAJA의 "개인정보보호방침"이 변경될 경우 변경사항은 YAGAJA 홈페이지의 공지사항에 최소 7일간 게시됩니다. </p><br>
                <p>... 이하 생략</p>
            </div>
        </div>



    </footer>



    <script>
        // footer 이용약관, 개인정보처리방침 모달
        document.addEventListener('DOMContentLoaded', function () {
            const modalOpenButtons = document.querySelectorAll('.modal-open');
            const modalCloseButtons = document.querySelectorAll('.modal-close');
            const modals = document.querySelectorAll('.modal');

            modalOpenButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const targetModalId = button.getAttribute('data-modal-target');
                    const targetModal = document.getElementById(targetModalId);
                    targetModal.style.display = 'block';
                });
            });

            modalCloseButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const modal = button.closest('.modal');
                    modal.style.display = 'none';
                });
            });

            modals.forEach(modal => {
                modal.addEventListener('click', function (event) {
                    if (event.target === modal) {
                        modal.style.display = 'none';
                    }
                });
            });
        });
    </script>


</body>

</html>