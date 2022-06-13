<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 조회</title>

    <link rel="shortcut icon" href="${contextPath}/resources/images/logo-icon-black.png">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    <link rel="stylesheet" href="${contextPath}resources/css/reservationCheck.css" type="text/css">

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
                <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
    
                <!-- 오른쪽 예약 확인 주요 내용 부분 -->
                <section class="myPage-main">

                    <h1 class="myPage-title">예약 확인/취소</h1>
                    <div class="rsv-Underline"></div>
                    <span class="rsv-explanation">객실 예약 내역을 확인하실 수 있습니다.</span><br>
                    
                    
                    <form action="cancel" method="POST" onsubmit="return cancelConfirmValidate()">
                        <div class="contain">
                            <div class="mypageWrap">
        
                                <!-- daterangepicker -->
                                <table>
                                    <tr>
                                    <td colspan="3">
                                        <div class="dateBtn">
                                            <span class="chkbox2">
                                                <input type="button" name="dateType" id="dateType5" class="btn btn-default btn-sm" onclick="setSearchDate('3m')" value="3개월"/>
                                            </span>
                                            <span class="chkbox2">
                                                <input type="button" name="dateType" id="dateType6" class="btn btn-default btn-sm" onclick="setSearchDate('6m')" value="6개월"/>
                                            </span>
                                            <span class="chkbox2">
                                                <input type="button" name="dateType" id="dateType7" class="btn btn-default btn-sm" onclick="setSearchDate('1y')" value="1년"/>
                                            </span>
                                            <div><br></div>
                                            <div class="clearfix">
                                                <!-- 시작일 -->
                                                <span class="dset">
                                                    <input type="text" class="datepicker inpType" name="startDate" id="date1" value="${sform.startDate}">
                                                    <input type="button" id="dateBtn" class="btn btn-grey btn-sm" value="달력" onclick="$('#date1').datepicker('show');">
                                                </span>
                                                <span class="demi">~</span>
                                                <!-- 종료일 -->
                                                <span class="dset">
                                                    <input type="text" class="datepicker inpType" name="endDate" id="date2" value="${sform.endDate}">
                                                    <input type="button" id="dateBtn" class="btn btn-grey btn-sm" value="달력" onclick="$('#date2').datepicker('show');">
                                                </span>
                                                <button type="button" id="searchBtn" class="btn btn-default btn-sm">검색</button>
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                </table>
        

                                
                                <!-- 예약 조회 -->  
                                <div class="rsvCheck-myPageRsv">
                                    <div class="myRsv title">
                                        <h4 class="tit2"><a>객실 예약</a></h4>
                                    </div>
                                
                            
    
                                <table summary="주문번호, 예약상태, 결제번호, 객실종류, 객실호수로 구성된 리스트 표"
                                        class="rsvList">
                                    <colgroup>
                                        <col width="10%" class="col1">
                                        <col width="10%" class="col2">
                                        <col width="10%" class="col3">
                                        <col width="10%" class="col4">
                                        <col width="10%" class="col5">
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
                                    </colgroup>


                                    <!-- ------------------------ -->
                                    <tbody>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                        </tr>
                                        
                                        
                                        <c:choose>
                                        <c:when test="${empty reserveCheck}">
                                            <!--  예약 조회 결과가 비어있다면 -->
                                            <tr>
                                                <th colspan="5">예약 내역이 존재하지 않습니다.</th>
                                            </tr>
                                        </c:when>

                                        <c:otherwise>
                                        

                                            <c:forEach var="reserve" items="${rsvList}">
                                                <tr>
                                                    <td>${reserve.reservationNo}</td>
                                                    <td>${reserve.requestNo}</td>
                                                    <td>${reserve.reservationFl}</td>
                                                    <td>${reserve.paymentNo}</td>
                                                    <td>${reserve.roomNo}</td>
                                                </tr>
                                            </c:forEach>
                                            
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    </tbody>

                                    <!-- --------------------- -->
                                </table><br>
    
                                <button onclick="cancelReserve(${reserve.reservationNo})">조회</button>
                            </div>
                        </div>
                    </div>
                </form>
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