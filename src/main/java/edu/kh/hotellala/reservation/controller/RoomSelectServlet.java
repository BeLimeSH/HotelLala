package edu.kh.hotellala.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.reservation.model.service.ReservationRequestService;
import edu.kh.hotellala.reservation.model.vo.RoomBoard;

@WebServlet("/room/detail")
public class RoomSelectServlet extends HttpServlet{
	//객실 상세보기 팝업창에 객실 정보 불러올 Servlet
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RoomBoard roomBoard = new RoomBoard();
		ReservationRequestService service = new ReservationRequestService();
		
		try {
			String type = req.getParameter("type");
			
			roomBoard = service.selectRoomDetail(type);
			
			System.out.println(roomBoard);
			
			req.setAttribute("roomBoard", roomBoard);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/room/roomDetail.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
}
