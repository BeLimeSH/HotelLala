<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- 슬라이드 적용 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">

    <title>객실 상세보기</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/roomDetail-style.css">
    <script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>
<body>
    <main>

        <!-- 사진 영역 -->
        <section class="room-image-area">
            <!-- swiper슬라이더 메인컨테이너 -->
            <div class="swiper-container">
                <!-- 보여지는 영역 -->
                <div class="swiper-wrapper">
                    <!-- <div class="swiper-slide">내용</div> 를 추가하면된다 -->
                    <div class="swiper-slide">
                        <img src="${contextPath}${roomBoard.imageOne}">
                    </div>
                    
                    <div class="swiper-slide">
                        <img src="${contextPath}${roomBoard.imageTwo}">
                    </div>
                    
                    <div class="swiper-slide">
                        <img src="${contextPath}${roomBoard.imageThree}">
                    </div>
                    
                    <div class="swiper-slide">
                        <img src="${contextPath}${roomBoard.imageFour}">
                    </div>
                    
                </div>
                <!-- 페이징 버튼 처리 상황에 따라 추가 삭제가능-->
                <div class="swiper-pagination"></div>
            
                <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>

        </section>

        <!-- 객실 정보 -->
        <section class="room-info-area">
            <section>
                <!-- 객실 정보 -->
                <div>
                    <!-- 객실 소개 -->
                    <div id="roomInfo">${roomBoard.roomInfo}</div>

                    <div class="wifiMessage">모든 객실과 레스토랑에서 유ㆍ무선 인터넷(wi-fi) 연결 가능합니다.</div>

                    <!-- 위치, 전망, 침대, 방 크기, 룸 구성 -->
                    <div class="room-detail">
                        <div class="room-subtit">Room info.</div>

                        <ul>
                            <li>
                                <span>위치</span>
                                <span>${roomBoard.roomFloor}</span>
                            </li>
                            
                            <li>
                                <span>전망</span>
                                <span>오션뷰, 시티뷰</span>
                            </li>

                            <li>
                                <span>침대 타입</span>
                                <span>${roomBoard.bedType}</span>
                            </li>
                            <li>
                                <span>방 크기</span>
                                <span>${roomBoard.roomSize}</span>
                            </li>

                            <li>
                                <span>기준 인원</span>
                                <span>${roomBoard.standardNumber}</span>
                            </li>

                        </ul>
                    </div>
                    
                </div>

                <!-- 어메니티 -->
                <div class="amenity-area">
                    <div class="room-subtit">Amenity</div>
                    
                    <table>
                        <tr class="first-row">
                            <td>BEDROOM</td>
                            <td>BATHROOM</td>
                            <td>IN-ROOM BAR</td>
                        </tr>
                        
                        <tr>
                            <td>40인치 LED TV</td>
                            <td>목욕 가운</td>
                            <td>미니바 / 냉장고</td>
                        </tr>
                        
                        <tr>
                            <td>에어컨(Cool/Hot)</td>
                            <td>비데</td>
                            <td>아이스 버킷 및 얼음 집게</td>
                        </tr>
                        
                        <tr>
                            <td>개별 냉 난방 조절기</td>
                            <td>헤어드라이기</td>
                            <td>전기 주전자</td>
                        </tr>

                        <tr>
                            <td>슬리퍼</td>
                            <td>욕실용품</td>
                            <td>무료 생수</td>
                        </tr>
                        
                        <tr>
                            <td>전화기</td>
                            <td></td>
                            <td>무료 티, 커피</td>
                        </tr>

                    </table>

                </div>
            </section>

            <!-- 호텔 이용 안내 -->
            <section class="hotel-info-area">
                <div>Hotel info.</div>
                
                <!-- 조식 시간 -->
                <ul>
                    <li>조식 이용 안내</li>
                    <li>1층 레스토랑 06:00 ~ 10:00</li>
                </ul>
                <!-- 체크인 체크아웃 -->
                <ul>
                    <li>체크인 / 체크아웃 시간</li>
                    <li>체크인 : 오후 2시</li>
                    <li>체크아웃 : 오전 11시</li>
                </ul>

                <ul>
                    <li>취소 및 환불규정</li>
                    <li>예약일 3일 전 100% 환불</li>
                    <li>예약일 2일 전 80% 환불</li>
                    <li>예약일 전날 50% 환불</li>
                    <li>당일 취소 및 환불 불가</li>
                </ul>

                <!-- 문의 전화 -->
                <div class="hotel-tel">
                    <span>문의전화</span>
                    <span>010-0000-0000</span>
                </div>
            </section>
        </section>

    </main>

    <script src="${contextPath}/resources/js/room/roomDetail.js"></script>
    
</body>
</html>