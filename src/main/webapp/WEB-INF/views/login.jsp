<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/happyfrog/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="grid-container">
    <!-- header -->
    <jsp:include page="header.jsp"/>
    <div class="grid-item login">
        <div class="imgcontainer">
            <img src="/happyfrog/resources/images/frog.png" alt="Avatar" class="avatar">
        </div>

        <form action="<c:url value="/login"/>" method="post">
        <div class="container">
            <label for="username">
                <b>ID</b>
            </label>
            <input type="text" placeholder="ID를 입력해주세요" id="username" name="id" required="required">

            <label for="pw">
                <b>비밀번호</b>
            </label>
            <input
                    type="password"
                    placeholder="비밀번호를 입력해주세요"
                    id = "pw"
                    name="pw"
                    required="required">

            <button type="submit">로그인</button>
            <label>
                <input type="checkbox" checked="checked" name="remember">
                기억하기
            </label>
        </div>
        </form>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" class="cancelbtn" onclick="location.href='<c:url value='/'/>';">돌아가기</button>
            <p class="msg"></p>
        </div>
    </div>
</div>
</body>
<script>
</script>
</html>