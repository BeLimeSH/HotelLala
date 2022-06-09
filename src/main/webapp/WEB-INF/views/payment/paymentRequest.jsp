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
        <!-- 헤더 + 네비게이션 -->

        <section class="reserveSection" id="pageBarSection">
            <!-- 페이지 표시 -->
            <ul id="pagination">
                <li class="pageNum">1</li>
                <li class="pageNum">2</li>
                <li class="pageNum">3</li>
                <li class="pageNum currentPage">4</li>

                <div class="reserveTitle" id="pageDef-4">결제</div>
            </ul>

        </section>

        <!-- 결제 정보 form -->
        <form action="#" id="pay-status">
            <section class="reserveSection">

                <!-- 예약 정보 -->
                <section id="order-box" class="selectionContents">
                    <div class="payment-tit">결제 정보</div>
                    
                    <div class="payment-con" id="info-div">
                        
                        <div>
                            <ul>
                                <li>
                                    <div class="payment-list">객실</div>
                                    <div class="unbundling">
                                        <span class="payment-list">Standard/1박</span>
                                        <span class="payment-list">100,000원</span>
                                    </div>
                                </li>
                            </ul>

                            <ul class="option-result">
                                <li class="payment-list">선택한 옵션(옵션 / 수량 / 가격)</li>
                                
                                <li>
                                    <span class="payment-list">성인 조식(15,000원)</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">0</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">0원</span>
                                </li>
                                
                                <li>
                                    <span class="payment-list">어린이 조식(10,000원)</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">0</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">0원</span>
                                </li>
                                
                                <li>
                                    <span class="payment-list">엑스트라 베드(40,000원)</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">0</span>
                                    <span class="payment-list">|</span>
                                    <span class="payment-list">100,000원</span>
                                </li>
                            </ul>
                        </div>

                        <div class="dividing-col"></div>

                        <div>
                            <div class="req-result">
                                <div class="payment-list">추가 요청사항</div>
                                <div class="textBox"></div>
                            </div>

                            <div class="req-result-message">* 기타 문의사항은 Q&A게시판 또는 객실 예약과(010-0000-000)로 <br> 문의주세요.</div>
                        </div>
                    </div>
                </section>
            
                <!-- 포인트 영역 -->
                <section id="point-box" class="selectionContents">
                    <div class="payment-tit">포인트 혜택</div>
                    
                    <div class="payment-con" id="point-div">
                        
                        <div class="point-con">

                            <div class="point-row">
                                <span>보유 포인트</span>
                                <span>
                                    <span id="availablePoint">10,000</span> p
                                </span>
                            </div>

                            <div class="point-row">
                                <span>사용할 포인트</span>
                                <span>
                                    <!-- 보유포인트 < 결제금액 -->
                                    <!-- max="보유 포인트" min="0" 기본값?="0" -->
                                    
                                    <!-- 보유포인트 > 결제금액 -->
                                    <!-- max="결제금액" min="0" 기본값?="0" -->

                                    <!-- 키보드로 입력하는 숫자가 max보다 클때 input.value = "max" -->
                                    <!-- 키보드로 입력하는 숫자가 max보다 작을때 input.value = "min" -->
                                    <input type="number" name="usingPoint" id="usingPoint" min="0" placeholder="0">
                                    <label class="extra-note">
                                        <!-- checkbox 체크시 max값이 input에 입력 -->
                                        <input type="checkbox" id="allUsed"> 모두 사용
                                    </label>
                                </span>
                            </div>


                        </div>

                        <div class="dividing-col"></div>

                        <div class="point-con">
                            <ul>
                                <li class="point-row">
                                    <span>결제 금액 : </span>
                                    <span>110,000 원</span>
                                </li>
                                
                                <li class="point-row">
                                    <span>포인트 사용 :</span>
                                    <span>- <span id="usingPoint2">0</span> p</span>
                                </li>

                                <li class="point-row">
                                    <span>최종 금액 : </span>
                                    <span>100,000 원</span>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                </section>
                
                <!-- 적립예정 포인트 -->
                <section id="saving-point-box" class="selectionContents">
                    <span>적립 예정 포인트 : </span>
                    <span id="saving-point">1,000</span>
                </section>

                <!-- 결제 방법 선택 -->
                <!-- API 필수 -->
                <section id="pay-option-box" class="selectionContents">
                    <div class="payment-tit">결제 방법</div>
                    
                    <div class="payment-con pay-option-con">
                        
                        <!-- 카드 -->
                        <label>
                            <div class="option-btn">
                                <i class="fa-solid fa-credit-card"></i>
                                <div>카드 결제</div>
                            </div>
                            <input type="radio" name="pay-option" value="card" class="removeResource">
                        </label>
                        
                        <!-- 실시간 계좌이체 -->
                        <label>
                            <div class="option-btn">
                                <i class="fa-solid fa-money-bill-transfer"></i>
                                <div>실시간 계좌이체</div>
                            </div>
                            <input type="radio" name="pay-option" value="trans" class="removeResource">
                        </label>
                        
                        <!-- 가상계좌 -->
                        <label>
                            <div class="option-btn">
                                <i class="fa-solid fa-money-check-dollar"></i>
                                <div>가상계좌</div>
                            </div>
                            <input type="radio" name="pay-option" value="vbank" class="removeResource">
                        </label>
                        
                        <!-- 핸드폰 -->
                        <label>
                            <div class="option-btn">
                                <i class="fa-solid fa-mobile-screen"></i>
                                <div>핸드폰 결제</div>
                            </div>
                            <input type="radio" name="pay-option" value="phone" class="removeResource">
                        </label>
                        
                    </div>
                </section>
                
                <!-- 유의사항 & 환불 규정 -->
                <jsp:include page="/WEB-INF/views/common/ruleBox.jsp"/>

            </section>

            <!-- 최종 결제 금액 -->
            <section class="payment-area">
                <div>
                    <div class="payment-div1">
                        최종 금액 <span class="room-price">100,000</span> 원              
                    </div>
        
                    <div class="payment-div2">
                        <button>
                            <a href="reservation-option.html" style="color: white;">이전 페이지로</a>
                        </button>
    
                        <button type="button" id="iamportPayment">결제하기</button>
                    </div>
                </div>
            </section>
        </form>

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

    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script src="../../resources/js/payment/payment.js"></script>

</body>
</html>