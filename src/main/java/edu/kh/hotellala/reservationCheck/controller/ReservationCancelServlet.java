package edu.kh.hotellala.reservationCheck.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;

@WebServlet("/reservationCheck/cancel")
public class ReservationCancelServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int requestNo = Integer.parseInt(req.getParameter("requestNo"));
			
			int result = new ReservationCheckService().reserveCancel(requestNo);
			
			HttpSession session = req.getSession();
			
			String path = null;
			String message = null;
			
			// 취소 성공
			if(result > 0) {
				message = "예약이 취소되었습니다.";
			}else { // 실패 시
				message = "예약 취소 요청에 실패하였습니다.";
				path = req.getHeader("");
				// -> 이전 페이지(예약 조회 페이지 이동)
			}
			
			session.setAttribute("message", message);
			
			resp.sendRedirect(path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
