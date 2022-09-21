<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        body {
            margin: 0;
            background-image: url(/happyfrog/resources/images/leaves.webp);
        }

        /*그리드 설정*/
        .grid-container {
            padding: 0.63em;
            display: grid;
            gap: 0.31em;
            grid-template-rows: 4.38em auto;
        }

        .grid-item {
            padding: 0.31em;
            /* border: 0.19em solid black; */
            color: green;
        }

        /*헤더 설정*/
        .header {
            color: green;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: whitesmoke;

        }
        .logo span,
        a {
            color: green;
            float: left;
            text-align: center;
            padding: 0.75em;
            text-decoration: none;
            font-size: 1.13em;
            line-height: 1.56em;
            border-radius: 0.25em;
        }

        .header a.active {
            background-color: #7DCE13;
            color: white;
        }

        .header a:hover {
            background-color: #ddd;
            color: black;
        }

        .header a.active {
            background-color: #7DCE13;
            color: white;
        }

        img {
            width: 3.44em;
            height: 3.44em;
        }

        /* 로그인 폼 */
        form {
            border: 0.19px solid #f1f1f1;
        }

        .grid-item.login{
            width: 50%;
            justify-self: center;
        }

        /* Full-width inputs */
        input[type=password],
        input[type=text] {
            width: 100%;
            padding: 0.75em 1.25em;
            margin: 0.50em 0;
            display: inline-block;
            border: 0.06em solid #ccc;
            box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
            background-color: #7DCE13;
            color: white;
            padding: 0.88em 1.25em;
            margin: 0.50em 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        /* Add a hover effect for buttons */
        button:hover {
            opacity: 0.8;
        }

        /* Extra style for the cancel button (red) */
        .cancelbtn {
            width: auto;
            padding: 0.63em 1.13em;
            background-color: #f44336;
        }

        /* Center the avatar image inside this container */
        .imgcontainer {
            text-align: center;
            margin: 1.50em 0 0.75em;
        }

        /* Avatar image */
        img.avatar {
            width: 40%;
            height: 25em;
            border-radius: 40%;
        }

        /* Add padding to containers */
        .container {
            padding: 1em;
        }

        /* The "Forgot password" text */
        a.psw {
            float: right;
            padding-top: 1em;
            color: black;
        }

        @media screen and (max-width: 47.94em) {
            .grid-item.login{
                width: 100%;
            }

            span.psw {
                display: block;
                float: none;
            }
            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="grid-container">
    <div class="grid-item">
        <div class="header">
            <div class="logo">
                <img src="/happyfrog/resources/images/frog.png">
                <span>HappyFrog 0.0</span>
            </div>
            <div class="header-right">
                <a class="active" href="#home">Home</a>
                <a href="#signin">SignUp</a>
                <a href="#Login">Login</a>
            </div>
        </div>
    </div>
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