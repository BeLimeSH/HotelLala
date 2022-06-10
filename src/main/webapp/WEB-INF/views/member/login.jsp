<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/login.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
    <title>Login</title>
</head>
<body>

    <main>
    <section>

    <form action="login" method="POST" name="login-form" onsubmit="return loginVaildate()"></form>
    
    <div class="first">
        <h1 class="notice">Sing in</h1>
        <h4 class="notice_subtitle">라라호텔만의 특별함을 느껴보세요.</h4>
        <div class="memberLogin">
            <p class="loginFrm">
                <span class="alertMessage">아이디를 입력해주세요.</span>
                <label for="frm_userid" class="hidden">아이디</label>
                <input type="text"name="userId" id="frm_userId" placeholder="아이디" value="${cookie.idSaveCheck.value}">
            </p>
            <p class="loginFrm">
                <span class="alertMessage">비밀번호를 입력해주세요.</span>
                <label for="frm_userpw" class="hidden">비밀번호</label>
                <input type="password" name="userPw" id="frm_userPw" placeholder="비밀번호">
            </p>
            <span class="frm">
                <span class="chkstyle">
                    <i class="fa-solid fa-check"></i>
                    <input type="checkbox" name="idSaveCheck" id="idSaveCheck">
                </span>
                <label for="idSaveCheck">아이디 저장</label>
            </span>
            <button type="button" class="loginBtn">로그인</button>
            <div class="loginLink">
                <a href="#">회원가입</a>
                <a href="#">아이디/비밀번호 찾기</a>
            </div>
        </div>
    </div>
</section>

</main>


<%-- 쿠키에 idSaveCheck가 있는 경우--%>
    <c:if test="${ !empty cookie.idSaveCheck.value}">
        <%-- chk변수 생성 (page scope)--%>
        <c:set var="chk" value="checked"/>

    </c:if>

    
    <script src="${contextPath}/resources/js/member/login.js"></script>
</body>
</html>