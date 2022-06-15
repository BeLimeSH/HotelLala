package edu.kh.hotellala.reservationCheck.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import edu.kh.hotellala.reservation.model.vo.ReservationRequest;
import edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;
import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;

@WebServlet("/reservation/check")
public class ReservationCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String path = "/WEB-INF/views/reservationCheck/reservationCheck.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			
			// 파라미터 변수 저장
			String reserveDate = req.getParameter("reserveDate");
			String dateRange = req.getParameter("dateRange");
			
			//reserveDate -> 체크인 날짜 - 체크아웃 날짜 자르기
			Date checkIn = Date.valueOf( reserveDate.substring(0, 10) );
			Date checkOut = Date.valueOf( reserveDate.substring(13, 23) );
			
			// VO
			ReservationRequest reservation = new ReservationRequest();
			
			if(reservation != null) {
				session.setAttribute("reservation", reservation);
			}
			
			/*
			주문번호(X)
			회원번호
			예약상태
			체크인날짜
			체크아웃날짜
			객실종류
			객실호수
			-------
			예약 테이블 모두 출력?
			 */
			reservation.setRequestNo(requestNo);
			reservation.setMemberNo(memberNo);
			reservation.setReservationFlags(reservationFlags);
			reservation.setCheckIn(checkIn);
			reservation.setCheckOut(checkOut);
			reservation.setRoomType(roomType);
			reservation.setRoomNo(roomNo);
			
			
			
			// Service
			ReservationCheckService service = new ReservationCheckService();
			

			// 예약 조회
			List<ReservationRequest> checkList = service.reservationCheck(reservation);
			
			
			req.setAttribute("checkList", checkList);
			
			
			new Gson().toJson(checkList, resp.getWriter());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
