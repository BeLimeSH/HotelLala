<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NOTICE</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/notice.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common-style.css">
    <script src="https://kit.fontawesome.com/243327ab3a.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <a href="${contextPath}">
            <img class="logo"src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
        </a>
        
        <div class="first">
            <div class="notice-first">    
                <div class="subtitle">
                    <h1 class="notice">NOTICE</h1>
                    <h3 class="notice_subtitle">공지사항</h3>
                </div>
                <div class="notice_table-wrap">
                    <table class="tab1">
                        <tbody>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>등록일</th>
                            </tr>
                            <tr>
                                <td>[ NOTICE ]</td>
                                <td>
                                    <a href="#">호텔 사용 안내</a>
                                </td>
                                <td>
                                    <P>2022.05.23</P>
                                </td>
                            </tr>
                            <tr>
                                <td> 2 </td>
                                <td>
                                    <a href="#">객실 변경 안내</a>
                                </td>
                                <td>
                                    <p>2022.05.23</p>
                                </td>
                            </tr>
                            <tr>
                                <td> 1 </td>
                                <td>
                                    <a href="#">호텔 라라 이벤트</a>
                                </td>
                                <td>
                                    <p>2022.05.21</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="seq">
                        <ul>
                            <li class="active1">
                                <a href="">1</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
 
       
        
        <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>
    </div>
           
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>