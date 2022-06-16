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
			
//			System.out.println(reservation);
//			System.out.println(op);
//			System.out.println(payment);
			
			int result = service.insertReservation( reservation, payment, op );
			
			resp.getWriter().print(result); //data
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
