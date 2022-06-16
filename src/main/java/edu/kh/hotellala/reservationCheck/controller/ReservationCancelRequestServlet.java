package edu.kh.hotellala.reservationCheck.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.member.model.vo.Member;
import edu.kh.hotellala.reservationCheck.model.service.ReservationCheckService;
import edu.kh.hotellala.reservationCheck.model.vo.Refund;

@WebServlet("/reservation/cancelRequest")
public class ReservationCancelRequestServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/reservationCheck/refundReason.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		int refundNo = Integer.parseInt( req.getParameter("refundNo"));
		String refundReason = req.getParameter("refundReason");
		
		try {
			HttpSession session = req.getSession();
			
//			// 회원 번호
//			int memberNo = 0;
//			// 결제 번호
//			int paymentNo = 0;
			
			if(session.getAttribute("loginMember") != null) {
				
				Member member = (Member)(session.getAttribute("loginMember"));
				memberNo = member.getMemberNo();
				
				// VO
				Refund refund = new Refund();
				
				refund.setMemberNo(memberNo);
				refund.setRefundNo(refundNo);
				refund.setRefundReason(refundReason);
				
				if(refund != null) {
					session.setAttribute("refund", refund);
				}
				
				// Service
				ReservationCheckService service = new ReservationCheckService();
				
				int result = service.insertRefund(refund);
				
//				String path = "/WEB-INF/views/reservationCheck/reservationCheck.jsp";				
//				req.getRequestDispatcher(path).forward(req, resp);
				
				// 서비스 호출 결과를 그대로 응답 데이터로 전송
				resp.getWriter().print(result);
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
