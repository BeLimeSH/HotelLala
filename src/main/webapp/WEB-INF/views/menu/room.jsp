<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna2.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/room.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
   
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">

        <div class="logo">
	        <a href="${contextPath}">
				<img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
	        </a>
        </div>
        <div class="first">
            <div class="first-in">
              <p>ROOMS</p><br><br>
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
                            전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br>                
                        </span>
                    </p>
                    <button type="button">자세히 보기</button>
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
                                전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br>             
                            </span>
                            <button type="button">자세히 보기</button>
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
                                전 객실 테라스에서 푸르른 소나무 전망이나 호수 전망을 감상할 수 있습니다.<br>             
                            </span>
                            <button type="button">자세히 보기</button>
                        </p>
                    </div>
                </div>   
        </div> 
    </div>
        

            <jsp:include page="/WEB-INF/views/common/menunav.jsp" />

        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        
    </div>
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="js/room.js"></script>
</body>
</html>