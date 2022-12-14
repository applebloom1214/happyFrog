<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
<div class="modal">
    <div class="modal_body">댓글 수정
    <input type="text" class="modCommenter">
    <input type="hidden" class="modCno" value="">
    <button type="button" class="modBtn" onclick="replyMod()">수정</button>
    <button type="button" class="closeBtn" onclick="modalClose()">닫기</button>
    </div>
</div>
<%--<div class="grid-container">--%>
<!-- 로고, 인포, 회원가입, 로그인/로그아웃 -->
<div class="grid-item fixed">
    <div class="header">
        <div class="logo">
            <img src="/happyfrog/resources/images/frog.png">
            <span>HappyFrog 0.0</span>
        </div>
        <div class="header-right">
            <a class="active" href="<c:url value='/'/>">Home</a>
            <c:if test="${id == null}">
                <a href="<c:url value='/signin'/>">SignUp</a>
                <a href="<c:url value='/login'/>">Login</a>
            </c:if>
            <c:if test="${id != null}">
                <a href="<c:url value='/logout'/>">Logout</a>
            </c:if>
        </div>
    </div>
</div>
<!--글 읽기-->
<div class="grid-item read">
    <div class="picture">
        <img src="/happyfrog/loadimg?bno=${bno}">
    </div>
    <div class="title">
        <c:if test="${writerCheck != null}">
            <input class="title text" value="${title}" style="border:none;color:green;margin:0.31em;font-size:32px;
            text-align:center;font-weight:bold">
        </c:if>
        <c:if test="${writerCheck == null}">
            <h1 class="title text">${title}</h1>
        </c:if>

    </div>
    <div class="score">
        <h3>⭐<b>X</b><b class="bscore">${rating}</b>
        </h3>
    </div>
    <div class="rating">
        <form name="ratingform" id="ratingform" method="post" action="./save">
            <c:if test="${replyCheck != null}">
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
            </c:if>
            <div id="ratingc">
                <input type="hidden" id="star">
                <input type="hidden" id="bno" value="${bno}">
                <input type="hidden" id="nickName" value="${writer}">
                <input type="text" id="comment">
                <button class="ratingRegister" type="button" onclick="replyadd()">평점 등록</button>
            </div>

        </form>
    </div>
    <div class="buttons">
        <c:if test="${writerCheck != null}">
            <button type="button" class="delete">삭제</button>
            <button type="button" class="modify">수정</button>
        </c:if>
        <button type="button" class="seeReply" onclick="readReply()">리플보기</button>
        <button type="button" class="list" onclick="location.href='<c:url value='/'/>';">목록</button>
    </div>

    <div id="reply" class="reply">
        <hr>
        <div class="commentList">
        </div>

        <div class="moreCnt">
            <button type="button" class="moreBtn" onclick="seeMore()">더보기</button>
        </div>
    </div>
</div>


