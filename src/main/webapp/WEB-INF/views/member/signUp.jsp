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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="logo">
	        <a href="${contextPath}">
				<img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
	        </a>
        </div>
        
        <section class="signUp-content">
 
            <form action="signUp" method="POST" name="signUp-form" onsubmit="return signUpValidate()">

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

                <span class="signUp-message" id="emailMessage">메일을 받을 수 있는 이메일을 입력해주세요.</span>

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
                
                <span class="signUp-message" id="pwMessage">영문/숫자/특수문자 포함 6글자 이상 작성해주세요.</span>
                
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
                <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>
                <br><br>

                
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

                <label for="memberAddress" class="address-title">
                    주소
                </label>

                <div class="signUp-input-area">
                    <input type="text" id="memberAddress" name="memberAddress"
                            placeholder="우편번호" maxlength="6">

                    <button type="button">검색</button>
                </div>

                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" placeholder="도로명주소">
                </div>

                <div class="signUp-input-area">
                    <input type="text" name="memberAddress" placeholder="상세주소">
                </div>

                <button type="submit" id="signUp-btn">가입하기</button>


            </form>

        </section>
    </div>
       




      <jsp:include page="/WEB-INF/views/common/nav.jsp"/>
        <%--   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>--%>
 	
 	<div>
 

    </div>
    <c:if test="${!empty sessionScope.message}">
        <script>
            alert("${message}");
        </script>
        <c:remove var="message" scope="session" />
    </c:if>
	

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/member/signUp.js"></script>
</body>
</html>