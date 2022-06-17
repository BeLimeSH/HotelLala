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
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style1.css">

    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>

<main>

<div class="logo">
    <a href="${contextPath}">
        <img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
    </a>
</div>

<section class="myPage-content">
           

    <!-- 사이드 메뉴 include -->
    <jsp:include page="/WEB-INF/views/member/sideMenu.jsp"/>
        
            
        <!-- 오른쪽 마이페이지 상단  -->
        <section class="myPage-inner">
            
            <section class="myPage-main">
                
                <form action="info" method="POST" name="myPage-form" onsubmit="return infoValidate()" >
                    
                    <h1 class="myPage-title">My Page</h1>
                    <span class="myPage-explanation">멤버쉽 회원을 위한 다양한 혜택이 준비되어 있습니다.</span>
                    
                    <h4 class="myPage-subtitle">내 정보</h4>
                    <span class="myPage-subexplanation">원하는 회원 정보를 수정할 수 있습니다.</span>
              
                    <div class="wrapper">

                        <div class="myPage-row">
                            <label>NAME*</label>
                            <input type="text" name="memberName" value="${loginMember.memberName}" id="memberName" maxlength="10">
                        </div>

                        <span class="signUp-message" id="nameMessage">변경할 회원명을 입력해주세요</span>
        
                        <div class="myPage-row">
                            <label>PHONE NUMBER *</label>
                            <input type="text" name="memberTel" value="${loginMember.memberTel}" id="memberTel" maxlength="11">
                        </div>
                        
                        <span class="signUp-message" id="telMessage">변경할 전화번호를 입력해주세요</span>
        
                        <!-- 주소-->
                        <c:set var="addr" value="${fn:split(loginMember.memberAddress,',,')}"/>
                        <div class="myPage-row info-title">
                            <span>ADDRESS* </span>
                        </div>
                        <div class="myPage-row info-address">
                            <input type="text" name="memberAddress" value="${addr[0]}" maxlength="6" id="sample6_postcode">
                            <button type="button" id="info-address-btn" onclick="sample6_execDaumPostcode()">검색</button>
                        </div>
        
                        <div class="myPage-row info-address">
                            <input type="text" name="memberAddress" value="${addr[1]}" id="sample6_address">
                        </div>
        
                        <div class="myPage-row info-address">
                            <input type="text" name="memberAddress" value="${addr[2]}" id="sample6_detailAddress">
                        </div>
                        <span class="signUp-message" id="addrMessage" style="display:block">변경할 주소를 입력해주세요.</span>

                        <button id="info-update-btn">수정하기</button>
                    </div>
        

            </form>

        </section>

    </section>
    
</section>    

</main>


<!-- nav -->
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
<!-- js -->
<script src="${contextPath}/resources/js/member/myPage.js"></script>
<script src="${contextPath}/resources/js/menu/nav.js"></script>
        
<!-- 주소 검색 js  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


</body>
</html>
 