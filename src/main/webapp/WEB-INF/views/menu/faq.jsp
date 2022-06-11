<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <div class="container">
            <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
            <a href="./index.html" class="header fixed">Hotel LaLa</a>
            <div class="first">
                <div class="inners">
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
                                <button class="tab-menu-link active1">전체</button>
                                <button class="tab-menu-link">객실예약</button>
                                <button class="tab-menu-link">시설</button>
                                <button class="tab-menu-link">기타문의</button>
                            </div>
                        </div>
                        <div class="tab-bar">
                            <div class="tab-bar-content">
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
                            </div>
                            <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn2">
                                        <div class="accordion-title"> 
                                            <p>[객실예약] 체크인 / 체크아웃 시간은 언제인가요?</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                일반적으로 체크인 시간은 15시부터 가능하고, 체크아웃은 익일 11시까지이며, 상품에 따라 변동이 있을 수 있습니다.<br>
                                                - 레이트 체크아웃은 1시간에 44,000원 비용 부과 및 최대 14시까지 이용 가능합니다.<br>
                                                (당일 객실 상황에 따라 레이트 체크아웃은 이용이 어려울 수 있습니다.)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-bar-content">
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
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
            <div class="seconds">
                <a href="#" class="first_bar">
                    <i class="fa-solid fa-x cursor"></i>
                    <p class="cursor" style="">close</p>
                    <a href="login.html"><p class="login cursor">Login</p></a>
                    <a href="signup.html"><p class="signup cursor">signUp</p></a>
                </a>

                <div class="nav_bar">
                    <ul class="list1">
                        <h4>Contact</h4>
                        <li><a href="notice.html">공지사항</a></li>
                        <li><a href="qna.html">Q&A</a></li>
                        <li><a href="faq.html">FAQ</a></li>
                    </ul>
                    <br><br>
                    <ul class="list2">
                        <h4>Location</h4>
                        <li><a href="location.html">오시는 길</a></li>
                        <!-- <li><a href="#">층별안내</a></li> -->
                        <li><a href="room.html">호텔라라 소개</a></li>
                    </ul>
                    <br><br><br>

                    <ul class="list3">
                        <h1><a href="#" class="white">예약하기</a></h1>
                    </ul><br>
                    <ul class="list3">
                        <h1><a href="#" class="white">예약확인</a></h1>
                    </ul><br>
                </div>  
            </div>

            <div class="third">
                    <a href="#" class="seconds_bar">
                        <i class="fa-solid fa-bars cursor"></i>
                        <p class="cursor">MENU</p>
                    
                    </a>
                <a href="#"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
                <a href="notice.html"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
            </div>
            
        </div>
    </main>

    <footer>
        <div class="footert-inner">
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
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/menu/faq.js"></script>
</body>
</html>