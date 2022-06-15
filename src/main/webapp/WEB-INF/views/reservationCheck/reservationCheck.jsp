<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 조회</title>


<link rel="stylesheet" href="${contextPath}/resources/css/reservationCheck.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/main-style.css" type="text/css">
<link rel="shortcut icon" href="/HotelLala/resources/images/wIcon.ico">
<link rel="shortcut icon" href="${contextPath}/resources/images/logo-icon-black.png">

<script src="https://kit.fontawesome.com/1ef9913073.js" crossorigin="anonymous"></script>



</head>
<body>

	<!-- header -->
	<a href="${contextPath}" class="hotelLogo"> <img src="${contextPath}/resources/images/logo/logo-black.png" alt="logo">
	</a>

	<!-- nav -->
	<jsp:include page="/WEB-INF/views/common/nav.jsp" />


	<main>
		<!-- 조회 탭 -->
		<section class="myPage-content">

			<!-- 왼쪽 사이드(마이페이지) 메뉴 -->
			<section class="left-side">
				<div class="myPageMenu">
					<h2 class="tit">
						<a>마이페이지</a>
					</h2>
					<ul class="list-group">
						<li class=""><a href="#">예약 확인</a></li>
						<li class=""><a href="#">예약 취소 조회</a></li>
					</ul>
					<br>

					<ul class="list-group">
						<h2 class="tit">
							<a>내 정보</a>
						</h2>

						<li class="my"><a href=""> <span>프로필 수정</span>
						</a></li>
						<li class="my"><a href=""> <span>비밀번호 변경</span>
						</a></li>
						<li class="my"><a href=""> <span>로그아웃</span>
						</a></li>
						<li class="my"><a href=""> <span>회원탈퇴</span>
						</a></li>
					</ul>

				</div>
			</section>

			<!-- 오른쪽 예약 확인 주요 내용 부분 -->
			<section class="myPage-main">
				<h1 class="myPage-title">예약 확인</h1>
				<div class="rsv-Underline"></div>
				<span class="rsv-explanation">객실 예약 내역을 확인하실 수 있습니다.</span><br>


				<!-- form 태그 -->
				<form action="check" method="POST" id="reserveSearchBtn"" onsubmit="return reserveSearchValidate()">

					<div class="contain">
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
							<div class="myRsv title">
								<h4 class="tit2">
									<a>객실 예약</a>
								</h4>
							</div>


							<table summary=" 주문번호, 회원번호, 예약상태, 체크인날짜, 체크아웃날짜 객실번호로 구성된 리스트 표" class="rsvList">
								<thead>
									<tr>
										<td>주문번호
										</th>
										<td>회원번호
										</th>
										<td>체크인
										</th>
										<td>체크아웃
										</th>
										<td>객실번호
										</th>
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
																<th class="reserve-check-content">${reserve.requestNo}</td>
																<th class="reserve-check-content">${reserve.memberNo}</td>
																<th class="reserve-check-content">${reserve.checkIn}</td>
																<th class="reserve-check-content">${reserve.checkOut}</td>
																<th class="reserve-check-content">${reserve.roomNo}</td>
															</tr>
														</table>
													</c:forEach>
												</ul>

											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<br>
							</div>
						</div>
					</div>
				</form>

				<!-- 로그인 회원의 회원번호와 예약 테이블의 회원 번호가 일치해야 예약 취소 수행 가능 -->
				<c:if test="${loginMember.memberNo == reservation.memberNo}">
					<div class="cancel-btn-area">
						<%--<button class="w-btn-outline w-btn-blue-outline" id="cancelBtn" type="button">예약 취소</button> --%>

						<!-- 취소 버튼 클릭 시 팝업 창 -->
						<table id="datatable-scroller" class="table table-striped table-bordered text-center">
							<colgroup>
								<col width="50%">
								<col width="100%"
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td style="text-align: center;">
										<button onclick="${contextPath}/html/popupTest.html" class="w-btn-outline w-btn-blue-outline" id="cancelBtn" type="button">예약 취소</button> 
										<a href="javascript:void(0);" onclick="popupOpen();" id="cancelBtn" class="table table-striped table-bordered text-center">취소요청</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</c:if>

			</section>

		</section>

	</main>

	<!-- 예약 취소 클릭 시 출력되는 팝업 창 용 스크립트 -->
	<script type="text/javascript">
            function popupOpen(){
                //var popUrl = "${contextPath}/html/popupTest.html";
                var popOption = "width=1200, height=600, resizable=no, scrollbars=no, status=no;";
                var p = window.open(popUrl, "popup1", popOption);
                p.focus();
            }
	</script>
	
	
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


	<script>
        const contextPath = "${contextPath}";
    </script>

	<!-- nav 메인 js -->
	<script src="${contextPath}/resources/js/main.js"></script>

	<!-- 예약 조회, 예약 취소 내역 조회 검사 -->
	<script src="${contextPath}/resources/js/reservationCheck/datepickCheck.js"></script>

	<!-- datepicker js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<!-- js에 전역변수로 contextPath 선언 -->
	<script>
        /* const contextPath = "${contextPath}"; */
        const dateRangeR = "${reservation.dateRange}";
        const loginMemberNo = "${loginMember.memberNo}";
    </script>



</body>
</html>