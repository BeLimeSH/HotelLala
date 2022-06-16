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

                    <span>결제 일시 : ${contextPath}${payment.paymentDate}</span><br>
                    <span>환불 요청 일시 : ${contextPath}${refund.refundDate}</span>

                </div>
            </div>
        </section>


        <section class="reserveCancelSection">

            <section id="selectRoom" class="selectionContents">

                
                <div class="cancelTitle">취소/변경 및 노쇼(No-show) 안내</div>
                    
                    <span class="cancelTitle-notice">숙박 예정일 1일 전 까지는 위약금 없이 취소 및 변경이 가능합니다.</span>
                    <span class="cancelTitle-notice">숙박 예정일 당일 취소/변경 및 노쇼(No-show) 발생 시 예약 금액 환불이 불가능합니다.</span>
                    <a></a>
                    
                <div class="cancelSubTitle">환불금액
                    <div class="totalPay">${payment.paymentAmount}</div>
                </div>

                <div class="cancelSub">환불번호
                    <div class="subPay">${refund.refundNo}</div>
                </div>

                <div class="cancelSub">환불사유
                    <span class="cancelTitle-notice-sub">${refund.refundReason}</span>
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