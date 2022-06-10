package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/date")
public class ReservationDateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/reservation/reservationDate.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
		//세션에 값 저장 -> 예약하기 버튼 누를때 세션 값 초기화(메인 페이지 or nav만)
		
	}

}
