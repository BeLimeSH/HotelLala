<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/nav.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div class="seconds">
        <a href="#" class="first_bar">
            <i class="fa-solid fa-x cursor"></i>
            <p class="cursor">close</p>
           <a href="login.html"><p class="login cursor">Login</p></a>
           <a href="signup.html"><p class="signup cursor">signUp</p></a>
            

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
                <p class="cursor" style="color:black;">MENU</p>
            
            </a>
        <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
        <a href="notice.html"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
    </div>
</div>
    <script src="resources/js/main.js"></script>
</body>
</html>