<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 네비 시작 -->
    <nav>
        <div class="seconds">
    
            <a href="#" class="first_bar">
                <i class="fa-solid fa-x cursor"></i>
                <p class="cursor">close</p>
                
           <c:if test="${empty sessionScope.loginMember}">

    		<a href="login"><p class="login cursor">Login</p></a>
            <a href="signUp"><p class="signup cursor">signUp</p></a>

            </c:if>

            <c:if test="${!empty sessionScope.loginMember}">
            
                    <a href="${contextPath}/member/logout">Logout</a>
                    <a href="${contextPath}/member/myPage/info">마이페이지</a>
           
            </c:if>
  
                
    
            <div class="nav_bar">
    
                <ul class="list1">
                    <h4>Contact</h4>
                    <li><a href="${contextPath}/menu/notice">공지사항</a></li>
                    <li><a href="${contextPath}/menu/qna">Q&A</a></li>
                    <li><a href="${contextPath}/menu/faq">FAQ</a></li>
                </ul>
    
                <br><br>
    
                <ul class="list2">
                    <h4>Location</h4>
                    <li><a href="${contextPath}/menu/location">오시는 길</a></li>
                 <!--    <li><a href="${contextPath}/menu/room">호텔라라 소개</a></li> -->
                </ul>
    
                <br><br><br>
    
                <ul class="list3">
                    <h1><a href="${contextPath}/reservation/date" class="white">예약하기</a></h1>
                </ul>
                
                <br>
    
                <ul class="list3">
                    <h1><a href="${contextPath}/reservation/check" class="white">예약확인</a></h1>
                </ul>
                
                <br>
    
            </div> 
        </div>
    
        <div class="third">
    
            <a href="#" class="seconds_bar">
                <i class="fa-solid fa-bars cursor"></i>
                <p class="cursor" >MENU</p>
            </a>
    
            <a href="${contextPath}/reservation/date"><div class="menu-btn-title01 cursor-horver">예약하기</div></a>
            <a href="${contextPath}/menu/notice"><div class="menu-btn-title02 cursor-hover">공지사항</div></a>
        </div>

    </nav>
    
    
    <!-- 네비 시작 -->
    
   <!--  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	-->
	
    

