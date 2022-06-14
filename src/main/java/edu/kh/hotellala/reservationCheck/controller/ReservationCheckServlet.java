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

@WebServlet("/reservation/check")
public class ReservationCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String requestNo = req.getParameter("requestNo");
		
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		try {

			ReservationCheckService service = new ReservationCheckService();
	
			List<ReservationCheck> list = service.reservationCheck();
			
			
			new Gson().toJson(list, resp.getWriter());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
}
