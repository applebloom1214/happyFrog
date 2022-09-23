<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Font Awesome api 사용-->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="/happyfrog/resources/css/read.css" rel="stylesheet">
    <title>Document</title>
</head>

<body>
<class="grid-container">
<!-- 로고, 인포, 회원가입, 로그인/로그아웃 -->
<div class="grid-item fixed">
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
<!--글 읽기-->
<div class="grid-item read">
    <div class="picture">
        그림
    </div>
    <div class="title">
        <h1 class="title text">제목일까 드립일까 뭐일까</h1>
    </div>
    <div class="score">
        <h3>⭐<b>X3000</b>
        </h3>
    </div>
    <div class="rating">
        <form name="ratingform" id="ratingform" method="post" action="./save">
            <!--fieldset - 묶은 요소들 주변을 선으로 감싸준다-->
            <fieldset>
                <!--legend - fieldset의 caption을 설정한다-->
                <legend>평점 매기기</legend>
                <!--for 속성 - 연결된 id와 연동된다-->
                <input
                        type="radio"
                        name="rating"
                        value="5"
                        id="rate1"
                        onclick="checkRadio(this.value);">
                <label for="rate1">⭐</label>
                <input
                        type="radio"
                        name="rating"
                        value="4"
                        id="rate2"
                        onclick="checkRadio(this.value);">
                <label for="rate2">⭐</label>
                <input
                        type="radio"
                        name="rating"
                        value="3"
                        id="rate3"
                        onclick="checkRadio(this.value);">
                <label for="rate3">⭐</label>
                <input
                        type="radio"
                        name="rating"
                        value="2"
                        id="rate4"
                        onclick="checkRadio(this.value);">
                <label for="rate4">⭐</label>
                <input
                        type="radio"
                        name="rating"
                        value="1"
                        id="rate5"
                        onclick="checkRadio(this.value);">
                <label for="rate5">⭐</label>
            </fieldset>
            <div id="ratingc">
                <input type="hidden" id="star">
                <input type="text" id="comment">
                <button class="ratingRegister" type="button" onclick="registerCmt()">평점 등록</button>
            </div>

        </form>
    </div>
    <div class="buttons">
        <button type="button" class="delete">삭제</button>
        <button type="button" class="modify">수정</button>
        <button type="button" class="list">목록</button>
    </div>

    <div id="reply" class="reply">
        <hr>
        <div class="comment">
            ⭐⭐⭐ 😀 나그네 하하하 재밌군요.
        </div>
        <div class="comment">
            ⭐⭐⭐ 😀 나그네 하하하 재밌군요.
        </div>
        <div class="comment">
            ⭐⭐⭐ 😀 나그네 하하하 재밌군요.
        </div>
        <div class="comment">
            ⭐⭐⭐ 😀 나그네 하하하 재밌군요.
        </div>
        <div class="comment">
            ⭐⭐⭐ 😀 나그네 하하하 재밌군요.
        </div>
        <div class="moreCnt">
            <button type="button" class="moreBtn">더보기</button>
        </div>
    </div>
</div>
</div>
</body>
<script>
    function checkRadio(star) {
        document
            .getElementById("ratingc")
            .style
            .display = "inline";
        document
            .getElementById("star")
            .value = star;

    }

    function registerCmt() {
        let comment = document
            .getElementById("comment")
            .value;
        let star = document
            .getElementById("star")
            .value;
        // div 생성
        const newReply = document.createElement("div");
        // 리플 붙일 div
        const replyDiv = document.getElementById("reply");

        let star2;

        if (star == 1) {
            star2 = "⭐ ";
        } else if (star == 2) {
            star2 = "⭐⭐ ";
        } else if (star == 3) {
            star2 = "⭐⭐⭐ ";
        } else if (star == 4) {
            star2 = "⭐⭐⭐⭐ ";
        } else {
            star2 = "⭐⭐⭐⭐⭐ ";
        }

        star2 += comment;

        //div에 텍스트 붙이기
        newReply.append(star2);
        newReply
            .classList
            .add("comment");

        replyDiv.append(newReply);

        document
            .getElementById("ratingc")
            .style
            .display = "none";

    }

    $(window).on
</script>
</html>