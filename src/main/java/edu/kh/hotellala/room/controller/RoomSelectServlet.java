package edu.kh.hotellala.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/room/detail")
public class RoomSelectServlet extends HttpServlet{
	//객실 상세보기 팝업창에 객실 정보 불러올 Servlet
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/room/roomDetail.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
}
