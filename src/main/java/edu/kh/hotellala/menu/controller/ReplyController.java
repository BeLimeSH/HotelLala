package edu.kh.hotellala.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.board.model.service.BoardService;
import edu.kh.hotellala.board.model.vo.Board;
import edu.kh.hotellala.member.model.vo.Member;

@WebServlet("/menu/*")
public class ReplyController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String uri = req.getRequestURI();  //localhost:port/hotellala/menu/location
		  ///community/reply/selectReplyList
		  
	      String contextPath = req.getContextPath(); //localhost:port/hotellala/ menu/  20text
	      ///community
	      												// menu/  
	      String command = uri.substring(  (contextPath + "/menu/").length()  ); 
	      
	      HttpSession session = req.getSession();
	      
	      try {
	    	  String path = null;
	    	  if(command.equals("room")) {
	    		  path = "/WEB-INF/views/menu/room.jsp";
	    	  }
	    	  if(command.equals("faq")) {
	    		  
//	    		 int cd = Integer.parseInt(req.getParameter("type"));
//	    		  System.out.println(req.getParameter("type"));
	    		  int cd = 0;
	    		  
	    		  if(req.getParameter("type")==null){
	    			 cd = 99;
	    		 } else {
	    			 cd = Integer.parseInt( req.getParameter("type"));
	    		 }
	    		  
	    		 BoardService service = new BoardService();
	    		 List<Board> list = service.faqAll(cd);
	    		 req.setAttribute("list", list);

	    		  path = "/WEB-INF/views/menu/faq.jsp";
	    	  }
	    	  
	    	  if(command.equals("qna")) {
	    		  path = "/WEB-INF/views/menu/qna.jsp";
	    	  }
	    	  
	    	  if(command.equals("notice")) {
				int cp = 1;
				if(req.getParameter("cp") != null) {
					cp = Integer.parseInt(req.getParameter("cp"));
				}
				
				BoardService service = new BoardService();  //cp);
				List<Board> list = service.noticeAll();
				
				req.setAttribute("list", list);
				
				path = "/WEB-INF/views/menu/notice.jsp";
	    	  }
	    	  if(command.equals("qnaCheck")) {
	    		  
//	    		Member member = (Member)(session.getAttribute("loginMember"));
//	    		int memberNo = member.getMemberNo();
	    		BoardService service = new BoardService();
	    		List<Board> list = service.qnaCheck(Integer.parseInt(req.getParameter("memberNo")));
	    		req.setAttribute("list", list);
	    		path = "/WEB-INF/views/menu/qnaCheck.jsp";
	    	  }
	    	  
	    	  req.getRequestDispatcher(path).forward(req, resp);
	      }catch (Exception e) {
	    	  e.printStackTrace();
	    	  
	      }
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
