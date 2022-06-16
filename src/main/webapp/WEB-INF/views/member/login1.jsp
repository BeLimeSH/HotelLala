<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    
    <link rel="stylesheet" href="resources/css/qna.css">
    <link rel="stylesheet" href="resources/css/notice.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
        <a href="./index.html" class="header fixed">Hotel LaLa</a>
        
     
            
            <form action="login" method="post" class="first" onsubmit="return loginValidate()">
                <div class="subtitle" >
                    <h1 class="notice">Sign in</h1>
                    <h4 class="notice_subtitle">라라호텔만의 특별함을 느껴보세요.</h4>
                </div>
                <div class="memberLogin">
                <p class="loginFrm">
                    <span class="alertMessage">아이디를 입력해주세요.</span>
                    <label for="frm_userid" class="hidden">아이디</label>
                    <input type="text" id="frm_userId" name="inputId" placeholder="아이디">
                </p>
                <p class="loginFrm">
                    <span class="alertMessage">비밀번호를 입력해주세요.</span>
                    <label for="frm_userpw" class="hidden">비밀번호</label>
                    <input type="password" id="frm_userpw" name="inputPw" placeholder="비밀번호">
                </p>
                <span class="frm">
                    <span class="chkstyle">
                        <i class="fa-solid fa-check"></i>
                        <input type="checkbox" id="idSaveCheck">
                    </span>
                    
                    
                    <%-- 쿠키에 idSaveCheck가 있는 경우--%>
                    <c:if test="${ !empty cookie.idSaveCheck.value}">
                        <%-- chk변수 생성 (page scope)--%>
                        <c:set var="chk" value="checked"/>
                        
                    </c:if>
                    
                    
                    
                    <label for="idSaveCheck">
                        <input type="checkbox"name="idSaveCheck" id="idSaveCheck" ${chk} >아이디 저장</label>
                    </span>
                    <button type="submit" class="loginBtn">로그인</button>
                    <div class="loginLink">
                        <a href="signup.html">회원가입</a>
                        <a href="">아이디/비밀번호 찾기</a>
                    </div>
                </div>
            </form>
            
     
   
            <div class="seconds">
                <a href="#" class="first_bar">
                    <i class="fa-solid fa-x cursor"></i>
                    <p class="cursor" >close</p>
                    <a href="login.html"><p class="login cursor">Login</p></a>
                    <a href="signup.html"><p class="signup cursor">signUp</p></a>
                </a>

            <div class="nav_bar">
                <ul class="list1">
                    <h4>Contact</h4>
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="qna.html">Q&A</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                </ul>
                <br><br>
                <ul class="list2">
                    <h4>Location</h4>
                    <li><a href="location.html">오시는 길</a></li>
                    <!-- <li><a href="#">층별안내</a></li> -->
                    <li><a href="room.html">호텔라라 소개</a></li>
                </ul>
                <br><br><br>

                <ul class="list3">
                    <h1><a href="#" class="white">예약하기</a></h1>
                </ul><br>
                <ul class="list3">
                    <h1><a href="#" class="white">예약확인</a></h1>
                </ul><br>
            </div> 
        </div>

        <div class="third">
                <a href="#" class="seconds_bar">
                    <i class="fa-solid fa-bars cursor"></i>
                    <p class="cursor">MENU</p>
                
                </a>
            <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
            <a href="notice.html"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
        </div>
    </div>
           
    <footer>
        <div class="footert-inner">
            <div class="upper">
                <h1>Hotel LaLa</h1>
                <ul>
                    <li><a href="#">Policy</a></li>
                    <li><a href="#">Terms</a></li>
                    <li><a href="#">Family Site</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas, facere.<br>
                    TEL : 02-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2022 Hotel LaLa &copy; copyright all right reserved.
                </p>
            </div>
        </div>
    </footer>
    
    

    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/member/login.js"></script>
</body>
</html>