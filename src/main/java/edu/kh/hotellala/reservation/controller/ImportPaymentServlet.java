package edu.kh.hotellala.reservation.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/reservation/impay")
public class ImportPaymentServlet extends HttpServlet {

	//payment 서블릿 -> import 서블릿 -> success 서블릿
	
	//결제 성공했을 때
	
	//reservation -> RESERVATION_REQ 테이블 삽입
	//payment(import에서 보내준 데이터) -> PAYMENT 테이블 삽입
	//adultCount, childCount, extraBed -> 각각 OPTION_ORDER 테이블에 삽입
	
	//예약번호(시퀀스), 주문번호, 결제번호, 플래그('Y'), 타입에 따라 객실번호 달리해서
	//RESERVATION_CHECK에 삽입
	
	//결제 타입이 무통장일때는 PAYMENT_FL, RESERVATION_FL을 'N'으로 삽입
	
	// -> 결제 완료 페이지로 넘어감...
	
	//실패했을때 페이지 안넘어감?

}
