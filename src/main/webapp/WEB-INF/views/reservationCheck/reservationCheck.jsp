<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 조회</title>


    <link rel="stylesheet" href="${contextPath}/resources/css/reservationCheck.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
	<link rel="shortcut icon" href="/HotelLala/resources/images/wIcon.ico">
    <link rel="shortcut icon" href="${contextPath}/resources/images/logo-icon-black.png">
    
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>

    <!-- header -->
    <a href="${contextPath}" class="hotelLogo">
        <img src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
    </a>

    <!-- nav -->
    <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
    
    
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
                               
                <form action="cancel" method="POST" onsubmit="return cancelConfirmValidate()">
                    
                    <div class="contain">

                    <!-- daterangepicker -->
                    <table>
                        <tr>
                        <td colspan="3">
                            <div class="dateBtn">
                                <span class="chkbox2">
                                    <!-- <button class="w-btn-outline w-btn-blue-outline" type="button">예약 취소</button> -->
                                    <input type="button" name="dateType" id="dateType5" class="btn btn-default btn-sm" onclick="setSearchDate('3m')" value="3개월"/>
                                </span>
                                <span class="chkbox2">
                                    <input type="button" name="dateType" id="dateType6" class="btn btn-default btn-sm" onclick="setSearchDate('6m')" value="6개월"/>
                                </span>
                                <span class="chkbox2">
                                    <input type="button" name="dateType" id="dateType7" class="btn btn-default btn-sm" onclick="setSearchDate('1y')" value="12개월"/>
                                </span>

                                <input class="datepicker">

                            </div>
                        </td>
                    </tr>
                    
                        
                    </table>

    
                    <!-- 예약 조회 -->  
                    <div class="rsvCheck-myPageRsv">
                        <div class="myRsv title">
                            <h4 class="tit2"><a>객실 예약</a></h4>
                        </div>
                
                        <table summary="주문번호, 예약상태, 결제번호, 객실종류, 객실호수로 구성된 리스트 표" class="rsvList">
                            <thead>
                                <tr>
                                    <th>예약 번호</th>
                                    <th>주문 번호</th>
                                    <th>예약 상태</th>
                                    <th>결제 번호</th>
                                    <th>객실 종류</th>
                                    <th>객실 호수</th>
                                </tr>
                            </thead>
                        </table>                             


                        <div class="list-wrapper">
                            <table class="list-table">                         
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty reserveCheck}">
                                            <!--  예약 조회 결과가 비어있다면 -->
                                            <tr>
                                                <td colspan="5" class="reserveNothing">예약 내역이 존재하지 않습니다.</th>
                                            </tr>
                                        </c:when>

                                        <c:otherwise>
                                            <c:forEach var="reserve" items="${rsvList}">
                                                <table class="rsvList">
                                                    <tr>
                                                        <td>${reserve.reservationNo}</td>
                                                        <td>${reserve.requestNo}</td>
                                                        <td>${reserve.reservationFl}</td>
                                                        <td>${reserve.paymentNo}</td>
                                                        <td>${reserve.roomNo}</td>
                                                    </tr>
                                                </table>
                                            </c:forEach>   
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table><br>
                            
                            <c:if test="${loginMember.requestNo == reservation.requestNo}">
                                <div class="cancel-btn-area">
                                <button class="w-btn-outline w-btn-blue-outline" id="cancelBtn" type="button">예약 취소</button>
                                </div>
                            </c:if>
							
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


	<!-- datepicker CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


	<script>
        const contextPath = "${contextPath}";
    </script>
	
	<!-- nav 메인 js -->
    <script src="${contextPath}/resources/js/main.js"></script>
    
    <!-- 예약 조회, 취소 검사 -->
    <script src="${contextPath}/resources/js/reservationCheck/reserveCheck.js"></script>
    
    <!-- datepicker js -->
    <script src="${contextPath}/resources/js/reservationCheck/dateCheck.js"></script>
    
    
    
</body>
</html>