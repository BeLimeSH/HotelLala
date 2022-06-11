<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>

<body>

    <main>

        <header>
            <!-- 헤더 -->
            <section class="headArea">
                <div></div>
                <div>
                    <a href="#">
                        HOTEL LALA
                        <i class="fa-solid fa-cloud-moon"></i>
                    </a>
                </div>
                <div>
                    <a href="login">로그인</a>
                    <span>|</span>
                    <a href="signUp">회원가입</a>
                </div>
            </section>

            <!-- 그라데이션 효과용 div -->
            <div class="gradation"></div>
       
            <!-- 호텔 대표 사진 -->
            <section class="mainPhoto">
                
                <img src="resources/images/main/mainPhoto1.jpg" class="slide" style="z-index: -1;">
                <img src="resources/images/main/mainPhoto2.jpg" class="slide" style="z-index: -2;">
                <img src="resources/images/main/mainPhoto3.jpg" class="slide" style="z-index: -3;">
                <img src="resources/images/main/mainPhoto4.jpg" class="slide" style="z-index: -4;">
                
            </section>
            
        </header>


        <!-- nav -->
        <jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
        

        <section class="mainContent">
            <!-- 호텔 소개 -->
            <section>

                <article class="mainSection1">
                    <div class="mainTitle">
                        <p class="title">Hotel Info</p>
                    </div>
                    
                    <!-- 사진 슬라이드 -->
                    <div id="slideShow">
                        <button><i class="fa-solid fa-chevron-left"></i></button>
                        <img src="resources/images/main/hall.jpg" alt="호텔사진">
                        <button><i class="fa-solid fa-chevron-right"></i></button>
                    </div>
                </article>

            </section>

            <!-- 상품 안내 -->
            <section>

                <article class="mainSection2">
                    <div class="mainTitle">
                        <p class="title">Package & Service</p>
                    </div>
                    <a href="${contextPath}/reservation/date">▶ Go to offer</a>

                    <div id="mainProduct">
        
                        <li>
                            <a class="product" href="#">
                                <img src="resources/images/main/pool.jpg" alt="수영장"> <br>
                                Pool
                            </a>
                            <div>글자를 적어 봅시다.</div>
                        </li>
                        
                        <li>
                            <a class="product" href="#">
                                <img src="resources/images/main/dinner.jpg" alt="음식"> <br>
                                Special Dinner
                            </a>
                            <div>글자를 적어 봅시다.</div>
                        </li>
                        
                        <li>
                            <a class="product" href="#">
                                <img src="resources/images/main/room.jpg" alt="방"> <br>
                                Room
                            </a>
                            <div>글자를 적어 봅시다.</div>
                        </li>
                        
                    </div>
                </article>
            </section>

            <!-- 회원 가입 -->
            <section>
                <article class="mainSection3">

                    <img class="dividing-line" src="resources/images/main/leaf-dividing-line.png" alt="구분선">
                    
                    <div class="mainTitle">
                        <p class="title">CLUB LaLa</p>
                    </div>
                    
                    <p id="club-text">
                        지금 CLUB LaLa에 가입하셔서<br>회원만을 위한 특별한 혜택을 확인해 보세요
                    </p>

                    <div id="mainBtn">
                        <a id="joinBtn" href="#">join</a>
                    </div>

                    <img class="dividing-line" src="resources/images/main/leaf-dividing-line.png" alt="구분선">

                </article>
            </section>

        </section>

        <!-- footer -->
        <footer>
            <div class="inner">
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

    </main>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="resources/js/main.js"></script>

</body>
</html>