<%--</div>--%>
</body>
<script>
    let bno = ${bno};
    let totalReplyCnt = 0;
    let moreReply = 1; // 더보기 버튼 구현을 위한 전역변수
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');

    modal.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.classList.toggle('show');

            if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
            }
        }
    });

    function modalClose(){
        modal.classList.toggle('show');
        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
        }
    }

    function checkRadio(star) {
        document
            .getElementById("ratingc")
            .style
            .display = "inline";
        document
            .getElementById("star")
            .value = star;

    }

    function replyModbtn(btn){
        let cno = btn.nextElementSibling.value;
        document.querySelector('.modCno').value = cno;
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
        }
    }

    function seeMore(){
        if( moreReply+1 <= Math.ceil(totalReplyCnt/5)){
            moreReply = moreReply +1;
            console.log(moreReply);
            readReply();
        }else{
            alert("마지막 댓글 입니다.");
            return;
        }
    }

    function plusScore(rating){   // 댓글 등록시 평점을 실시간으로 증가시켜준다.
        let addrating = parseInt(rating);
        let score = parseInt(document.querySelector('.bscore').textContent);
        score += addrating;
        score = String(score);
        console.log(score);
        document.querySelector('.bscore').textContent = score;
    }

    function minusScore(rating){   // 댓글 등록시 평점을 실시간으로 증가시켜준다.
        let addrating = parseInt(rating);
        let score = parseInt(document.querySelector('.bscore').textContent);
        score -= addrating;
        score = String(score);
        console.log(score);
        document.querySelector('.bscore').textContent = score;
    }

    function readReply(){
        let commentList;
        fetch("http://localhost/happyfrog/read/replies/"+bno,{
            headers: {
                "Content-Type": "application/json;charset=utf-8",
            }
        })
        .then((response) => response.json())
        .then((data) => reply = data)
        .then(() =>{
            commentList = document.querySelector(".commentList");
            commentList.innerHTML ="";
            let str = "";
            let writer = document.getElementById("nickName").value;
            let replyLength;
            totalReplyCnt = reply.length;
            if(5 * moreReply <= totalReplyCnt){
                replyLength = 5 * moreReply;
            }else{
                replyLength = totalReplyCnt;
            }

            for (let i = 0; i < replyLength; i++) {
                let replyContent = reply[i].reply;
                let star = "";
                let cno = reply[i].cno;
                switch (reply[i].rating) {
                    case 1 :
                        star = ' ⭐';
                        break;
                    case 2 :
                        star = ' ⭐⭐';
                        break;
                    case 3 :
                        star = ' ⭐⭐⭐';
                        break;
                    case 4 :
                        star = ' ⭐⭐⭐⭐';
                        break;
                    case 5 :
                        star = ' ⭐⭐⭐⭐⭐';
                        break;
                }
                str += "<div class='comment'>";
                str += "😀";
                str += star;
                str += replyContent;
                if (reply[i].commenter === writer){
                    str += "<button class='replyMod' type='button' onclick='replyModbtn(this)'>";
                    str += "수정</button>";
                }
                str += "<input class='cno' type='hidden' value=";
                str += cno;
                str += ">";
                if (reply[i].commenter === writer) {
                    str += "<button class='replyDel' type='button' onclick='replyDel(this)'>";
                    str += "삭제</button>";
                }
                str += "<input class='rating' type='hidden' value=";
                str += reply[i].rating;
                str += ">";
                str += "</div>";
            }
            // console.log(str);
            commentList.innerHTML = str;

         }
        )
    } //readReply

    function replyadd(){
        let comment = document.getElementById("comment").value;
        let star = document.getElementById("star").value;
        let writer = document.getElementById("nickName").value;
        let ReplyDTO = {
            comment : comment,
            rating : star,
            commenter : writer,
            bno : bno
        }
        // console.log(ReplyDTO);
        fetch("http://localhost/happyfrog/read/replies/",{
            method : "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
            },
            body : JSON.stringify(ReplyDTO)
        })
        .then( () =>      document
            .getElementById("ratingc")
            .style
            .display = "none")
        .then(() => alert("댓글이 등록되었습니다."))
        .then(() => plusScore(star))
        .then(() => readReply())
    } // replyadd


    function replyDel(btn){
        let cno =  btn.previousElementSibling.value;
        let star = btn.nextElementSibling.value;
        console.log(cno);
        console.log(star);

        fetch("http://localhost/happyfrog/read/replies/"+cno,{
            method : "DELETE",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
            }
        })
            .then(() => alert("댓글이 삭제되었습니다."))
            .then(() => minusScore(star))
            .then(() => readReply())
    } // replyDel


    function replyMod(btn){
        let cno = document.querySelector('.modCno').value;
        let comment = document.querySelector('.modCommenter').value;
        let ReplyDTO = {
            cno : cno,
            comment : comment
        }
        console.log(cno);

        fetch("http://localhost/happyfrog/read/replies/"+cno,{
            method : "PATCH",
            headers: {
                "Content-Type": "application/json;charset=utf-8",
            },
            body : JSON.stringify(ReplyDTO)
        })
            .then(() => alert("댓글이 수정되었습니다."))
            .then(() => readReply())
            .then(() => modalClose())
    } // replyMod

</script>
</html>