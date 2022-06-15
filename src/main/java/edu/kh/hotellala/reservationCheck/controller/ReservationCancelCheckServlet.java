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
		
		String path = "/WEB-INF/views/reservationCancel/reservationCancel.jsp";
		req.getRequestDispatcher(path).forward(req, resp);

		
		
	}
}
