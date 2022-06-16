package edu.kh.hotellala.member.contorller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.member.model.service.MemberService;
import edu.kh.hotellala.member.model.vo.Member;


@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 페이지로 forward
		String path ="/WEB-INF/views/member/login.jsp";
		req.getRequestDispatcher(path).forward(req, resp);

	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 시도
		
		String inputId = req.getParameter("inputId");
		String inputPw = req.getParameter("inputPw");

		System.out.println(inputId);
		System.out.println(inputPw);
	
		
		Member mem = new Member();
		mem.setMemberEmail(inputId);
		mem.setMemberPw(inputPw);
		
		try {
			
			
			MemberService service =new MemberService();
			
			//아이디, 비밀번호 일치하는 회원을 조회하는 서비스 호출 후 반환
			Member loginMember = service.login(mem); 
			
			HttpSession session =req.getSession();
			
			if(loginMember != null) { //로그인 성공 
				
				session.setAttribute("loginMember", loginMember );
				
				//특정 시간동안 요청이 없으면 세션 만료 
				session.setMaxInactiveInterval(3600);//3600초 == 1시간
				
				Cookie c = new Cookie("idSaveCheck", inputId);
				
				
				//아이디 저장이 체크된 경우
				if(req.getParameter("idSaveCheck")!=null) {
					
					// 쿠키 파일을 30일 동안 유지
					c.setMaxAge(60*60*24*30);
					
					
				}else {// 체크 안된 경우
					
					//쿠키 파일을 0초 동안 유지 
					//-> 기존에 존재하던 쿠키 파일에 유지 시간을 0초로 덮어씌움
					//    == 삭제하겠다는 소리
					c.setMaxAge(0);
					
				}
				
				c.setPath(req.getContextPath());
				//req.getContextPath() : 최상위 주소 (/community)
				 
				
				//응답 객체를 이용해서 클라이언트로 전달 
				resp.addCookie(c);
				
			}else { // 로그인 실패 
				session.setAttribute("message", "아이디와 비밀번호가 일치하지 않습니다.");
			}
			
			resp.sendRedirect(req.getContextPath());
			
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	}
}
