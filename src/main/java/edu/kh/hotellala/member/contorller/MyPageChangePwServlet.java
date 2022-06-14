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

@WebServlet("/member/myPage/changePw")
public class MyPageChangePwServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path="/WEB-INF/views/member/myPage-changePw.jsp";
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	
	//비밀번호 변경 post 방식 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터 
		String currentPw = req.getParameter("currentPw");
		String newPw = req.getParameter("newPw");
		
		// 암호화 확인하기 
		//System.out.println(currentPw); -> 콘솔창에 나오는것 확인하기!
		
		// 로그인 번호 얻어오기 위해 session
		HttpSession session = req.getSession();

		// 로그인 정보		//다운캐스팅
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		
		
		int memberNo = loginMember.getMemberNo();//로그인 회원 번호
		
		String path =null; // 리다이렉트 주소
		
		// 매개 변수로 하나하나 전달 
		try {
			
			MemberService service = new MemberService();
			
			int result = service.changePw(currentPw, newPw, memberNo);
			
			if(result>0) { // 비밀번호 성공 시
				// session scope = key:message / value: 비밀번호가 변경되었습니다.
				// path = "내정보 페이지 주소"
				session.setAttribute("message", "비밀번호가 변경되었습니다.");
				path =req.getContextPath();
				//+ "/member/myPage/예약 현황 페이지 or 내정보수정 "; // 페이지로 이동 
			}else { // 실패 시
				// session scope = key:message / value: 현재 비밀번호가 일치하지않습니다.
				// paht= "비밀번호 변경 페이지 주소"
				session.setAttribute("message", "현재 비밀번호가 일치하지않습니다.");
				path=req.getContextPath() + "/member/myPage/changePw";
				//path="changePw"; -> 상대경로
			}
			
			resp.sendRedirect(path);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
