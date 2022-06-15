package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.member.model.service.MemberService;
import edu.kh.hotellala.member.model.vo.Member;

@WebServlet("/member/myPage/secession")
public class MyPageSecessionServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원 탈퇴페이지로 이동 
		String path = "/WEB-INF/views/member/myPage-secession.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//회원탈퇴

		String memberPw = req.getParameter("memberPw");
		
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		
		int memberNo = loginMember.getMemberNo();
		
		try {
			
			
			MemberService service = new MemberService();
			
			int result = service.secession(memberNo , memberPw);
			
			
			String path= null; //리다이렉트
							   // if-else 구문 끝나면 path 경로로
							   // resp.sendReDirect(path);

			
			if(result>0) { // SECESSION_FL = 'Y' 수정 성공 
				
				session.invalidate();// loginMember 무효화 시키기 
				
				session=req.getSession(); //무효화 후 새로운 세션 얻어옴 
				
				session.setAttribute("message", "탈퇴 신청이 완료되었습니다.");
				
				resp.sendRedirect(req.getContextPath());//최상위 주소 
//				path= req.getContextPath(); // 메인페이지
				
			}else { //실패 
				session.setAttribute("message", "비밀번호를 다시 입력해주세요.");
		
				path=req.getContextPath()+"/member/myPage/secession";
				resp.sendRedirect(path);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
