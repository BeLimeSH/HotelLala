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
        <!-- 페이지 표시 -->
        <section class="reserveSection" id="pageBarSection">
            <ul id="pagination">
                <li class="pageNum">1</li>
                <li class="pageNum">2</li>
                <li class="pageNum currentPage">3</li>
                <li class="pageNum">4</li>

                <div class="reserveTitle" id="pageDef-3">옵션 선택</div>
            </ul>
        </section>

        <form action="reservation-payment.html" onsubmit="return reqValidate()">
            <!-- 옵션 영역 -->
            <section class="reserveSection">
                
                <section id="optionBox" class="selectionContents">
                    <div class="payment-tit">옵션 선택</div>
                    
                    <div class="payment-con" id="option-div">
                        <div>
                            <ul class="option-con">
                                <li class="payment-list">옵션 사항</li>

                                
                                <li>
                                    <div class="payment-list">성인 조식 / 15,000원</div>
                                    
                                    <div class="btn-area">
                                        <button type="button" class="minusBtn"><i class="fa-solid fa-minus"></i></button>
                                        <input type="number" class="payment-list" name="adultBreakfast" id="a-breakfast" value="0" readonly>
                                        <button type="button" class="plusBtn"><i class="fa-solid fa-plus"></i></button>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="payment-list">어린이 조식 / 10,000원</div>
                                    
                                    <div class="btn-area">
                                        <button type="button" class="minusBtn"><i class="fa-solid fa-minus"></i></button>
                                        <input type="number" class="payment-list" name="childBreakfast" id="c-breakfast" value="0" readonly>
                                        <button type="button" class="plusBtn"><i class="fa-solid fa-plus"></i></button>
                                    </div>
                                </li>
                                
                                <li>
                                    <div class="payment-list">엑스트라 베드 / 65,000원</div>
                                    
                                    <div class="btn-area">
                                        <button type="button" class="minusBtn"><i class="fa-solid fa-minus"></i></button>
                                        <input type="number" class="payment-list" name="extraBed" id="extra-bed" value="0" readonly>
                                        <button type="button" class="plusBtn"><i class="fa-solid fa-plus"></i></button>
                                    </div>
                                </li>
                            </ul>
                            <span class="extra-note">
                                * 조식은 객실 기준 인원수에 따라 제공되므로 추가 인원에 대한 조식만 <br>
                                &nbsp; 선택해주시기 바랍니다. <br>
                                * 37개월 미만의 유아 동반 시 조식에 대한 요금은 무료입니다.
                            </span>
                        </div>
    
                        <div class="dividing-col"></div>
                        
                        <div>
                            <div class="payment-list" id="option-req">추가 요청사항</div>
                            
                            <div id="req-input-area">
                                <!-- trim()으로 공백을 뺀 문자만 정규표현식으로 검사! 
                                    -> 특수문자 잘못 들어갔을 경우 alert로 경고, sudmit X -->
                                <textarea id="req-input" maxlength="200"></textarea>
                                <!-- class="removeResource" -->
                                <input type="text" name="extraRequest" id="extra-request">
                                <button type="button" id="req-reset-btn">초기화</button>
                            </div>
                            <span class="extra-note">
                                * 특수문자, 이모티콘 없이 글자만 입력해주세요(.,!? 제외, 200자 제한)
                            </span>
                        </div>
                    </div>
                </section>
                
                <!-- 유의사항 & 환불 규정 -->
                <jsp:include page="/WEB-INF/views/common/ruleBox.jsp"/>
    
            </section>

            <!-- 결제 금액 영역 -->
            <section class="payment-area">
                <div>
                    <div class="payment-div1">
                        금액 <span class="room-rates">100,000</span> 원               
                    </div>
                    
                    <div class="payment-div2">
                        <button onclick="history.back();">이전 페이지로</button>
                        
                        <button>예약하기</button>
                    </div>
                </div>
            </section>
        </form>

    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="${contextPath}/resources/js/reservation/option.js"></script>
    
</body>
</html>