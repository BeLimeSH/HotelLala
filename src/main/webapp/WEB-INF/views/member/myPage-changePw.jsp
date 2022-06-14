<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(비밀번호 변경)</title>
   
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
    <link rel="shortcut icon" href="${contextPath}/resources/images/wIcon.ico">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
  
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>




<!-- nav -->
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>


<main>
    <section class="myPage-content">
           

    <!-- 사이드 메뉴 include -->
    <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
        
       
    <section class="myPage-content">
            
           <section class="myPage-main">
            <h1 class="myPage-title">My Page</h1>
            <span class="myPage-explanation">멤버쉽 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
           
            
            <h4 class="myPage-subtitle">비밀번호 변경</h4>
            <span class="myPage-subexplanation">현재 비밀번호가 일치하는 경우 새 비밀번호 변경할 수 있습니다.</span>

          
               <form action="changePw" method="POST" name="myPage-form" >

                   <div class="myPage-row">
                       <label>CURRUNT PASSWORD*</label>
                       <input type="password" name="currentPw"  maxlength="30">              
                   </div>

                   <div class="myPage-row">
                       <label>NEW PASSWORD*</label>
                       <input type="password" name="newPw" maxlength="30">              
                   </div>

                   <div class="myPage-row">
                       <label>CONFIRM PASSWORD*</label>
                       <input type="password" name="newPwConfirm" maxlength="30">              
                   </div>

                   <button id="info-update-btn">변경하기</button>

               </form>

           </section>

       </section>
    
    
    
</main>


 <!-- footer -->
 <jsp:include page="${contextPath}/WEB-INF/views/common/footer.jsp"/>
    

<!-- js -->
<script src="${contextPath}/resources/js/member/myPage.js"></script>
        
</body>
</html>