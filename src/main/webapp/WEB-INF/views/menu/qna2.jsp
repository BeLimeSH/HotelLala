<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <link rel="stylesheet" href="css/qna.css">
    <link rel="stylesheet" href="css/faq.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    
        <div class="container">
            <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
            <a href="./index.html" class="header fixed">Hotel LaLa</a>
            <div class="first">
                <div class="inners">
                    <h1>FAQ</h1>
                </div>
            </div>
            
            <section class="faq_wrapper">
                <div class="tab_wrapper">
                    <div class="tab">
                        <div class="tab_menu_wrap">
                            
                                <button class="tab-menu-link active1">번호</button>
                                <button class="tab-menu-link">제목</button>
                                <button class="tab-menu-link">등록일</button>
                          
                        </div>
                        <div class="tab-bar">
                            <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn">
                                        <div class="accordion-title"> 
                                            

                                                <div></p class="p1">${board.boardTitle}</p></div>
                                                <div></p class="p1">${board.boardContent}</p></div>
                                                <div></p class="p1">${board.createDate}</p></div>
                                        
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>라라호텔 객실 예약 대표 전화와 홈페이지 그리고 여행사를 통해 예약 가능합니다.
                                                <br>
                                                전화예약 : 02-1234-1234 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            </div>
           <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>
            
        </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="js/index.js"></script>
    <script src="js/faq.js"></script>
</body>
</html>