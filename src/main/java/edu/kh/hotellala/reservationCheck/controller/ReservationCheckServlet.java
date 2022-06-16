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

import edu.kh.hotellala.member.model.vo.Member;
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
			String reserveDate = req.getParameter("reserveDate"); // 시작~종료 일
			
			String dateRange = req.getParameter("dateRange"); // n 박
			
			//reserveDate -> 체크인 날짜 - 체크아웃 날짜 자르기
			Date checkIn = Date.valueOf( reserveDate.substring(0, 10) );      // 시작 일(2022-06-15)
			Date checkOut = Date.valueOf( reserveDate.substring(13, 23) ); // 종료 일(2022-06-16)
			
			
			System.out.println(checkIn);
			System.out.println(checkOut);
			
			// 회원 번호
			int memberNo = 0;
		
			if(session.getAttribute("loginMember") != null) {
				
				Member member = (Member)(session.getAttribute("loginMember"));
				memberNo = member.getMemberNo();
				
				// VO
				ReservationRequest reservation = new ReservationRequest();
				
				reservation.setMemberNo(memberNo);
				
				reservation.setReserveDate(reserveDate);
				reservation.setDateRange(dateRange);
				
				reservation.setCheckIn(checkIn);
				reservation.setCheckOut(checkOut);
				
				
				if(reservation != null) {
					session.setAttribute("reservation", reservation);
				}
				
				
				// Service
				ReservationCheckService service = new ReservationCheckService();
				

				// 예약 조회
				List<ReservationRequest> checkList = service.reservationCheck(reservation, checkIn, checkOut);
				
				
				req.setAttribute("checkList", checkList);
				
				
				//new Gson().toJson(checkList, resp.getWriter());
				String path = "/WEB-INF/views/reservationCheck/reservationCheck.jsp";
				req.getRequestDispatcher(path).forward(req, resp);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
