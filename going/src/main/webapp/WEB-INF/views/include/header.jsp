<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>

</head>

<body>

    <header>
        <div id="wrap">
            <h1 class="logo"><a href="/main">Y⛺GAJA</a></h1>
            <div class="logo-content">
                <a href="/main/introduce">INTRO</a>
                <a href="/main/reservation">RESERVATION</a>
                <a href="/main/notice/list">NOTICE</a>
                <a href="/main/review">REVIEW</a>
            </div>
            <div class="login">
                <a href="/user/sign-in">LOGIN</a><br>
                <a href="/user/mypage">MYPAGE</a>
            </div>

            <a href="#" class="menu-open">
                <span class="lnr lnr-menu"></span>
            </a>
        </div>

        <nav class="gnb">
            <a href="#" class="close">
                <span class="lnr lnr-cross"></span>
            </a>
            <ul>
                <li><a href="/main/introduce">INTRO</a></li>
                <li><a href="/main/reservation">RESERVATION</a></li>
                <li><a href="/main/notice/list">NOTICE</a></li>
                <li><a href="/main/review">REVIEW</a></li>
                <li><a href="/user/sign-in">LOGIN</a></li>
                <li><a href="/user/mypage">MYPAGE</a></li>
            </ul>
        </nav>

        <script>
            //버튼의 요소 노드 취득
            const menuBtn = document.querySelector('header .menu-open');
            const closeBtn = document.querySelector('.gnb .close');

            const gnb = document.querySelector('.gnb');

            //클릭 이벤트 생성
            menuBtn.addEventListener('click', () => {
                gnb.classList.add('open');
            });

            closeBtn.addEventListener('click', () => {
                gnb.classList.remove('open');
            });
        </script>

    </header>

</body>

</html>