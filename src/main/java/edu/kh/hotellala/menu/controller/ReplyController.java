package edu.kh.hotellala.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	      
	      try {
	    	  String path = null;
	    	  if(command.equals("room")) {
	    		  path = "/WEB-INF/views/menu/room.jsp";
	    	  }
	    	  if(command.equals("faq")) {
	    		  path = "/WEB-INF/views/menu/faq.jsp";
	    	  }
	    	  if(command.equals("faq")) {
	    		  path = "/WEB-INF/views/menu/qna.jsp";
	    	  }
	    	  if(command.equals("notice")) {
	    		  path = "/WEB-INF/views/menu/notice.jsp";
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
