<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicon-16x16.png">
  <title>notice</title>



  <link rel="stylesheet" href="/assets/css/main.css">
  <link rel="stylesheet" href="/assets/css/notice-basic2.css">
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

  <!-- notice ---------------------------------->
  <section>

    <div class="title">
      <h1>NOTICE / <span>공지사항
          <c:if test="${login.auth == 'ADMIN'}">
            <a href="/main/notice-detail-write" class="add-btn">등록</a>
          </c:if>
        </span></h1>
    </div>

    <div class="notice-list">
      <div class="notice-box">
        <table border="1">
          <thead>
            <tr class="column">
              <th class="noticeCategory">공지등급</th>
              <th class="NoticeNo">글번호</th>
              <th class="NoticeTitle">제목</th>
              <th class="NoticeDate">작성일</th>
              <th class="NoticeCount">조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="b" items="${nList}">
              <c:choose>
                <c:when test="${b.noticeCategory == 'NOTICE'}">
                  <tr class="notice-click">
                    <td class="noticeCategory">
                      <c:set var="categoryName" value="" />
                      <c:choose>
                        <c:when test="${b.noticeCategory == 'ESSENTIAL'}">
                          <c:set var="categoryName" value="필독" />
                        </c:when>
                        <c:when test="${b.noticeCategory == 'NOTICE'}">
                          <c:set var="categoryName" value="공지" />
                        </c:when>
                        <c:when test="${b.noticeCategory == 'COMMON'}">
                          <c:set var="categoryName" value="기본" />
                        </c:when>
                      </c:choose>
                      ${categoryName}
                    </td>
                    <td class="NoticeNo">${b.noticeNo}</td>
                    <td class="NoticeTitle">${b.noticeTitle}</td>
                    <td class="NoticeDate">${b.noticeDate}</td>
                    <td class="NoticeCount">${b.noticeCount}</td>
                  </tr>
                </c:when>
              </c:choose>
            </c:forEach>
          </tbody>
        </table>
        <!-- 검색어 조회 -->

        <form action="/main/notice-notice" method="get">
          <div class="category-button-box">
            <button type="submit" class="category-button"><a href="/main/notice">모두</a></button>
            <button type="submit" class="category-button"><a href="/main/notice-essential">필독</a></button>
            <button type="submit" class="category-button" style="border: 2px red solid;"><a href="/main/notice-notice">공지</a></button>
            <button type="submit" class="category-button"><a href="/main/notice-common">기본</a></button>
        </div>
          <div class="search-content-background">
            <select class="form-select" name="type" id="search-type">
              <option value="title">제목</option>
              <option value="content">내용</option>
              <option value="tc">제목+내용</option>
            </select>
            <input type="text" class="search-content" name="keyword" value="${s.keyword}" placeholder="검색어를 입력해 주세요">
            <button type="submit" class="search-click-button">검색</button>
          </div>
        </form>

        <!-- ----------------------------------------------------------------------- -->
        <!-- 게시글 목록 하단 영역 -->
        <div class="bottom-section">

          <!-- 페이지 버튼 영역 -->
          <nav aria-label="Page navigation example">
            <ul class="pagination pagination-lg pagination-custom">
              <c:if test="${maker.page.pageNo != 1}">
                <li class="page-item"><a class="page-link"
                    href="/main/notice-notice?pageNo=1&type=${s.type}&keyword=${s.keyword}">&lt;&lt;</a>
                </li>
              </c:if>
          
              <c:if test="${maker.prev}">
                <li class="page-item"><a class="page-link"
                    href="/main/notice-notice?pageNo=${maker.begin-1}&type=${s.type}&keyword=${s.keyword}">&lt;</a>
                </li>
              </c:if>
          
              <c:forEach var="i" begin="${maker.begin}" end="${maker.end}">
                <li data-page-num="${i}" class="page-item">
                  <a class="page-link" href="/main/notice-notice?pageNo=${i}&type=${s.type}&keyword=${s.keyword}">${i}</a>
                </li>
              </c:forEach>
          
              <c:if test="${maker.next}">
                <li class="page-item"><a class="page-link"
                    href="/main/notice-notice?pageNo=${maker.end+1}&type=${s.type}&keyword=${s.keyword}">&gt;</a>
                </li>
              </c:if>
          
              <c:if test="${maker.page.pageNo != maker.finalPage}">
                <li class="page-item"><a class="page-link"
                    href="/main/notice-notice?pageNo=${maker.finalPage}&type=${s.type}&keyword=${s.keyword}">&gt;&gt;</a>
                </li>
              </c:if>
            </ul>
          </nav>
          

        </div>



      </div>


  </section>





  <!-- footer --------------------->
  <%@ include file="include/footer.jsp" %>

  <script>
    // 모든 tr 요소를 선택합니다.
    const rows = document.querySelectorAll('tr.notice-click');

    // 각각의 tr 요소에 대해 반복합니다.
    rows.forEach(row => {
      // 클릭 이벤트를 추가합니다.
      row.addEventListener('click', function () {
        // 클릭된 tr 요소에 대한 처리를 여기에 추가합니다.
        const noticeNoElement = row.querySelector('.NoticeNo');
        if (noticeNoElement) {
          const noticeNo = noticeNoElement.innerText;
          const detailUrl = '/main/notice-detail/' + noticeNo;

          // detailUrl이 정의되었는지 확인 후 이동합니다.
          if (detailUrl) {
            window.location.href = detailUrl;
          } else {
            console.error('Detail URL이 정의되지 않았습니다.');
          }
        } else {
          console.error('NoticeNo X');
        }
        // alert('클릭 이벤트 발생: ' + row.innerText); // 예시로 경고창을 띄웁니다.
      });
    });

    // 사용자가 현재 머물고 있는 페이지 버튼에 active 스타일 부여
    function appendPageActive() {

      // 현재 서버에서 넘겨준 페이지 번호
      const currPage = '${maker.page.pageNo}';

      // li 태그들을 전부 확인해서
      // 현재 페이지 번호와 일치하는 li를 찾은 후 active 클래스 이름 붙이기
      const $ul = document.querySelector('.pagination');
      const $liList = [...$ul.children];

      $liList.forEach($li => {
        if (currPage === $li.dataset.pageNum) {
          $li.classList.add('active');
        }
      });
    }

    // 검색조건 셀렉트박스 옵션타입 고정하기
    function fixSearchOption() {
      const $select = document.getElementById('search-type');
      // 셀렉트 박스 내에 있는 option 태그들 전부 가져오기
      const $options = [...$select.children];

      $options.forEach($opt => {
        if ($opt.value === '${s.type}') {
          // option 태그에 selected를 주면 그 option이 고정됨.
          $opt.setAttribute('selected', 'selected');
        }
      });

    }

    appendPageActive();
    fixSearchOption();
  </script>

</body>

</html>