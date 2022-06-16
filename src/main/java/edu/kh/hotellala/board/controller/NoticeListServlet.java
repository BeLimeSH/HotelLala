package edu.kh.hotellala.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.hotellala.board.model.service.BoardService;
import edu.kh.hotellala.board.model.vo.Board;

@WebServlet("/asdfasdfasdfasdfasdfasdfasdfas/")
public class NoticeListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int cp = 1;
//			int cp = Integer.parseInt(req.getParameter("cp"));
			if(req.getParameter("cp") != null) {
				cp = Integer.parseInt(req.getParameter("cp"));
				System.out.println(cp);
			}
			BoardService service = new BoardService();
			List<Board> list = service.noticeAll();
			
			req.setAttribute("list", list);
			
			String path = "/WEB-INF/views/menu/notice.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
