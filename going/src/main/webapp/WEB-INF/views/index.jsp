<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>

   
    <button type="button" id="kakaopayBtn">KakaoPay</button>

    <script>

        document.getElementById('kakaopayBtn').addEventListener('click', e => {


            $.ajax({

                url: '/jq/kakaopay',
                dataType: 'json',
                success:function(data){
                    console.log(data.tid);
                },
                error:function(error){
                   console.log(error);
                }

            });



        })



    </script>


</body>
</html>  