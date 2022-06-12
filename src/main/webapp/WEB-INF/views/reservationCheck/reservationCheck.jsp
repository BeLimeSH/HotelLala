<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>조회</title>

    <link rel="stylesheet" href="resources/css/reservationCheck.css" type="text/css">
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <header>
        <!-- 헤더 -->
        <section class="headArea">
            <div></div>
            <div>
                <a href="#">
                    <img src="${contextPath}/resources/images/logo/logo-white-width.png" alt="logo">
                </a>
            </div>

            <c:if test="${empty SessionScope.loginMember}">

                <div>
                    <a href="login">로그인</a>
                    <span>|</span>
                    <a href="signUp">회원가입</a>
                </div>

            </c:if>

            <c:if test="${!empty SessionScope.loginMember}">

                <div>
                    <a href="#">로그아웃</a>
                    <span>|</span>
                    <a href="myPage">마이페이지</a>
                </div>

            </c:if>

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

    <!-- 좌측 최상단 로고(클릭 시 index) -->
    <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
        <a href="/index.html" class="header fixed">Hotel LaLa</a>
        <main>
            <!-- 조회 탭 -->
            <section class="myPage-content">
                
                <!-- 왼쪽 사이드(마이페이지) 메뉴 -->
                <section class="left-side">
                    <div class="myPageMenu">
                        <h2 class="tit"><a>마이페이지</a></h2>
                        <ul class="list-group">
                            <li class=""><a href="#">예약 확인/취소</a></li>
                        </ul><br>
    
                        <ul class="list-group">
                            <h2 class="tit"><a>내 정보</a></h2>
    
                            <li class="my">
                                <a href="">
                                    <span>프로필 수정</span>
                                </a>
                            </li>
                            <li class="my">
                                <a href="">
                                    <span>비밀번호 변경</span>
                                </a>
                            </li>
                            <li class="my">
                                <a href="">
                                    <span>문의 내역</span>
                                </a>
                            </li>
                            <li class="my">
                                <a href="">
                                    <span>회원탈퇴</span>
                                </a>
                            </li>
                        </ul>
                            
                    </div>
                    </section>
    
                <!-- 오른쪽 예약 확인 주요 내용 부분 -->
                <section class="myPage-main">
                    <h1 class="myPage-title">예약 확인/취소</h1>
                    <div class="rsv-Underline"></div>
                    <span class="rsv-explanation">객실 예약 내역을 확인하실 수 있습니다.</span><br>
    
    
                    <div class="contain">
                        <div class="mypageWrap">
    
                            <!-- daterangepicker -->
                            <input type="date" name="startDate" id="startDate">
                            <input type="date" name="endDate" id="endDate">
    
                            <!-- 예약 조회 -->  
                            <div class="rsvCheck-myPageRsv">
                                <div class="myRsv title">
                                    <h4 class="tit2"><a>객실 예약</a></h4>
                                </div>
                                
                                
                                <div class="count">Total : 0</div>
                                
    
                                <table summary="주문번호, 예약상태, 결제번호, 객실종류, 객실호수로 구성된 리스트 표"
                                        class="rsvList">
                                    <colgroup>
                                        <col width="10%" class="col1">
                                        <col width="10%" class="col2">
                                        <col width="10%" class="col3">
                                        <col width="10%" class="col4">
                                        <col width="10%" class="col5">
                                        <col width="10%" class="col6"> 
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <br>
                                            <th>예약 번호</th>
                                            <th scope="col">주문 번호</th>
                                            <th scope="col">예약 상태</th>
                                            <th scope="col">결제 번호</th>
                                            <th scope="col">객실 종류</th>
                                            <th scope="col">객실 호수</th>
                                        </tr>
                                    </thead>
                                </table>                         
                                
                            </div>
                            <!--  -->
                            <div class="list-wrapper">
                                <table class="list-table">
                                    <colgroup>
                                        <col width="10%" class="col1">
                                        <col width="10%" class="col2">
                                        <col width="10%" class="col3">
                                        <col width="10%" class="col4">
                                        <col width="10%" class="col5">
                                        <col width="10%" class="col6">  
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="col">0001</th>
                                            <th scope="col">0001</th>
                                            <th scope="col">Y</th>
                                            <th scope="col">OR202206110925140</th>
                                            <th scope="col">standard</th>
                                            <th scope="col">R403</th>
                                        </tr>
                                    </tbody>
                                </table><br>
    
                                <button class="search" id="">조회</button>
                            </div>
                        </div>
                    </div>
    
                </section>
                
            </section>
    
        </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/reservationCheck/reservationCheck.js"></script>
</body>
</html>