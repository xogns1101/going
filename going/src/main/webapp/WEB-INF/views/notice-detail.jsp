<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>introduce</title>

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
                    <c:forEach var="b" items="${nList}">
                    <table border="1">
                        <thead>
                            <tr class="column">
                                <th class="yeon-sung-regular">공지등급</th>
                                <th class="yeon-sung-regular">글번호</th>
                                <th class="yeon-sung-regular">제목</th>
                                <th class="yeon-sung-regular">작성일</th>
                                <th class="yeon-sung-regular">조회수</th>

                            </tr>


                            <tr>
                                <td class="noticeCategory">${b.noticeCategory}</td>
                                <td class="NoticeNo">${b.noticeNo}</td>
                                <td class="NoticeTitle">${b.noticeTitle}</td>
                                <td class="NoticeDate">${b.noticeDate}</td>
                                <td class="NoticeCount">${b.noticeCount}</td>

                            </tr>
                        </thead>

                            <!-- 내용칸  -->
                            <div class="InNoticeContentbox"></div>
                            <div class="InNoticeContent">${b.noticeContent}</div>
                            <div class="NoticeBoardType">‘공지사항’ 게시판 글</div>

                    </table>



                    </c:forEach>

                <!-- 되돌아가기 버튼 -->
                <button class="back-btn" onclick="history.back(); return false;">되돌아가기</button>



                </div>
            </div>


         </section>


         <!-- footer --------------------->
         <%@ include file="include/footer.jsp" %>


         <script>
        // 모든 tr 요소를 선택합니다.
        const rows = document.querySelectorAll('tr');

        // 각각의 tr 요소에 대해 반복합니다.
        rows.forEach(row => {
            // 클릭 이벤트를 추가합니다.
            row.addEventListener('click', function() {
                // 클릭된 tr 요소에 대한 처리를 여기에 추가합니다.
                alert('클릭 이벤트 발생: ' + row.innerText); // 예시로 경고창을 띄웁니다.
            });
        });

           // 되돌아가기 버튼을 클릭했을 때 호출되는 함수
          function goBack() {
            // 브라우저의 뒤로 가기 동작을 수행합니다.

            window.location.href = 'notice-basic2.html';
            console.log("~~");
        }



             </script>


</body>
</html>