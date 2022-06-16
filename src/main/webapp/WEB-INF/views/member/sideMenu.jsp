<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="left-side">
    
    <div class="name">
        <a href="${contextPath}/member/myPage/info">
            <strong class="nm">${loginMember.memberName} 님</strong>
        </a>
    </div>
    <ul class="list-group">

<!-- 
           <li class="maf">예약확인</li>
              
           <li><a href="${contextPath}/reservation/check" class="jc">*객실 예약 조회</a></li>
           
           <li class="maf"> 문의</li>
              
          
           <li><a href="${contextPath}/menu/qnaCheck?memberNo=${loginMember.memberNo}" class="jc">* 내 문의 확인</a></li>
        
           
           <li class="maf">개인정보관리</li>
          
           <li><a href="${contextPath}/member/myPage/info" class="jc">*개인정보수정</a></li>
           
           <!-- /hotellala/member/myPage/changePw
           <li><a href="${contextPath}/member/myPage/changePw" class="jc">*비밀번호 변경</a></li>
           <li><a href="${contextPath}/member/myPage/secession" class="jc">*회원탈퇴</a></li>
               
           
           <li class="maf"><a href="${contextPath}/member/logout">로그아웃</a></li>

           <li class="bottom">예약확인</li>
              
           <li class="margin"><a href="${contextPath}/reservation/check">객실 예약 조회</a></li>
           
           <li class="bottom"> 문의</li>
              
          
           <li class="margin"><a href="${contextPath}/menu/qnaCheck"> 내 문의 확인</a></li>
        
           
           <li class="bottom">개인정보관리</li>
          
           <li class="margin"><a href="${contextPath}/member/myPage/info">개인정보수정</a></li>
           
           <!-- /hotellala/member/myPage/changePw
           <li class="margin"><a href="${contextPath}/member/myPage/changePw">비밀번호 변경</a></li>
           <li class="margin"><a href="${contextPath}/member/myPage/secession">회원탈퇴</a></li>
               
           
           <li class="margin"><a href="${contextPath}/member/logout">로그아웃</a></li>
           -->

       </ul>
   </section>