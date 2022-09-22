<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/happyfrog/resources/css/info.css" rel="stylesheet">
</head>
<body>
<div class="grid-container">
    <!-- header -->
    <jsp:include page="header.jsp"/>
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