<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>location</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/location.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
    
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">

        <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
        <a href="${contextPath}" class="header fixed">Hotel LaLa</a>
        <div class="first">
            <div class="inners">
               
                    <h1>LOCATION</h1>
              
                <div class="guide">
                    <div id="map" style="width:100%;height:100%;"></div>
                </div>
                <div class="address">
                    <table>
                        <tbody>
                            <tr>
                                <th>주소</th>
                                <td>서울특별시 중구 남대문로 120 대일빌딩 2층, 3층 </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>(T: 1544-9970 / F: 02-722-0858)</td>
                            </tr>
                        </tbody>
                    </table>
                    <button>
                        <a href="https://map.kakao.com/?nil_profile=title&nil_src=local">길찾기 바로가기</a>
                    </button>
                </div>
                
                
                
                <div class="location">
                    <p>오시는방법</p>
                    <div class="accordion-menu">
                        <div class="accordion">
                            <div class="accordion-list">
                                <div class="label">
                                    <span>자가용 이용시</span>
                                    <a><i class="fa-solid fa-angle-up up"></i></a>
                                    <a><i class="fa-solid fa-angle-down down"></i></a>
                                </div>
                                <div class="content">
                                    <div class="content-inner">
                                        <p>
                                            호텔 주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층, 3층
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-list1">
                                <div class="label">
                                    <span>서울역 출발 시</span>
                                    <a><i class="fa-solid fa-angle-up up"></i></a>
                                    <a><i class="fa-solid fa-angle-down down"></i></a>
                                </div>
                                <div class="content">
                                    <div class="content-inner">
                                        <p>
                                            서울역 1호선 승차 -> 종각역 하차
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-list2">
                                <div class="label">
                                    <span>고속터미널 출발 시 </span>
                                    <a><i class="fa-solid fa-angle-up up"></i></a>
                                    <a><i class="fa-solid fa-angle-down down"></i></a>
                                </div>
                                <div class="content">
                                    <div class="content-inner">
                                        <p>
                                            고속터미널역    3호선 -> <br>
                                            종로3가역       2호선 -> <br>
                                            을지로입구역    하차
                                            
                                            
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </div>
    
    <script src="js/index.js"></script>
    <!-- <script src="js/faq.js"></script> -->
    <script src="js/location.js"></script>


	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f87425357f955c672a58b561cdeeccaa"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.57002, 126.97650), // 지도의 중심좌표
            level: 4, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        }; 

        // 지도를 생성한다 
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 지도에 마커를 생성하고 표시한다
        var marker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(37.56999, 126.97874), // 마커의 좌표
            draggable : true, // 마커를 드래그 가능하도록 설정한다
            map: map // 마커를 표시할 지도 객체
        });

        // 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
        kakao.maps.event.addListener(marker, 'click', function() {
            alert('마커를 클릭했습니다!');
        });

        // 마커에 mouseover 이벤트를 등록한다
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            console.log('마커에 mouseover 이벤트가 발생했습니다!');
        });

        // 마커에 mouseout 이벤트 등록
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            console.log('마커에 mouseout 이벤트가 발생했습니다!');
        });

        // 마커에 dragstart 이벤트 등록
        kakao.maps.event.addListener(marker, 'dragstart', function() {
            console.log('마커에 dragstart 이벤트가 발생했습니다!');
        });

        // 마커에 dragend 이벤트 등록
        kakao.maps.event.addListener(marker, 'dragend', function() {
            console.log('마커에 dragend 이벤트가 발생했습니다!');
        });
	
	</script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/menu/location.js"></script>
</body>
</html>