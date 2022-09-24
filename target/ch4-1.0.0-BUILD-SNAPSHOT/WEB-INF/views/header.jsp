<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!-- 로고, 인포, 회원가입, 로그인/로그아웃 -->
<div class="grid-item">
    <div class="header">
        <div class="logo">
            <img src="/happyfrog/resources/images/frog.png">
            <span>HappyFrog 0.0</span>
        </div>
        <div class="header-right">
            <a class="active" href="<c:url value='/'/>">Home</a>
            <a href="<c:url value='/signin'/>">SignUp</a>
            <a href="<c:url value='/login'/>">Login</a>
        </div>
    </div>
</div>