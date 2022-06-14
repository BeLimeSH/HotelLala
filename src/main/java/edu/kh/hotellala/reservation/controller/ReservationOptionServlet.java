package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.reservation.model.service.ReservationRequestService;

@WebServlet("/reservation/option")
public class ReservationOptionServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//쿼리스트링 type 얻어오기
		String type = req.getParameter("type");
		
		ReservationRequestService service = new ReservationRequestService();
		
		try {
			
			int roomRates = service.selectRates(type);
			
			if(roomRates != 0) {
				req.setAttribute("roomRates", roomRates);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/reservation/reservationOption.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//옵션 값 입력 받아오기
		
		
		
	}

}
