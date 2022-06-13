package edu.kh.hotellala.member.model.service;


import static edu.kh.hotellala.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.hotellala.member.model.dao.MemberDAO;
import edu.kh.hotellala.member.model.vo.Member;

public class MemberService {
	private MemberDAO dao = new MemberDAO();


	/** 로그인 Service 
	 * @param mem
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member mem) throws Exception {
		Connection conn = getConnection();
		
		Member loginMember=dao.login(conn,mem);
		
		close(conn);
		
		return loginMember ;
	}


	/** 회원가입 Service
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member mem) throws Exception {
		
		Connection conn = getConnection();
		int result = dao.signUp(conn,mem);
		
		if(result>0) commit(conn);
		else		rollback(conn);
		
		close(conn);
		return result;
	}


	/**비밀번호 변경 
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result 
	 * @throws Exception
	 */
	public int changePw(String currentPw, String newPw, int memberNo) throws Exception {
	
		Connection conn = getConnection();
		
		int result = dao.changePw(conn, currentPw, newPw, memberNo);
		
		if(result>0) commit(conn);
		else 		 rollback(conn);
		
		close(conn);
		
		return result;
	}


	/** 이메일 중복 검사 Service
	 * @param memberEmail
	 * @return result
	 * @throws Exception
	 */
	public int emailDupCheck(String memberEmail) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.emailDupCheck(conn, memberEmail);
		
		close(conn);
		
		return result;
	}
}
