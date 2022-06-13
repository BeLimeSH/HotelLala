package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.member.model.service.MemberService;

@WebServlet("/emailDupCheck")
public class EmailDupCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberEmail = req.getParameter("memberEmail");
		
		try {
			MemberService service = new MemberService();
			
			int result = service.emailDupCheck(memberEmail);
			
			resp.getWriter().print(result);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
