<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>예약 조회</title>

<link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-style.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common/common-style.css">

<!-- 예약 조회 탭 스타일 -->
<link rel="stylesheet" href="${contextPath}/resources/css/reservation-Check.css" type="text/css">

<!-- 사이트 탭 아이콘 -->
<link rel="shortcut icon" href="/HotelLala/resources/images/wIcon.ico">

<script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>

</head>
<body>
	<main>

		<div class="logo">
		    <a href="${contextPath}">
		        <img class="logo-img" src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
		    </a>
		</div>

		<!-- 조회 탭 -->
		<section class="myPage-content">
			
			<!-- 사이드 jsp 추가 -->
			<jsp:include page="/WEB-INF/views/member/sideMenu.jsp" />

			

			<!-- 오른쪽 예약 확인 주요 내용 부분 -->
			<section class="myPage-main">
				<h1 class="myPage-title">예약 확인</h1>
				<div class="rsv-Underline"></div>
				<span class="rsv-explanation">객실 예약 내역을 확인하실 수 있습니다.</span><br>


				<!-- form 태그 -->
				<form action="check" method="POST" id="reserveSearchBtn"" onsubmit="return reserveSearchValidate()">

					<div class="rsvCheck-contain">
						<!-- daterangepicker -->
						<!-- 날짜 선택 바 -->
						<div class="dateSelection">
							<div>
								<div class="reserveTitle">CHECK IN / OUT</div>
								<!-- 날짜 선택 input!! -->

								<!-- 시작~종료 일 -->
								<input type="text" id="reserve-datepicker" class="reserveContent" name="reserveDate" readonly><span class="reserveContent" id="dividingBar">|</span>

								<!-- n박 -->
								<input type="text" id="dateRange" name="dateRange" class="reserveContent"  value="1" readonly> <span class="reserveContent">박</span>

								<!-- 선택한 날짜로 조회 -->
								<button  id="searchBtn" class="searchBtn">검색</button>
							</div>
						</div>



						<!-- 예약 조회 -->
						<div class="rsvCheck-myPageRsv">
							<div class="myRsvtitle">
								<h4 class="tit2">객실 예약</h4>
							</div>


							<table summary=" 주문번호, 회원번호, 예약상태, 체크인날짜, 체크아웃날짜 객실번호로 구성된 리스트 표" class="rsvList">
								<thead>
									<tr>
										<td>주문번호</td>
										<td>회원번호</td>
										<td>체크인</td>
										<td>체크아웃</td>
										<td>객실번호</td>
									</tr>
								</thead>
							</table>


							<div class="list-wrapper">
								<table class="list-table">
									<tbody>
										<c:choose>
											<c:when test="${empty checkList}">
												<!--  예약 조회 결과가 비어있다면 -->
												<tr>
													<th colspan="5" class="reserveNothing">예약 내역이 존재하지 않습니다.</th>
												</tr>
											</c:when>

											<c:otherwise>
												<ul id="check-list">
													<!-- 향상된 for문 처럼 사용 -->
													<c:forEach var="reserve" items="${checkList}">
														<table class="rsvList">
															<tr>
																<td class="reserve-check-content">${reserve.requestNo}</td>
																<td class="reserve-check-content2">${reserve.memberNo}</td>
																<td class="reserve-check-content3">${reserve.checkIn}</td>
																<td class="reserve-check-content4">${reserve.checkOut}</td>
																<td class="">${reserve.roomNo}</td>
															</tr>
														</table>
																<!-- 로그인 회원의 회원번호와 예약 테이블의 회원 번호가 일치해야 예약 취소 수행 가능(JS에서 수행) -->
																<%-- <c:if test="${loginMember.memberNo == reservation.memberNo}">
																	 <div class="cancel-btn-area">
																		<button onclick="cancelReqeust(${reserve.requestNo})" class="w-btn-outline w-btn-blue-outline">예약취소</button>
																	</div>
																</c:if> --%>
																	
																	
																	<!-- 환불 사유 작성 부분 -->
																	<%-- <c:if test="${reserve.fl == 0 }"> --%>
																    <div class="refund-write-area">
																        <textarea class="refundReason"></textarea>
																        <button type="button" class="w-btn-outline w-btn-blue-outline cancelReqeust" id="${reserve.requestNo}">환불 요청</button>
																    </div>
																    <%-- </c:if> --%>

													</c:forEach>
												</ul>

											</c:otherwise>
										</c:choose>
									</tbody>
								</table> <!-- 예약 조회 테이블 종료 -->
								<br>
							</div>
						</div>
					</div>

				</form>


			</section>

		</section>

	</main>

	<!-- 예약 취소 클릭 시 출력되는 팝업 창 용 스크립트 -->
	<script type="text/javascript">
            function popupOpen(){
                var popUrl = "${contextPath}/reservation/refundReason";
                var popOption = "width=1200, height=600, resizable=no, scrollbars=no, status=no;";
                var p = window.open(popUrl, "popup1", popOption);
                p.focus();
            }
	</script>
	
	<!-- nav -->
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


	<!-- datepicker CDN -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
	<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js"></script>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css"> -->

	<!-- js에 전역변수 선언 -->
	<script>
		// 최상위 주소
        const contextPath = "${contextPath}";
        
        // datepicker n박
        const dateRangeR = "${reservation.dateRange}"
        
        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        
        // 주문번호(예약 취소 요청 추가)
        const requestNo = "${reservation.requestNo}"
    </script>

	<!-- nav 메인 js -->
	<script src="${contextPath}/resources/js/main.js"></script>

	<!-- 예약 조회, 예약 취소 내역 조회 검사 -->
	<script src="${contextPath}/resources/js/reservationCheck/datepickCheck.js"></script>
	
	<script src="${contextPath}/resources/js/reservationCancel/reserveCancelRequest.js"></script>

	<!-- datepicker js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />



</body>
</html>