package edu.kh.hotellala.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.qna.model.service.QnaService;
import edu.kh.hotellala.qna.model.vo.Qna;

@WebServlet("/menu/qna")
public class QnaServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/menu/qna.jsp";
		req.getRequestDispatcher(path).forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qnaTitle = req.getParameter("qnaTitle");
		int qnaCd = Integer.parseInt(req.getParameter("qnaCd"));
		String qnaContent = req.getParameter("qnaContent");
		int memberNo = Integer.parseInt(req.getParameter("memberNo"));
		
		System.out.println(memberNo);
		
		Qna q = new Qna();
		q.setQnaTitle(qnaTitle);
		q.setQnaCd(qnaCd);
		q.setQnaContent(qnaContent);
		q.setMemberNo(memberNo);
		try {
			QnaService service = new QnaService();
			
			int result = service.qnA(q);
			
			HttpSession session = req.getSession();
			
			if(result>0) {
				session.setAttribute("message", "QnA 작성이 완료되었습니다.");
			}else {
				session.setAttribute("message", "QnA 작성이 미완료되었습니다.");
			}
			resp.sendRedirect(req.getContextPath());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
