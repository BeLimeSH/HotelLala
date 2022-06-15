<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 취소</title>

    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style-rsvCancel.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation-cancel-style.css" type="text/css">

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

        <section class="reserveCancelTitleSection">

            <div class="dateSelection" name="dateSelection">

                <div>
                    <div class="reserve-Title">취소가 완료되었습니다.</div>

                    <span>결제 일시 : ${contextPath}${payment.paymentDT}</span><br>
                    <span>환불 요청 일시 : ${contextPath}${refund.refundDT}</span>

                </div>
            </div>
        </section>


        <section class="reserveCancelSection">

            <section id="selectRoom" class="selectionContents">

                
                <div class="cancelTitle">취소 내역</div>
                    
                    <span class="cancelTitle-notice">취소 수수료는 실결제 금액과 포인트에 적용되며 환불 규정을 따릅니다.</span>
                    <a></a>
                    
                <div class="cancelSubTitle">총 환불액
                    <div class="totalPay">${payment.paymentAmount}</div>
                </div>

                <div class="cancelSub">환불금액
                    <div class="subPay">${refund.refundAmount}</div>
                </div>

                <div class="cancelSub">환불포인트
                    <span class="cancelTitle-notice-sub">당일 환불은 불가하며<br>환불 시 사용된 포인트는 반환되지 않습니다.</span>
                </div>

                <a></a>

                <div class="cancelSubTitle">총 예약가
                    <div class="totalPay">${payment.paymentAmount}</div>
                </div>

                <div class="cancelSub">실결제 금액
                    <div class="subPay2">${payment.paymentAmount}</div>
                </div>

                <div class="cancelSub">포인트사용
                    <div class="subPoint"></div>
                </div>

            </section>

    </main>
    
     <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  	<script src="${contextPath}/resources/js/main.js"></script>
    
</body>
</html>