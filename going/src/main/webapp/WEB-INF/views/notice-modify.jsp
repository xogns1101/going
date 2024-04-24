<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>noticeModify</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/noticeModify.css">

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

    <!-- notice-detail-write ---------------------------------->
    <section>

        <div class="title">
            <h1>NOTICE / <span>공지사항</span></h1>
        </div>

     <div class="notice-list">
       <div class="notice-box">
        <div class="NoticeBoardType"><< ${notice.noticeNo}번 공지사항 >></div>

        <div id="wrap" class="form-container">
          <form action="/main/notice-modify" method="post">
          <table>
           <thead>
           <tr class="column">
            <th>
            <label for="category">카테고리</label>
            </th>

            <th>
            <label for="noticeNo">글번호</label> <!--ㅊㄱ-->
            </th>

            <th>
            <label for="title">제목</label>
            </th>

            <th>
            <label for="noticeDate">작성일</label> <!--ㅊㄱ-->
            </th>

            <th>
            <label for="noticeCount">조회수</label> <!--ㅊㄱ-->
            </th>
           </tr>

          </thead>
          <tbody>


           <!-- <label for="content">내용</label>-->

            <tr>
             <td>
                <select id="category" name="noticeCategory" required>
                   <option value="COMMON" ${notice.noticeCategory eq 'COMMON' ? 'selected' : ''}>기본</option>
                   <option value="NOTICE" ${notice.noticeCategory eq 'NOTICE' ? 'selected' : ''}>공지</option>
                   <option value="ESSENTIAL" ${notice.noticeCategory eq 'ESSENTIAL' ? 'selected' : ''}>필독</option>
                </select>
             </td>
             <td>
              <input type="hidden" name="noticeNo" value="${notice.noticeNo}">${notice.noticeNo}
             </td>
             <td>
             <input type="text" id="title" name="noticeTitle" required placeholder="제목" value="${notice.noticeTitle}">
             </td>

             <td>
             <input type="hidden" name="noticeDate" value="${notice.noticeDate}">${notice.noticeDate}
             </td>

             <td>
             <input type="hidden" name="noticeCount" value="${notice.noticeCount}">${notice.noticeCount}
             </td>

                <textarea id="content" name="noticeContent" maxlength="1000" required placeholder="내용">${notice.noticeContent}</textarea>

             </tr>


            </tbody>

            </table>
             <div class="buttons">
               <button class="list-btn" type="button" onclick="window.location.href='/main/notice'">목록</button>
               <button type="submit" class="submit-button">수정</button>
             </div>

        </form>
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