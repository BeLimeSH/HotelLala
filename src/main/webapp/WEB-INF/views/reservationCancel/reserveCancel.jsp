<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel LaLa</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style-test.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/css/reservation-style.css" type="text/css">

    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>

        <section class="reserveCancelTitleSection">

            <div class="dateSelection" name="dateSelection">

                <div>
                    <div class="reserve-Title">취소가 완료되었습니다.</div>

                    <span>예약 일시 : ${}</span>
                    <span>취소 일시 : ${}</span>

                </div>
            </div>
        </section>


        <section class="reserveCancelSection">

            <section id="selectRoom" class="selectionContents">

                
                <div class="cancelTitle">취소 내역</div>
                    
                    <span class="cancelTitle-notice">취소 수수료는 실결제 금액과 포인트에 적용되며 환불 규정을 따릅니다.</span>
                    <a></a>
                    
                <div class="cancelSubTitle">총 환불액
                    <div class="totalPay">${}</div>
                </div>

                <div class="cancelSub">환불금액
                    <div class="subPay">${}</div>
                </div>

                <div class="cancelSub">환불포인트
                    <div class="subPoint">${}</div>
                </div>

                <a></a>

                <div class="cancelSubTitle">총 예약가
                    <div class="totalPay">${}</div>
                </div>

                <div class="cancelSub">실결제 금액
                    <div class="subPay2">${}</div>
                </div>

                <div class="cancelSub">포인트사용
                    <div class="subPoint">${}</div>
                </div>

            </section>
            
        </section>

    </main>

   
    
</body>
</html>