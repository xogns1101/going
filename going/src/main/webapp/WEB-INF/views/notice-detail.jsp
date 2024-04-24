<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>notice-detail</title>


    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/in-notice2.css">
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

    <!-- notice-detail ---------------------------------->
<section>
    <div class="title">
        <h1>NOTICE / <span>공지사항</span></h1>
    </div>



    <div class="notice-list">
        <div class="notice-box">
            <div class="NoticeBoardType"><< ${n.noticeNo}번 공지사항 >></div>
            <table border="1">
                <thead>
                    <tr class="column">
                        <th class="noticeCategory">공지등급</th>
                        <th class="NoticeNo">글번호</th>
                        <th class="NoticeTitle">제목</th>
                        <th class="NoticeDate">작성일</th>
                        <th class="NoticeCount">조회수</th>
                    </tr>
                    <tr class="Item">
                        <td class="noticeCategory"></td>
                        <td class="NoticeNo">${n.noticeNo}</td>
                        <td class="NoticeTitle">${n.noticeTitle}</td>
                        <td class="NoticeDate">${n.noticeDate}</td>
                        <td class="NoticeCount">${n.noticeCount}</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5" class="InNoticeContentbox">
                            <div class="InNoticeContent">${n.noticeContent}</div>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="buttons">

                        <button class="list-btn" type="button" onclick="location.href='/main/notice'">목록</button>
                    </div>

        </div>
    </div>
</section>


		 <!-- footer --------------------->
    		<%@ include file="include/footer.jsp" %>



