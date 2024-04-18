<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>RESERVATION</title>
     <%@ include file="include/static-head.jsp" %>
</head>
<body>
    <%@ include file="include/header.jsp" %>


    <section>


            <div class="title">
                <h1>RESERVATION / <span>예약</span></h1>
            </div>


            <div class="camping">
                <c:forEach var="b" items="${camp}">
                
                    <div class="camping-list">
                        <div class="camping-box">
                            <img src="/assets/img/camp4.jpg" alt="캠핑"><br>
                            <ul class="camping">
                                <li class="camp-name">${b.campName}</li>
                                <li class="camp-address">${b.campAddress}</li>
                                <li class="camp-number">${b.campNumber}</li>
                                <li class="camp-homepage">${b.campHomepage}</li>
                                <li class="camp-price">${b.campPrice}</li>
                            </ul>
                
                            <button type="button" class="more-button"
                            onclick="location.href='/main/reservation-detail?camp_id=${b.campId}'">MORE</button>
                        </div>
                    </div>
                </c:forEach>
            </div>




        </section>


        <%@ include file="include/footer.jsp" %>
</body>
</html>