package edu.kh.hotellala.reservationCheck.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;

@WebServlet("/reservation/cancelCheck")
public class ReservationCancelCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 취소 내역 조회
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(  (contextPath + "/cancel/").length()  );
		
		// Service
		ReservationCheckService service = new ReservationCheckService();
		
		try {
			
			if(command.equals("cancel")) {
				
				// 예약 취소 눌렀을 시 관리자 전달
				
				// popup창 띄워서 환불 사유 적어서 전달
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String path = "/WEB-INF/views/reservationCancel/reservationCancel.jsp";
		req.getRequestDispatcher(path).forward(req, resp);

		
		
	}
}
