package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservation.model.service.ReservationRequestService;
import edu.kh.hotellala.reservation.model.vo.Payment;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;

@WebServlet("/reservation/complete")
public class ReservationSuccessServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReservationRequestService service = new ReservationRequestService();
		
		Payment payment = new Payment();
		
		try {
			HttpSession session = req.getSession();
			
			ReservationRequest reservation = (ReservationRequest)(session.getAttribute("reservation"));
			
			String requestNo = reservation.getRequestNo();
			
			//결제 수단, 객실 가격, 결제일, 결제 금액
			payment = service.selectPayment(requestNo);
			
			req.setAttribute("payment", payment);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/payment/paymentComplete.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
}
