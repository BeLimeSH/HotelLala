<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/qna.css">
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
        <form action="qna" method="POST" class="first" onsubmit="return writeValidate()">
            <div class="first-in">
              <p style="margin-left:130px">Q&A</p><br><br>
                <ul>
                    <li>
                        <p>문의내용</p><br>
                        <div class="d-1">
                            <span>제목</span>
                            <span>유형</span><br>
                            <input type="text" name="qnaTitle"placeholder="제목을 입력해주세요.">
                            <!-- <input type="text"><br> -->
                            <select name="qnaCd" class="qna"><br>
                                <option value="client">고객문의</option>
                                <option value="client1">객실문의</option>
                                <option value="client2">기타문의</option>
                                <option selected>선택하세요.</option>
                            </select><br>
                            <span>내용</span><br>
                            <p><textarea class="text" name="qnaContent"cols="100" rows="5" placeholder="내용을 입력해주세요."></textarea></p>
                            <span>첨부파일</span><br>
                            <div class="file-wrap">
                                <input type="file" name="filename" id="file">
                                <input class="upload-name" placeholder="파일 찾아보기를 통해 첨부해주세요." required>
                                <label for="file" class="file_label cursor">파일 찾아보기</label>
                            </div>
                        </div>


                        
                    </li>
                    <br><br>

                    <li>
                        <p class="a-1">개인정보 수집 및 이용</p>
                        <div class="d-1">
                            <input type="checkbox" class="c-1">
                            <span class="c-1in">[필수]개인정보처리방침안내의 내용에 동의합니다.</span>
                        </div>
                    </li>
                        
                    <br><br>
                    <div class="sub">
                        <div class="div1 cursor">취소</div>
                        <button type="submit" class="div1 cursor">문의하기</button>
                    </div>
                </ul>
            </div>
            <input type="hidden" name="loginNo" value="${loginMember.memberNo}">
        </form>
        
        <jsp:include page="/WEB-INF/views/common/menunav.jsp"/>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/main.js"></script>
</body>
</html>