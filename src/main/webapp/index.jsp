<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="resources/css/main-style.css" type="text/css">
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
                    <a href="#">로그인</a>
                    <span>|</span>
                    <a href="#">회원가입</a>
                </div>
            </section>
 
            <!-- 호텔 대표 사진 -->
            <section class="mainPhoto">
            </section>
            
        </header>


        <!-- nav -->
        <nav>

            <div class="seconds">
        
                <a href="#" class="first_bar">
                    <i class="fa-solid fa-x cursor"></i>
                    <p class="cursor">close</p>
                <a href="#"><p class="login cursor">Login</p></a>
                <a href="#"><p class="signup cursor">signUp</p></a>
                    
        
                <div class="nav_bar">
        
                    <ul class="list1">
                        <h4>Contact</h4>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">Q&A</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
        
                    <br><br>
        
                    <ul class="list2">
                        <h4>Location</h4>
                        <li><a href="#">오시는 길</a></li>
                        <li><a href="#">호텔라라 소개</a></li>
                    </ul>
        
                    <br><br><br>
        
                    <ul class="list3">
                        <h1><a href="#" class="white">예약하기</a></h1>
                    </ul>
                    
                    <br>
        
                    <ul class="list3">
                        <h1><a href="#" class="white">예약확인</a></h1>
                    </ul>
                    
                    <br>
        
                </div> 
            </div>
        
            <div class="third">
        
                <a href="#" class="seconds_bar">
                    <i class="fa-solid fa-bars cursor"></i>
                    <p class="cursor" style="color:black;">MENU</p>
                </a>
        
                <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
                <a href="#"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
            </div>

        </nav>
        

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
                    <a href="#">▶ Go to offer</a>

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

    <script src="resources/js/main.js"></script>

</body>
</html>