package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/payment")
public class ReservationPaymentServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/payment/paymentRequest.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
		//주문번호는 여기서 만들려무나
	}

}
