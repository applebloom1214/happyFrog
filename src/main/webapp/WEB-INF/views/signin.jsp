<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/happyfrog/resources/css/signin.css" rel="stylesheet">

</head>
<body>
<div class="grid-container">
    <!-- header -->
    <jsp:include page="header.jsp"/>
    <form action="<c:url value="/signin"/>" method="post">
    <div class="grid-item signin">
        <div class="container">
            <h1>회원 가입</h1>
            <p>회원 가입을 위해 빈칸을 채워주세요</p>
            <hr>

            <label for="userid">
                <b>아이디</b>
            </label>
            <input type="text" placeholder="아이디를 입력해주세요" id="userid" name="id" required="required">

            <label for="pw">
                <b>비밀번호</b>
            </label>
            <input
                    type="password"
                    placeholder="비밀번호를 입력해주세요"
                    id="pw"
                    name="pw"
                    required="required">

            <label for="pw-repeat">
                <b>비밀번호 확인</b>
            </label>
            <input
                    type="password"
                    placeholder="비밀번호를 다시 한번 입력해주세요"
                    id="pw-repeat"
                    required="required">

            <label for="nickname">
                <b>닉네임</b>
            </label>
            <input type="text" placeholder="닉네임을 입력해주세요" id="nickname" name="nickname" required="required">

            <label for="introduce">
                <b>한줄소개</b>
            </label>
            <input type="text" placeholder="간단하게 소개를 해주세요" id="introduce" name="introduce" required="required">

            <div class="clearfix">
                <button type="submit" class="signupbtn">회원 가입</button>
                <button type="button" class="cancelbtn" onclick="location.href='<c:url value='/'/>';">취소</button>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
<script>

</script>
</html>