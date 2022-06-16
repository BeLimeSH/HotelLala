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
        
        <section class="reserveSection">

            <section class="selectionContents" id="completePage">
    
                <!-- 예약 완료 메세지 -->
                <section class="complete-box">
                    <div class="complete-message">
                        예약이 완료되었습니다<br>
                        감사합니다
                    </div>
                </section>
    
                <!-- 객실 정보 -->
                <section class="result-box">
                    <div class="result-tit">객실 정보</div>
                    <div class="result-con">
                        <div class="result-div1">
                            <ul>
                                <li>
                                    <span>예약 일</span>
                                    <span class="result-val">${reservation.checkIn} ~ ${reservation.checkOut} (${reservation.dateRange}박)</span>
                                </li>
                                <li>
                                    <span>예약 인원</span>
                                    <span class="result-val">성인 ${reservation.adultCount} / 어린이 ${reservation.childCount}</span>
                                </li>
                                <li>
                                    <span>예약자명</span>
                                    <span class="result-val">${loginMember.memberName}</span>
                                </li>

                                <li>
                                    <span>객실</span>
                                    <span class="result-val">${reservation.roomType}</span>
                                </li>
                            </ul>
                        </div>

                        <div class="result-div2">
                            <ul>
                                <li>추가 옵션</li>

                                <!-- 값이 없으면 안보이는 부분 -->
                                <div class="selected-option">
                                    <ul>
                                        <li>
                                            <span>성인 조식</span>
                                            <span>${op.adultBreakfast}</span>
                                        </li>

                                        <li>
                                            <span>어린이 조식</span>
                                            <span>${op.childBreakfast}</span>
                                        </li>

                                        <li>
                                            <span>엑스트라 베드</span>
                                            <span>${op.extraBed}</span>
                                        </li>
                                    </ul>
                                </div>

                                <li>요청 사항</li>
                                
                                <!-- 값이 없으면 안보이는 부분 -->
                                <div id="req-result">${reservation.extraBed}</div>
                            </ul>
                        </div>
                    </div>
                </section>
    
                <!-- 결제 정보 -->
                <section class="result-box">
                    <div class="result-tit">결제 정보</div>
                    <div class="result-div3">
                        <ul>
                            <li>
                                <span>결제 방법</span>

                                <c:if test="${payment.payType} == 'card'">
                                    <span class="result-val">신용카드</span>
                                </c:if>

                            </li>
                            <li>
                                <span>결제 시간</span>
                                <span class="result-val">${payment.paymentDate}</span>
                            </li>

                            <!-- 선긋기 -->

                            <li>
                                <span>객실 비용</span>
                                <span class="result-val">${payment.roomRates} 원</span>
                            </li>
                            <li>
                                <span>추가 옵션 비용</span>
                                <span class="result-val" id="optionRates">0원</span>
                            </li>

                        </ul>
                        <div class="complete-pay-box">
                            <span>결제 금액</span>
                            <span class="result-val">${payment.paymentAmount} 원</span>
                        </div>
                    </div>
                </section>
    
                <!-- 버튼 -->
                <section class="result-btn-area">
                    <button onclick="location.href = '${contextPath}'">메인페이지로</button>
                    <button>예약 내역 확인</button>
                </section>
            </section>
        </section>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const optionRates = document.getElementById('optionRates');

        const adultBreakfast = "${op.adultBreakfast}";
        const childBreakfast = "${op.childBreakfast}";
        const extraBed = "${op.extraBed}";

        let sum = 30000*adultBreakfast + 25000*childBreakfast + 65000*extraBed;

        (function(){

            optionRates.innerText = sum;

        })();

    </script>

</body>
</html>