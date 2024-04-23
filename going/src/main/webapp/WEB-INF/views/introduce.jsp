<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>introduce</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/introduce2.css">

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

    <!-- introduce ---------------------------------->
    <section>
        <div class="title">
            <h1>INTRODUCE</h1>
        </div>

        <div class="intro-list">
            <div class="intro-box">
                <img class="Introimg" src="/assets/introduce-img.png" />
                <div class="Introtext">
                    <span>저희 yagaja 업체를 이용해주셔서 감사합니다.</span><br />
                    <br>
                    <span>YAGAJA는 가평의 모든 캠핑장을 한 눈에 확인할 수 있고 예약할 수 있는 <br> 여행 알선 홈페이지입니다.</span><br />
                    <span>저희 YAGAJA를 사랑해 주시고 이용해 주시는 모든 고객분들께 감사드리며, <br> 캠핑장에서 맑은 공기와 훌륭한 자연경관을 만끽하실 수 있는 시간이 시간이 될 수
                        있도록 <br>항상 정성을 다하겠습니다.</span><br />
                    <span>감사합니다.</span>
                </div>


            </div>
        </div>

    </section>


    <!-- footer --------------------->
    <%@ include file="include/footer.jsp" %>


    <script>



    </script>


</body>

</html>