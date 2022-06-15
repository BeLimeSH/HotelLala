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

        <!-- 예약페이지 내용 -->
        <section class="reserveSection" id="pageBarSection">
            <!-- 페이지 표시 -->
            <ul id="pagination">
                <li class="pageNum currentPage">1</li>
                <li class="pageNum">2</li>
                <li class="pageNum">3</li>

                <div class="reserveTitle" id="pageDef-1">날짜 & 인원 선택</div>
            </ul>

        </section>

        <!-- ---------------------------------------------------------------------------------------------------------- -->

        <section class="reserveSection">
            <!-- 날짜 선택 바 -->
            <div class="dateSelection">

                <div>
                    <div class="reserveTitle">CHECK IN / OUT</div>
                    <!-- 날짜 선택 input!! -->
                    <input type="text" id="reserve-datepicker" class="reserveContent" name="reserveDate" readonly>

                    <span class="reserveContent" id="dividingBar">|</span>

                    <input type="text" id="dateRange" name="dateRange" class="reserveContent" value="1" readonly>
                    <span class="reserveContent">박</span>
                </div>

                <div class="dividing-col"></div>

                <label>
                    <div class="reserveTitle">성인</div>

                    <div class="reserveCount">
                        <input type="number" value="0" class="head-input reserveContent" id="adultCount" name="adultCount" readonly>
                    </div>
                </label>
                
                <label>
                    <div class="reserveTitle">어린이</div>
                    
                    <div class="reserveCount">
                        <input type="number" value="0" class="head-input reserveContent" id="childCount" name="childCount" readonly>
                    </div>
                </label>

                <button id="roomSearchBtn">객실 검색</button>
                
            </div>
        </section>

        <section class="reserveSection removeResource" id="headcountBox">
            <!-- 객실 인원 수 선택 -->
            <article class="selectionContents">

                <div class="roomCount">
                    <div class="roomCount-tit">인원 선택</div>

                    <div class="roomCount-con">
                        <div>
                            <span class="roomCount-tit">성인</span>

                            <button class="roomCount-el minusBtn">
                                <i class="fa-solid fa-minus"></i>    
                            </button>

                            <span class="roomCount-el" id="adultCount-span">0</span>

                            <button class="roomCount-el plusBtn">
                                <i class="fa-solid fa-plus"></i>    
                            </button>
                        </div>
    
                        <div>
                            <span class="roomCount-tit">어린이</span>

                            <button class="roomCount-el minusBtn"><i class="fa-solid fa-minus"></i></button>

                            <span class="roomCount-el" id="childCount-span">0</span>

                            <button class="roomCount-el plusBtn"><i class="fa-solid fa-plus"></i></button>
                        </div>
                    </div>

                    <div class="count-btn-area">
                        <button id="countBtn">저장</button>
                    </div>
                </div>
                
            </article>
        </section>

        <!-- ---------------------------------------------------------------------------------------------------------- -->

        <!-- 메세지 -->
        <section class="reserveSection">

            <!-- 객실 조회 -->
            <article id="selectRoom" class="selectionContents">
                
                <div id="dateMessage">
                    예약 날짜와 인원 수를 선택해주세요.
                </div>

                <!-- 객실 리스트 조회 위치 -->
                <ul id="roomList"></ul>

            </article>
        </section>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <!-- js에 전역변수로 contextPath 선언 -->
    <script>
        const contextPath = "${contextPath}";
        const dateRangeR = "${reservation.dateRange}"
    </script>

    <script src="${contextPath}/resources/js/reservation/selectedDate.js"></script>
    <script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>