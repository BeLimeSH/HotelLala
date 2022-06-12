<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지(비밀번호 변경)</title>
    <link rel="stylesheet" href="${contextPath}/resources/css//myPage-style.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
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
    
</body>
</html>