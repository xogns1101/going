<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Insert Your Title</title>
    <link rel="stylesheet" href="/assets/css/main.css">
</head>

<body>

    <header>
        <div id="wrap">
            <h1 class="logo"><a href="/main">Y⛺GAJA</a></h1>
            <div class="logo-content">
                <a href="/main/introduce">INTRO</a>
                <a href="/main/reservation">RESERVATION</a>
                <a href="/main/notice">NOTICE</a>
                <a href="/main/review">REVIEW</a>
            </div>
            <!-- <div class="login">
                <a href="/user/sign-in"><p>LOGIN</p></a>
            </div>
            <div class="logout">
                <h1>메롱이 님</h1>
                <a href="/user/sign-out">LOGOUT</a><br>
                <a href="/user/mypage">MYPAGE</a>
            </div> -->



            <!-- 로그인이 되어있으면 로그아웃이랑 마이페이지만 뜰수있도록 -->

            <c:if test="${login == null}">
                <div class="login">
                    <a href="/user/sign-in"><p>LOGIN</p></a><br>
                </div>
            </c:if>


            <c:if test="${login != null}">
                    <div class="logout">    
                    <h1><span>${login.name}</span> &nbsp;님 안녕하세요!</h1>
                    <a href="/user/sign-out">LOGOUT</a><br>
                    <a href="/user/mypage">MYPAGE</a>
                </div> 
            </c:if>

       


            


            <p class="menu-open">
                <span class="lnr lnr-menu"></span>
            </p>
        </div>

        <nav class="gnb">
            <p class="close">
                <span class="lnr lnr-cross"></span>
            </p>
            <ul>
                <li><a href="/main/introduce">INTRO</a></li>
                <li><a href="/main/reservation">RESERVATION</a></li>
                <li><a href="/main/notice">NOTICE</a></li>
                <li><a href="/main/review">REVIEW</a></li>
                <li><a href="/user/sign-in">LOGIN</a></li>
                <li><a href="/user/sign-out">LOGOUT</a></li>
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