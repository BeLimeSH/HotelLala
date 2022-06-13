<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(개인정보수정)</title>
    <link rel="stylesheet" href="css/myPage-style.css">
    <link rel="stylesheet" href="css/footer.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">

    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- nav -->
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
 
 
    <main>
    <section class="myPage-content">
           

        <!-- 왼쪽 사이드 메뉴 -->
        <section class="left-side">
            <ul class="list-group">
                <li>예약확인</li>
                   
                <li><a href="#">*객실 예약</a></li>
              
              
                
                <li>개인정보관리</li>
               
                <li><a href="#">*개인정보수정</a></li>
                <li><a href="#">*비밀번호 변경</a></li>
                <li><a href="#">*회원탈퇴</a></li>
                    
                
                <li>로그아웃</li>
                

            </ul>
        </section>
            
        <!-- 오른쪽 마이페이지 상단  -->
        <section class="myPage-content">
            
            <section class="myPage-main">
            <h1 class="myPage-title">My Page</h1>
            <span class="myPage-explanation">멤버쉽 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
            
            <h4 class="myPage-subtitle">내 정보</h4>
            <span class="mypage-subexplanation">원하는 회원 정보를 수정할 수 있습니다.</span>

            <form action="#" method="POST" name="myPage-form" >
              
                <div class="myPage-row">
                    <label>NAME*</label>
                    <input type="text" name="membername" value="회원명" maxlength="10">
                </div>

                <div class="myPage-row">
                    <label>PHONE NUMBER *</label>
                    <input type="text" name="memberTel" value="01012345678" maxlength="11">
                </div>

                <div class="myPage-row info-title">
                    <span>ADDRESS* </span>
                </div>
                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="우편번호" maxlength="6">
                    <button type="button" id="info-address-btn">검색</button>
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="도로명주소">
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="상세주소">
                </div>
               
               


                <button id="info-update-btn">수정하기</button>


            </form>




        </section>


    </section>
    
    
</main>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
    
        

    

</body>
</html>
 