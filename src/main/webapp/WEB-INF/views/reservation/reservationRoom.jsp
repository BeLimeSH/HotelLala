<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="../../resources/css/main-style.css" type="text/css">
    <link rel="stylesheet" href="../../resources/css/reservation-style.css" type="text/css">

    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <main>
        <!-- 네비게이션 -->

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

                    <span class="reserveContent" id="date-span">2022/06/07 - 2022/06/08</span>

                    <span class="reserveContent" id="dividingBar">|</span>

                    <span class="reserveContent" id="dateRange-span">1</span>
                    <span class="reserveContent">박</span>
                </div>

                <div class="dividing-col"></div>

                <label>
                    <div class="reserveTitle">성인</div>

                    <div class="reserveCount">
                        <span class="reserveContent">1</span>
                    </div>
                </label>
                
                <label>
                    <div class="reserveTitle">어린이</div>
                    
                    <div class="reserveCount">
                        <span class="reserveContent">0</span>
                    </div>
                </label>

                <!-- 이전페이지로 돌아가기 -->
                <button id="dateUpdateBtn">날짜 수정</button>
                
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
                <!-- <ul id="roomList">

                    <li>
                        <div class="roomBox">
                            <div>
                                <a href="#">
                                    <img src="" alt="객실사진">
                                </a>
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
                    </li>
                    
                </ul> -->

                <!-- 조회된 객실이 없을 때 -->
                <div class="unavailable">해당 날짜에 이용 가능한 객실이 없습니다.</div>

            </article>
            
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

    <script src="../../resources/js/reservation/selectedRoom.js"></script>
    
</body>
</html>