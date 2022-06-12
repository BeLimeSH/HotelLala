package edu.kh.hotellala.reservation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.reservation.model.vo.ReservationRequest;

@WebServlet("/reservation/room")
public class ReservationRequestServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//화면 불러오기
		String path = "/WEB-INF/views/reservation/reservationRoom.jsp";
		
		//남는 객실 조회
		
		//객실 + 날짜 값 입력받아오기
		//2022/06/12 - 2022/06/13
		
		//옵션 번호 여기서 정해서 넣어놓기
		
		//전달된 파라미터 변수에 저장
		String reserveDate = req.getParameter("reserveDate");
		String dateRange = req.getParameter("dateRange");
		int adultCount = Integer.parseInt( req.getParameter("adultCount") );
		int childCount = Integer.parseInt( req.getParameter("childCount") );
		
		//reserveDate -> 체크인 날짜 - 체크아웃 날짜 자르기
		Date checkIn = Date.valueOf( reserveDate.substring(0, 10) );
		Date checkOut = Date.valueOf( reserveDate.substring(13, 23) );
		
		ReservationRequest reservation = new ReservationRequest();
		
		reservation.setCheckIn(checkIn);
		reservation.setCheckOut(checkOut);
		reservation.setDateRange(dateRange);
		reservation.setAdultCount(adultCount);
		reservation.setChildCount(childCount);
		
		System.out.println(reservation);
				
		try{
			//Session 객체 얻어오기
			HttpSession session = req.getSession();
			
			//1시간 후 만료
			session.setMaxInactiveInterval(3600);
			
			if(reservation != null) {
				session.setAttribute("reservation", reservation);
			}

			req.getRequestDispatcher(path).forward(req, resp);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}
	
}
