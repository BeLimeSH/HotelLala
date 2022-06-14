package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.member.model.service.MemberService;
@WebServlet("/checkNumber")
public class CheckNumberServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String cNumber = req.getParameter("cNumber");
			String inputEmail = req.getParameter("inputEmail");
			
			int result = new MemberService().checkNumber(inputEmail, cNumber);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
