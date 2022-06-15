<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>popUp-refundReason</title>
</head>
<body>

	<!-- 환불 사유 작성 popUp form, textarea -->
    <form action="cancelRequest" method="POST" id="refundReason">
	    <textarea name="refundReason" cols="150" rows="30"></textarea><br>
	    <button id="refundBtn" class="refundBtn">제출</button>
	</form>




	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<script>
        const contextPath = "${contextPath}";
    </script>

</body>
</html>