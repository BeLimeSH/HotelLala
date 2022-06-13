package edu.kh.hotellala.reservationCheck.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;
import edu.kh.hotellala.reservationCheck.model.vo.ReservationCheck;

@WebServlet("/reservationCheck/cancel")
public class ReservationCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String reservationNo = req.getParameter("reservationNo");
		
		try {

			ReservationCheckService service = new ReservationCheckService();
	
			List<ReservationCheck> list = service.reservationCheck();
			
			
			// new Gson().toJson(list, resp.getWriter());
			
			String path = "/WEB-INF/views/reservationCheck/reservationCheck.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
}
