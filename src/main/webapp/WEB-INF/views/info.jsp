<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background-image: url(/happyfrog/resources/images/leaves.webp);
        }

        /*그리드 설정*/
        .grid-container {
            padding: 0.63em;
            display: grid;
            gap: 0.31em;
            grid-template-rows: 4.38em 50em;
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

        /* Full-width input fields */
        input[type=password],
        input[type=text] {
            width: 100%;
            padding: 0.94em;
            margin: 0.31em 0 1.38em;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        .grid-item.info {
            color: black;
            margin-top: 1em;
        }

        input[type=password]:focus,
        input[type=text]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 0.06em solid #f1f1f1;
            margin-bottom: 1.56em;
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
            opacity: 0.9;
        }

        button:hover {
            opacity: 1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 0.88em 1.25em;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn,
        .modifybtn {
            float: right;
            width: 10%;
        }

        /* Add padding to container elements */
        .container {
            padding: 1em;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        @media screen and (max-width: 47.94em) {
            .cancelbtn,
            .modifybtn {
                width: 7em;
            }

            .grid-item.info{
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
                <a href="#info">SignUp</a>
                <a href="#Login">Login</a>
            </div>
        </div>
    </div>
    <div class="grid-item info">
        <div class="container">
            <h1>회원 정보 및 수정</h1>
            <p>정보 수정 후 수정 버튼을 눌러주세요</p>
            <hr>

            <label for="email">
                <b>아이디</b>
            </label>
            <input type="text" placeholder="테스트" id="email" required="required" readonly>

            <label for="psw">
                <b>비밀번호</b>
            </label>
            <input
                    type="password"
                    placeholder="수정할 비밀번호를 입력해주세요"
                    name="psw"
                    required="required">

            <label for="psw-repeat">
                <b>비밀번호 확인</b>
            </label>
            <input
                    type="password"
                    placeholder="비밀번호를 다시 한번 입력해주세요"
                    name="psw-repeat"
                    required="required">

            <label for="nick">
                <b>닉네임</b>
            </label>
            <input type="text" placeholder="원숭이" id="nick" required="required">

            <label for="introduce">
                <b>한줄소개</b>
            </label>
            <input type="text" placeholder="테스트입니다" id="introduce" required="required">

            <label for="rating">
                <b>획득 평점</b>
            </label>
            <input type="text" placeholder="100" id="rating" required="required" readonly>

            <div class="clearfix">
                <button type="submit" class="modifybtn">수정</button>
                <button type="button" class="cancelbtn">취소</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>