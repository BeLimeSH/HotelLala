<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <div class="container">
            <div class="logo">
                <a href="${contextPath}">
                    <img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
                </a>
            </div>
            <div class="first">

                <div>
                    
            
                <div class="inners" style="margin-top: 130px;">
                    <h1>FAQ</h1>
                    <form name="sch_form" id="sch_form" method="post" action="?">
                        <div class="reservation01">
                            <div class="write">
                                <label for="">검색 위치</label>
                                <select name="keyfield" id="type_select">
                                    <option value hidden>선택하세요</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </div>
                            <div class="write">
                                <label for="">검색 단어</label>
                                <input type="text" name="keyword" id="search_name"placeholder="검색어를 입력해주세요."" maxlength="125" required="true" value>
                            </div>
                            <button class="search" id="submit_search">검색</button>
                        </div>
                    </form>
                </div>
            </div>
            
            <section class="faq_wrapper">
                <div class="tab_wrapper">
                    <div class="tab">
                        <div class="tab_menu_wrap">
                            <div class="tab_menu">
                                <button class="tab-menu-link active1" onclick="location.href='faq?type=3'">결제</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=4'">객실예약</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=5'">시설예약</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=6'">단체이용</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=1'">기타</button>
                                <button class="tab-menu-link">기타문의</button>
                            </div>
                        </div>
                        <div class="tab-bar">
                            <!-- <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn">
                                        <div class="accordion-title"> 
                                            <p class="p1">[객실예약] 객실 예약 안내 부탁드립니다.</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>라라호텔 객실 예약 대표 전화와 홈페이지 그리고 여행사를 통해 예약 가능합니다.
                                                <br>
                                                전화예약 : 02-1234-1234 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn1">
                                        <div class="accordion-title"> 
                                            <p>[객실예약] 예약 후 당일 취소가 가능한가요?</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                당일 취소 및 변경은 불가하며, 예약 후 사용예정일 (체크인 기준)에 따른 위약금이 부과됩니다. 자세한 내용은 아래를 참조 하시길 바랍니다. <br><br>
                                                취소 및 환불 안내<br>
                                                - 입실일 기준 3일 전: 무료 취소 및 변경 가능<br>
                                                - 입실일 기준 2일 전: 첫째날의 30% 위약금 발생<br>
                                                - 입실일 기준 1일 전: 첫째날의 50% 위약금 발생<br>
                                                - 당일 취소 또는 노쇼: 첫째날의 100% 위약금 발생<br><br>

                                                *** 여행사로 구매하신 고객님은 각 여행사마다 취소규정은 상이 하오니 해당 여행사 고객센터로 문의바랍니다*** 객실 점유율에 따라 금액이 변동 될 수 있습니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn2">
                                        <div class="accordion-title"> 
                                            <p>${board.boardTitle}</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                ${board.boardContent}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn3">
                                        <div class="accordion-title"> 
                                            <p>[객실예약] 객실 내에서 취사가 가능한가요?</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.
                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.
                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.<br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn4">
                                        <div class="accordion-title"> 
                                            <p>[객실예약] 객실 예약 안내 부탁드립니다.</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                호텔에는 취사 가능 시설이 없습니다. 취사는 불가능합니다.<br>

                                                South 타워 1층 레스토랑 입구에서 전자레인지 사용 가능합니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </section>

            </div>
            
    <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>
    
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/menu/faq.js"></script>
</body>
</html>