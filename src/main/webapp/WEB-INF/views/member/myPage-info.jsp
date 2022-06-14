<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메서드) 제공 JSTL (EL형식으로 작성)  --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(개인정보수정)</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">

    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>

<main>



<!-- nav -->
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
 
 
<section class="myPage-content">
           

        <!-- 사이드 메뉴 include -->
        <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
        
            
        <!-- 오른쪽 마이페이지 상단  -->
        <section class="myPage-content">
            
            <section class="myPage-main">
            <h1 class="myPage-title">My Page</h1>
            <span class="myPage-explanation">멤버쉽 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
            
            <h4 class="myPage-subtitle">내 정보</h4>
            <span class="mypage-subexplanation">원하는 회원 정보를 수정할 수 있습니다.</span>

            <form action="info" method="POST" name="myPage-form" >
              
                <div class="myPage-row">
                    <label>NAME*</label>
                    <input type="text" name="membername" value="${loginMember.memberName}" maxlength="10">
                </div>

                <div class="myPage-row">
                    <label>PHONE NUMBER *</label>
                    <input type="text" name="memberTel" value="${loginMember.memberTel}" maxlength="11">
                </div>


                <!-- 주소-->
                <c:set var="addr" value="${fn:split(loginMember.memberAddress,',,')}"/>
                <div class="myPage-row info-title">
                    <span>ADDRESS* </span>
                </div>
                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="${addr[0]}" maxlength="6">
                    <button type="button" id="info-address-btn">검색</button>
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="${addr[1]}">
                </div>

                <div class="myPage-row info-address">
                    <input type="text" name="memberAddress" value="${addr[2]}">
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
 