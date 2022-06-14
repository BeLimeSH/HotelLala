package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//로그아웃
		
		//Session scop에 세팅된 회원 정보 없애기
		
		HttpSession session = req.getSession();
		
		//회원 정보 무효화 시키기
		session.invalidate();
		
		//메인 페이지로 돌아가기
		//redirect : 메인 페이지로 재요청
		resp.sendRedirect(req.getContextPath());//최상위 주소 
	
	}
}
