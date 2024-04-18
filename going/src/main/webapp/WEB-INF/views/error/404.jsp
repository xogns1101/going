<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 Forbidden</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
        }
        h1 {
            color: #dc3545;
        }
        p {
            color: #6c757d;
        }
        a {
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>404 Not Found</h1>
    <p>현재 입력하신 링크는 존재하지 않는 경로입니다.</p>
    <br>
    <a href="/main">메인 화면으로 이동하기</a>

</div>
</body>
</html>
