package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservation.model.service.ReservationRequestService;
import edu.kh.hotellala.reservation.model.vo.ReservationRequest;

@WebServlet("/reservation/payment")
public class ReservationPaymentServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//payment?adultBreakfast=2&childBreakfast=1&extraBed=0&extraRequest=힝구
		//req.getParameter("");
		
		// 옵션 테이블에 사용할 값들
		int adultBreakfast = Integer.parseInt( req.getParameter("adultBreakfast") );
		int childBreakfast = Integer.parseInt( req.getParameter("childBreakfast") );
		int extraBed = Integer.parseInt( req.getParameter("extraBed") );
		
		// session에 저장해 둘 값
		String extraRequest = req.getParameter("extraRequest");
		
		ReservationRequestService service = new ReservationRequestService();
		
		try {
			HttpSession session = req.getSession();
			ReservationRequest reservation = (ReservationRequest)(session.getAttribute("reservation"));
			
			reservation.setExtraRequest(extraRequest);
			
			String type = reservation.getRoomType();
			
			System.out.println(reservation);
			
			//페이지 만들 때 필요한 값
			// 객실가격*dateRange, 옵션 수량, 옵션수량*가격
			int roomRates = service.selectRates(type);
			
			req.setAttribute("roomRates", roomRates);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/payment/paymentRequest.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	

}
