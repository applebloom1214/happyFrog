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
    <title>Document</title>
</head>
<style>
    body {
        margin: 0;
        background-image: url("/happyfrog/resources/images/leaves.webp");
    }

    /*그리드 설정*/
    .grid-container {
        padding: 0.63em;
        display: grid;
        gap: 0.31em;
        grid-template-rows: 4.38em 50.63em;
    }

    .grid-item {
        padding: 0.31em;
        /* border: 0.19em solid black; */
        color: green;
    }

    .grid-item.read {
        padding: 1.25em;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        /* background-color: aqua; */
    }

    .grid-item.fixed {
        width: 100%;
        position: fixed;
    }

    /*헤더 설정*/
    .header {
        color: green;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: whitesmoke;
    }

    .header-right {
        margin-right: 1em;
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

    /* picture */

    .picture {
        margin-top: 5em;
        width: 50em;
        height: 25em;
        background-color: blue;
    }

    /* title d*/

    .title {
    }

    /* score */

    .score {}

    /* rating */

    #ratingform fieldset {
        display: inline-block;
        /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl;
        /* 이모지 순서 반전 */
        border: 0;
        /* 필드셋 테두리 제거 */
    }
    #ratingform input[type=radio] {
        display: none;
        /* 라디오박스 감춤 */
    }
    #ratingform label {
        font-size: 1em;
        /* 이모지 크기 */
        color: transparent;
        /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #f0f0f0;
        /* 새 이모지 색상 부여 */
    }

    #ratingform label:hover {
        text-shadow: 0 0 0 rgb(237, 253, 6);
        /* 마우스 호버 */
    }
    #ratingform label:hover ~ label {
        text-shadow: 0 0 0 rgb(237, 253, 6);
        /* 마우스 호버 뒤에오는 이모지들 */
    }

    #ratingform fieldset legend {
        text-align: left;
    }

    #ratingform input[type=radio]:checked ~ label {
        text-shadow: 0 0 0 rgb(237, 253, 6);
        /* 마우스 클릭 체크 */
    }

    /* 삭제,수정,댓글, 목록 버튼(삭제, 수정은 글쓴이에게만 보인다, 댓글은 글쓴이 외에만 표기)*/

    .buttons {
        padding: 1em;
        width: 40%;
        display: flex;
        justify-content: end;
    }

    .buttons button,
    .moreBtn {
        margin: 0.1em;
        text-align: center;
        box-shadow: inset 0 1px 0 0 #caefab;
        background: linear-gradient(to bottom, #7DCE13 5%, #7DCE13 100%);
        background-color: #7DCE13;
        border-radius: 6px;
        border: 1px solid #7DCE13;
        display: inline-block;
        cursor: pointer;
        color: #306108;
        font-family: Arial;
        font-size: 13px;
        font-weight: bold;
        padding: 6px 24px;
        text-decoration: none;
        text-shadow: 0 1px 0 #aade7c;
    }

    .buttons button:hover {
        background: linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
        background-color: #a5cc52;
    }

    .moreBtn:hover {
        background: linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
        background-color: #a5cc52;
    }
    .buttons button:active {
        position: relative;
        top: 1px;
    }

    /* 리플 */

    .reply {
        display: flex;
        flex-direction: column;
        text-align: center;
    }

    .reply hr {
        width: 50em;
    }

    .comment {
        margin-top: 0.31em;
        font-size: 1em;
        font-weight: bold;
    }

    #ratingc {
        display: none;
    }

    .moreCnt {
        bottom: 1em;
        right: 40em;
        position: fixed;
    }

    fieldset{
        background-color: #A77979;
    }

    legend{
        background-color: #EEE3CB;
        color: black;
    }

    @media (max-width: 47.94em) {
        .moreCnt {
            bottom: 1em;
            right: 1em;
        }

        .buttons {
            width: 80%;
        }

        .moreBtn {
            font-size: 10px;
        }
    }
</style>
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