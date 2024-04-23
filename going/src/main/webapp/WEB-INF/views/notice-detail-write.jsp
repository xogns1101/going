<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>introduce</title>

    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/in-notice-write.css">

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

        <!-- <div class="notice-list">
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
                        </thead> -->

                        <!-- 내용칸  -->
                        <!-- <div class="InNoticeContentbox"></div> -->
                        <!-- <div class="InNoticeContent">${b.noticeContent}</div> -->
                        <!-- <div class="NoticeBoardType">‘공지사항’ 게시판 글</div>

                        <div class="InNoticeContentbox" id="noticeContentBox">
                            <textarea id="editedContent">${b.noticeContent}</textarea>
                        </div>
                    </table>

                </c:forEach> -->

                <!-- 수정, 삭제 저장 버튼 -->
                <!-- <div class="buttonContainer">
                    <button id="editButton">수정</button>
                    <button id="saveButton">저장</button>
                    <button id="deleteButton">삭제</button>
                </div>
            </div>
        </div> -->

        <div id="wrap" class="form-container">
            <form action="/main/notice-detail-write" method="post">
                <label for="title">제목</label>
                <input type="text" id="title" name="noticeTitle" required placeholder="제목">
                <label for="content">내용</label>
                <textarea id="content" name="noticeContent" maxlength="1000" required placeholder="내용"></textarea>
                <div class="buttons">
                    <button class="list-btn" type="button" onclick="window.location.href='/main/notice'">목록</button>
                    <button type="submit">등록</button>
                </div>
            </form>
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
            row.addEventListener('click', function () {
                // 클릭된 tr 요소에 대한 처리를 여기에 추가합니다.
                alert('클릭 이벤트 발생: ' + row.innerText); // 예시로 경고창을 띄웁니다.
            });
        });

        // 되돌아가기 버튼을 클릭했을 때 호출되는 함수
        function goBack() {
            // 브라우저의 뒤로 가기 동작을 수행합니다.
            window.history.back();
            console.log("뒤로가기 버튼이 클릭됨");
        }

        // 버튼 클릭 이벤트
        document.addEventListener('DOMContentLoaded', function () {
            // 수정 전에는 editedContent를 수정할 수 없도록 만듭니다.
            const editedContent = document.getElementById('editedContent');
            editedContent.disabled = true;

            // 수정 버튼을 클릭하면 수정 가능하도록 변경합니다.
            document.getElementById('editButton').addEventListener('click', function () {
                editedContent.disabled = false;
            });

            // 저장 버튼을 클릭하면 내용이 변경된 상태로 저장됩니다.
            document.getElementById('saveButton').addEventListener('click', function () {
                // 여기에 저장하는 로직을 추가하세요.
                alert('저장되었습니다.');

                // 저장 후에는 수정할 수 없도록 수정 필드를 비활성화합니다.
                editedContent.disabled = true;
            });

            // 삭제 버튼을 클릭하면 확인 메시지가 뜹니다.
            document.getElementById('deleteButton').addEventListener('click', function () {
                const confirmDelete = confirm('정말 삭제하시겠습니까?');
                if (confirmDelete) {
                    // 여기에 삭제하는 로직을 추가하고, 삭제 후 notice-admin2.html로 이동합니다.
                    alert('게시글이 삭제되었습니다.');
                    window.location.href = 'notice-admin2.html';
                }
            });
        });
    </script>


</body>

</html>