<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna2.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <main>
        <div class="container">
            <div class="logo">
                <a href="${contextPath}">
                    <img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
                </a>
            </div>
            <div class="first">

                <div>
                    
            
                <div class="inners" style="margin-top: 130px;">
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
                                <button class="tab-menu-link" onclick="location.href='faq'">전체</button>
                                <button class="tab-menu-link active1" onclick="location.href='faq?type=3'">결제</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=4'">객실예약</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=5'">시설예약</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=6'">단체이용</button>
                                <button class="tab-menu-link" onclick="location.href='faq?type=1'">기타</button>
                                
                            </div>
                        </div>
                        <div class="tab-bar">                        
                           
                           <c:forEach var="board" items="${list}"  varStatus="vs">
                            <div class="tab-bar-content">
                                <div class="texts">
                                    <div class="accordion-container btn">
                                        <div class="accordion-title"> 
                                            <p class="title-update">${board.boardTitle}</p>
                                            <a><i class="fa-solid fa-angle-up up"></i></a>
                                            <a class="down-update"><i class="fa-solid fa-angle-down down"></i></a>
                                        </div>
                                        <div class="accordion-innerbox inner">
                                            <p>
                                                ${board.boardContent}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
							</c:forEach>        
                           
                        </div>
                    </div>
                </div>
            </section>

            </div>
            
    <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>
    
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


    	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/menu/faq.js"></script>
</body>
</html>