<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/room.css">
   
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">

        <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
        <a href="./index.html" class="header fixed">Hotel LaLa</a>
        <div class="first">
            <div class="first-in">
              <p style="margin-left:130px">ROOMS</p><br><br>
              <div class="img1">
                  <img src="${contextPath}/resources/images/room/호텔3.jpg" alt="">
                  <img src="${contextPath}/resources/images/room/호텔3-1.jpg" alt="">
              </div>
              <div class="room-in">
                <div>
                    <h3>주니어 스위트 싱글</h3>
                </div>
                <div>
                    <p>
                        <span>
                            편한 밤을 보내기 위한 최적의 침실과 깔끔함이 결합된 객실입니다.<br>
                            전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br><br>
                            ㆍ혼자만의 시간을 마음껏 누릴 수 있는 객실<br>
                            ㆍ불안정한 마음을 안정시킬 수 있는 객실                 
                        </span>
                    </p>
                </div>
                <div class="img2">
                    <img src="${contextPath}/resources/images/room/호텔2-1.jpg" alt="">
                    <img src="${contextPath}/resources/images/room/호텔2.jpg" alt="">
                </div>
                <div class="room-in">
                    <div>
                        <h3>디럭스 더블</h3>
                    </div>
                    <div>
                        <p>
                            <span>
                                여유로운 혼자만의 여행 혹은 커플여행객을 위한 객실로서 더블침대로 구성되어 있습니다.<br>
                                전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br><br>
                                ㆍ푸르른 소나무 전망이나 호수 전망을 감상할 수 있는 객실<br>
                                ㆍ불안정한 마음을 안정시킬 수 있는 객실                 
                            </span>
                        </p>
                    </div>
                </div>   
                <div class="img3">
                    <img src="${contextPath}/resources/images/room/호텔4.jpg" alt="">
                    <img src="${contextPath}/resources/images/room/호텔4-1.jpg" alt="">
                </div>
                <div class="room-in">
                    <div>
                        <h3>디럭스 더블</h3>
                    </div>
                    <div>
                        <p>
                            <span>
                                여유로운 혼자만의 여행 혹은 커플여행객을 위한 객실로서 더블침대로 구성되어 있습니다.<br>
                                전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br><br>
                                ㆍ푸르른 소나무 전망이나 호수 전망을 감상할 수 있는 객실<br>
                                ㆍ불안정한 마음을 안정시킬 수 있는 객실                 
                            </span>
                        </p>
                    </div>
                </div>   
        </div> 
    </div>
        
        <div class="seconds">
            <a href="#" class="first_bar">
                <i class="fa-solid fa-x cursor"></i>
                <p class="cursor" style="">close</p>
                <a href="login.html"><p class="login cursor">Login</p></a>
                <a href="signup.html"><p class="signup cursor">signUp</p></a>
            </a>

            <jsp:include page="/WEB-INF/views/common/nav.jsp" />

        <div class="third">
                <a href="#" class="seconds_bar">
                    <i class="fa-solid fa-bars cursor"></i>
                    <p class="cursor">MENU</p>
                
                </a>
            <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
            <a href="notice.html"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
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
    </div>
    
    <script src="js/index.js"></script>
    <script src="js/room.js"></script>
</body>
</html>