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
    <form action="<c:url value="/signin"/>" method="post" onsubmit="return formCheck()">
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
                    name = "pw-repeat"
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
    function formCheck(){
        let id = document.querySelector("#userid").value;
        let pw = document.querySelector("#pw").value;
        let pw2 = document.querySelector("#pw-repeat").value;

        if(pw != pw2){
            alert("비밀번호가 일치하지 않습니다.")
            return false;
        }

        if(id.length < 4){
            alert("아이디는 4글자 이상이어야 합니다")
            return false;
        }

        if(pw.length < 4){
            alert("비밀번호는 4글자 이상이어야 합니다")
            return false;
        }

        alert("회원가입이 완료되었습니다.")
        return true;
    }

</script>
</html>