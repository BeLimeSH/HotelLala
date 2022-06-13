<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation-style.css" type="text/css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">

    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <!-- 헤더 비슷한 거 -->
    <a href="${contextPath}" class="hotelLogo">
        <img src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
    </a>

    <!-- nav -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

    <main>

        <section class="reserveSection" id="pageBarSection">
            <!-- 페이지 표시 -->
            <ul id="pagination">
                <li class="pageNum">1</li>
                <li class="pageNum currentPage">2</li>
                <li class="pageNum">3</li>
                <li class="pageNum">4</li>

                <div class="reserveTitle" id="pageDef-2">객실 선택</div>
            </ul>

        </section>

        <section class="reserveSection">
            <!-- 날짜 표시 바 -->
            <div class="dateSelection" name="dateSelection" action="reservation-option.html">

                <div>
                    <div class="reserveTitle">CHECK IN / OUT</div>

                    <span class="reserveContent" id="date-span">${reservation.checkIn} ~ ${reservation.checkOut}</span>

                    <span class="reserveContent" id="dividingBar">|</span>

                    <span class="reserveContent" id="dateRange-span">${reservation.dateRange}</span>
                    <span class="reserveContent">박</span>
                </div>

                <div class="dividing-col"></div>

                <label>
                    <div class="reserveTitle">성인</div>

                    <div class="reserveCount">
                        <span class="reserveContent">${reservation.adultCount}</span>
                    </div>
                </label>
                
                <label>
                    <div class="reserveTitle">어린이</div>
                    
                    <div class="reserveCount">
                        <span class="reserveContent">${reservation.childCount}</span>
                    </div>
                </label>

                <!-- 이전페이지로 돌아가기 -->
                <button id="dateUpdateBtn" onclick="history.back();">날짜 수정</button>
                
            </div>
        </section>


        <section class="reserveSection">
            
            <!-- 객실 조회 -->
            <article id="selectRoom" class="selectionContents">

                <div class="selectbox-area">
                    <select name="selectbox-room" id="">
                        <option value="최신 순">최신 순</option>
                        <option value="낮은 가격 순">낮은 가격 순</option>
                        <option value="높은 가격 순">높은 가격 순</option>
                    </select>
                </div>

                <div class="dividing-row"></div>

                <!-- 1번 객실 -->
                <ul id="roomList">

                    <!-- 조회된 객실이 없을 때 -->
                    <div class="unavailable">해당 날짜에 이용 가능한 객실이 없습니다.</div>


                    <!-- li태그 생성 > div태그 2개 생성(첫 div는 class roomBox/ 두번째는 dividing-row)
                        > div 3개 생성
                    
                    -->
                    <!-- <li>
                        <div class="roomBox">
                            <div>
                                <img src="">
                            </div>

                            <div>
                                <div class="room-tit">객실 종류</div>

                                <a href="#" class="room-detail">▶ 객실 자세히 보기</a>
                            </div>

                            <div>
                                <div class="room-tit">가격</div>
                                <div class="room-content">1박</div>
                                <button class="reserveBtn">예약하기</button>
                            </div>

                        </div>
                        <div class="dividing-row"></div>
                    </li> -->
                    
                </ul>

            </article>
            
        </section>

    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/reservation/selectedRoom.js"></script>
    
</body>
</html>