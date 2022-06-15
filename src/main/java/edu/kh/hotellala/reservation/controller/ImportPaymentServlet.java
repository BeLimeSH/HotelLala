package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservation.model.service.ReservationRequestService;
import edu.kh.hotellala.reservation.model.vo.OptionCount;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;

@WebServlet("/reservation/impay")
public class ImportPaymentServlet extends HttpServlet {

	//payment 서블릿 -> import 서블릿 -> success 서블릿
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ReservationRequestService service = new ReservationRequestService(); 
		
		try {
			int paymentAmount = Integer.parseInt( req.getParameter("amount") );
			String payType = req.getParameter("payType");
			
			HttpSession session = req.getSession();
			ReservationRequest reservation = (ReservationRequest)(session.getAttribute("reservation"));
			OptionCount op = (OptionCount)(session.getAttribute("op"));
			
			Payment payment = new Payment();
			
			payment.setPaymentAmount(paymentAmount);
			payment.setMemberNo( reservation.getMemberNo() );
			payment.setRequestNo( reservation.getRequestNo() );
			payment.setPayType(payType);
			
			System.out.println(reservation);
			System.out.println(op);
			System.out.println(payment);
			
			int result = service.insertReservation( reservation, payment, op );
			
			
			
			resp.getWriter().print(result); //data
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	
	
	
	
	}
	
	//결제 성공했을 때
	
	//reservation -> RESERVATION 타입에 따라 객실번호 달리해서 테이블에 삽입 (Session에서 얻어오기)
	//adultCount, childCount, extraBed -> 각각 OPTION_ORDER 테이블에 삽입 (Session에서 얻어오기)
	
	//payment(import에서 보내준 데이터) -> PAYMENT 테이블 삽입
	
	
	// -> 결제 완료 페이지로 넘어감...
	
	//실패했을때 페이지 안넘어감?

}
