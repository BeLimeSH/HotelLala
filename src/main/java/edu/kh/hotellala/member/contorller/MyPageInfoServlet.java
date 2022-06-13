package edu.kh.hotellala.member.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.kh.hotellala.member.model.service.MemberService;
import edu.kh.hotellala.member.model.vo.Member;

@WebServlet("/member/myPage/info")
public class MyPageInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//메인 페이지에서 마이페이지 클릭 시 이동(get)
		String path="/WEB-INF/views/member/myPage-info.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
		//요청발송자를 이용해서 path에 저장되어있는 주소로 요청 위임하겠다/
	}

	//회원 정보 수정 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//파라미터 + 배열-> 문자열로 만들기(주소)
		String memberName = req.getParameter("memberName");
		String memberTel = req.getParameter("memberTel");
		String[] address = req.getParameterValues("memberAddress");
		
		String memberAddress = null;
		
		if(!address[0].equals("")) { // 주소작성 
			memberAddress =String.join(",,",address);			
		}
		
		//세션에서 로그인한 회원 정보 얻어옴
		HttpSession session = req.getSession();
		
		//얕은 복사(회원 정보 객체 주소)
		Member loginMember = (Member)(session.getAttribute("loginMember"));
		//Object타입 -> Member 타입으로 다운캐스팅 
		
		int memberNo = loginMember.getMemberNo();
		
		Member mem = new Member();
		
		mem.setMemberNo(memberNo);
		mem.setMemberName(memberName);
		mem.setMemberTel(memberTel);
		mem.setMemberAddress(memberAddress);
		
		
		try {
			
			MemberService service = new MemberService();
			
			
			int result = service.updateMember(mem);
			
			if(result>0) {
				session.setAttribute("message","정상적으로 수정되었습니다.");
				
				loginMember.setMemberName(memberName);
				loginMember.setMemberTel(memberTel);
				loginMember.setMemberAddress(memberAddress);
				
				
				
			}else {
				session.setAttribute("message", "회원 정보를 다시입력해주세요.");
				
			}

			// 성공/실패 상관 없이 다시 내정보 화면으로 돌아오기
			resp.sendRedirect(req.getContextPath()+"/member/myPage/info");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
