package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/complete")
public class ReservationSuccessServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//결제 성공했을 때
		
		//reservation -> RESERVATION_REQ 테이블 삽입
		//payment(import에서 보내준 데이터) -> PAYMENT 테이블 삽입
		//adultCount, childCount, extraBed -> 각각 OPTION_ORDER 테이블에 삽입
		
		//예약번호(시퀀스), 주문번호, 결제번호, 플래그('Y'), 타입에 따라 객실번호 달리해서
		//RESERVATION_CHECK에 삽입
		
		//결제 타입이 무통장일때는 PAYMENT_FL, RESERVATION_FL을 'N'으로 삽입
		
		// -> 결제 완료 페이지로 넘어감...
		
		//실패했을때 페이지 안넘어감?
		
		String path = "/WEB-INF/views/payment/paymentComplete.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
}
