<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <div class="container">
            <label for="uname">
                <b>ID</b>
            </label>
            <input type="text" placeholder="ID를 입력해주세요" name="uname" required="required">

            <label for="psw">
                <b>비밀번호</b>
            </label>
            <input
                    type="password"
                    placeholder="비밀번호를 입력해주세요"
                    name="psw"
                    required="required">

            <button type="submit">로그인</button>
            <label>
                <input type="checkbox" checked="checked" name="remember">
                기억하기
            </label>
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" class="cancelbtn">취소</button>
            <a class="psw" href="#">Forgot password?
            </a>
        </div>
    </div>
</div>
</body>
</html>