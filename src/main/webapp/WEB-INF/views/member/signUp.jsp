<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signUp</title>
    <link rel="stylesheet" href="resources/css/qna.css">
    <link rel="stylesheet" href="resources/css/signup.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="logo">
            <a href="#" class="fab1 fixed"><i class="fa-solid fa-cloud-moon"></i></i></a>
            <a href="./index.html" class="header fixed">Hotel LaLa</a>
        </div>
        <section class="signUp-content">
 
            <form action="signUp" method="POST" name="signUp-form">

                <label for="memberEmail">
                    <span class="required">아이디</span> 
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberEmail" name="memberEmail"
                            placeholder="아이디(이메일)" maxlength="30"
                            autocomplete="off" required>

                    <!-- autocomplete="off" : 자동완성 미사용 -->
                    <!-- required : 필수 작성 input 태그 -->

                    <!-- 자바스크립로 코드 추가 예정 -->
                    <button type="button">인증번호 받기</button>
                </div>

                <span class="signUp-message">메일을 받을 수 있는 이메일을 입력해주세요.</span>

                <label for="emailCheck">
                    <span class="required">인증번호</span> 
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="emailCheck"
                            placeholder="인증번호입력" maxlength="6"
                            autocomplete="off" required>

                    <button type="button">인증하기</button>
                </div>

                <span class="signUp-message confirm">인증완료</span>


                <label for="memberPw">
                    <span class="required">비밀번호</span> 
                </label>

                <div class="signUp-input-area">
                    <input type="password" id="memberPw" name="memberPw"
                            placeholder="비밀번호" maxlength="30">
                </div>

                <div class="signUp-input-area">
                    <input type="password" id="memberPwConfirm"
                            placeholder="비밀번호 확인" maxlength="30">
                </div>
                
                <span class="signUp-message error">비밀번호가 일치하지 않습니다.</span>
                
                <label for="memberName">
                    <span class="required">성명</span>
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberName" name="memberName"
                            placeholder="성명" maxlength="5">
                </div>


                <label for="memberTel">
                    <span class="required">전화번호</span> 
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberTel" name="memberTel"
                            placeholder="(- 없이 숫자만 입력)" maxlength="11">
                </div>

                <span class="signUp-message error">전화번호 형식이 올바르지 않습니다.</span>

                
                <span class="required">생년월일</span> 
                

                <div class="bir_wrap">
                    <div class="bir_yy">
                        <span class="ps_box">
                            <input type="text" id="yy" name="memberYear" placeholder="년(4자)" aria-label="년(4자)"
                            class="int" maxlength="4">
                        </span>
                    </div>
                    <div class="bir_mm">
                        <span class="ps_box">
                            <select name="memberMonth" id="mm" class="sel" aria-label="월">
                                <option value>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                    </div>
                    <div class="bir_dd">
                        <span class="ps_box">
                            <input type="text" name="memberDay" id="dd" placeholder="일" aria-label="일" class="int"
                            maxlength="2">
                            <label for="dd" class="1b1"></label>
                        </span>
                    </div>
                </div>

                <button type="submit" id="signUp-btn">가입하기</button>

            </form>

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
                    <li><a href="#">오시는 길</a></li>
                    <li><a href="#">층별안내</a></li>
                    <li><a href="#">호텔라라 소개</a></li>
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
        <!-- <footer>
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
        </footer> -->
    </div>
    
    <script src="js/index.js"></script>
</body>
</html>