<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicon-16x16.png">
    <title>introduce</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/noticeModify.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/89a0fea006.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>

<body>

    <!-- header -------------------------------- -->
    <%@ include file="include/header.jsp" %>

    <!-- notice-detail-write ---------------------------------->
    <section>

        <div class="title">
            <h1>NOTICE / <span>공지사항</span></h1>
         </div>

        <div class="notice-list">
            <div class="notice-box">
                <div class="NoticeBoardType">
                    공지사항 작성
                 </div>

                <div id="wrap" class="form-container">
                    <form action="/main/notice-detail-write" method="post">
                        <table>
                            <thead>
                                <tr class="column">
                                    <th>
                                        <label for="category">카테고리</label>
                                    </th>

                                    <th>
                                        <label for="title">제목</label>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <!-- 카테고리 -->
                                    <td>
                                        <select id="category" name="noticeCategory" required>
                                            <option value="COMMON">기본</option>
                                            <option value="NOTICE">공지</option>
                                            <option value="ESSENTIAL">필독</option>
                                        </select>
                                    </td>

                                    <!-- 제목 -->
                                    <td>
                                        <input type="text" id="title" name="noticeTitle" required placeholder="제목" maxlength="20">
                                    </td>

                                    <!-- 내용 -->
                                    <textarea id="content" name="noticeContent" maxlength="1000" required
                                         placeholder="내용"></textarea>

                                </tr>
                            </tbody>
                        </table>
                        <!-- 등록 및 목록 -->
                        <div class="buttons">
                            <button class="list-btn" type="button"
                                onclick="window.location.href='/main/notice'">목록</button>
                            <button type="submit" class="submit-button">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </section>


    <!-- footer --------------------->
    <%@ include file="include/footer.jsp" %>

</body>

</html>